#!/bin/bash
# Script de snapshot pour la sauvegarde de mes données
# d'après http://www.mikerubel.org/computers/rsync_snapshots/
# 150519 : 0.2	Backup temporaire pour supporter un crash
# 100720 : 0.1	Version initiale
# Utilisation : $0 [daily|weekly|monthly] à mettre en crontab
# respectivement chaque jour/lundi/1er du mois à heure fixe (e.g. 4h) 
# weekly et monthly ne font que copier le dernier daily et peuvent
# être lancés plus tard dans la journée

# Indice max à conserver pour chaque fréquence (démarre à 0)
DAILY_MAX=6
WEEKLY_MAX=4
MONTHLY_MAX=6

# Commandes
#--
RSYNC=/usr/bin/rsync;

# Emplacements
#--
SNAPSHOT_RW=/mnt/backup/snapshot;
EXCLUDES=/root/scripts/snapshot_exclude.txt;
# Ne pas mettre de / à la fin des répertoires sinon leur contenu
# sera copié en vrac à la racine !
TOBACKUP=(/home /etc /boot /var /usr /root);

# Le script
#--
# Vérifie qu'on est root
[ `id -u` != 0 ] && { echo "Sorry, must be root. Exiting..."; exit 1; }

# Vérifie que le répertoire de snapshot existe/est monté
[ -d "$SNAPSHOT_RW" ] || { echo "Missing directory: $SNAPSHOT_RW"; exit 1; }

# Nbre de snapshots à conserver
TYPE=$1
case $TYPE in
	daily)
		MAX=$DAILY_MAX
		;;
	weekly)
		MAX=$WEEKLY_MAX
		;;
	monthly)
		MAX=$MONTHLY_MAX
		;;
	*)
		echo "Usage: $0 [daily|weekly|monthly]"
		exit 1
		;;
esac
SNAP="$SNAPSHOT_RW/$TYPE"

# step 1: rsync from the system into the latest snapshot (notice that
# rsync behaves like cp --remove-destination by default, so the destination
# is unlinked first.  If it were not so, this would copy over the other
# snapshot(s) too!
# NB : weekly and monthly snapshots are just copies of the latest daily
# NB : le parcours de TOBACKUP est fait par index pour préserver des chaînes
# contenant des espaces
case $TYPE in
	daily)
		# make sure we have SNAP.0 so that --link-dest will be able to
		# make a hard-link-only (except for dirs) copy of the latest snapshot
		[ -d "$SNAP.0" ] || mkdir "$SNAP.0"

		for ((i=0; i<${#TOBACKUP[@]}; i++)) ; do
			x="${TOBACKUP[$i]}"
			mkdir -p "$SNAP$x"
			$RSYNC					\
				-a --delete --delete-excluded	\
				--link-dest="../$TYPE.0"	\
				--exclude-from="$EXCLUDES"	\
				--no-inc-recursive		\
				"$x" "$SNAP" #-v
		done

		# free memory
		sync; echo 3 >/proc/sys/vm/drop_caches
		;;
	*)
		[ -d "$SNAPSHOT_RW/daily.0" ] && cp -al "$SNAPSHOT_RW/daily.0" "$SNAP"
		;;
esac

# step 2: delete the oldest snapshot, if it exists
[ -d "$SNAP.$MAX" ] && rm -rf "$SNAP.$MAX"

# step 3: shift the middle snapshots(s) back by one, if they exist
for i in `seq $(($MAX - 1)) -1 0`; do
	[ -d "$SNAP.$i" ] && mv "$SNAP.$i" "$SNAP.$(($i + 1))"
done

# step 4: rename temp snapshot and update mtime to reflect the snapshot time
mv "$SNAP" "$SNAP.0"
touch "$SNAP.0"

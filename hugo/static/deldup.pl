#!/usr/bin/perl -w
# deldup.pl 1.2
# Eliminate duplicates in a UNIX mailbox, relying on a checksum of the body.
# Backup your mailbox before applying! Use at your own risk.
# (c)2003 JM Grimaldi <jm@via.ecp.fr>

use String::CRC32;
use Mail::Box::Manager;
use strict;

my $fn = $ARGV[0] || die <<EOF;
Usage: $0 filename
EOF

$| = 1;	# unbuffered print

print "Parsing $fn...$/";
my $mgr = new Mail::Box::Manager;
my $folder = $mgr->open(folder => $fn, access => 'rw', trace => 'ERROR');

my %mem = ();	# hash to write encountered checksums
my ($cparsed,$cdeleted) = (0,0);	# counters

for my $msg (@$folder) {		# for each message
	my $id = $msg->get('Message-ID');	# 'Message-ID' header
	my $sum = crc32($msg->body);		# message body checksum
	if (exists $mem{$sum}) {
		print "$/Deleting $id (".$msg->subject.") which is identical to $mem{$sum}$/";
		$msg->delete;
		$cdeleted++;
	} else {$mem{$sum} = $id}
	print '.';
	$cparsed++;
}
$folder->close;
print "$/$cparsed messages parsed, $cdeleted deleted.$/";

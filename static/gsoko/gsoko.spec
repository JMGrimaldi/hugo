Summary: Clone of the Sokoban game
Summary(sv): Klon av spelet Sokoban
%define name gsoko
Name: %{name}
%define version 0.4
Version: %{version}
Copyright: GPL
Group: Amusements/Games
Release: 1
Source: http://www.via.ecp.fr/~jm/gsoko/%{name}-%{version}-src.tar.gz
BuildRoot: %{_tmppath}/%{name}
URL: http://www.via.ecp.fr/~jm/%{name}.html

%define desktopdir %{_sysconfdir}/X11/applnk/Games

%description
gSoko is a gtk+ clone of the famous Sokoban game.  The goal of the
game is to push all the boxes on the squares with a red pattern.

%description -l sv
gSoko är en gtk+-klon av det berömda spelet Sokoban.  Spelets syfte är
att knuffa alla lådor till rutorna med ett rött mönster.

%prep
%setup -q -n %{name}

%build
make DATADIR='"%{_datadir}/%{name}"'

%install
%{__mkdir_p} %{buildroot}%{_bindir}
%{__install} %{name} %{buildroot}%{_bindir}
%{__mkdir_p} %{buildroot}%{_datadir}/%{name}
%{__cp} -R img levels %{buildroot}%{_datadir}/%{name}
%{__mkdir_p} %{buildroot}%{desktopdir}
%{__cp} rpm/%{name}.desktop %{buildroot}%{desktopdir}

%clean
%{__rm} -rf %{buildroot}

%files
%defattr(-,root,root)
%doc CHANGES README
%{_bindir}/%{name}
%{_datadir}/%{name}
%{desktopdir}/%{name}.desktop

%changelog
* Wed Jul 17 2002 Göran Uddeborg <goeran@uddeborg.pp.se> 0.4-1
- New version from Jean-Michel.

* Fri Jul 12 2002 Göran Uddeborg <goeran@uddeborg.pp.se> 0.3-1
- First RPM packaging.

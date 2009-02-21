# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvs/lportage/media-tv/mythtv/files/mythtv.logrotate.d,v 1.1 2009-02-21 01:51:37 randomdan Exp $

/var/log/mythtv/mythbackend.log /var/log/mythtv/mythfrontend.log {
rotate 5
weekly
create 660 mythtv video
notifempty
sharedscripts
missingok
postrotate
/bin/kill -HUP `cat /var/run/mythbackend.pid`
endscript
}

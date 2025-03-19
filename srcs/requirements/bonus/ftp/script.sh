#!/bin/sh
chmod 757 /var/www/html/.
echo "script tourne"
ls -la /var/www/html/
/usr/sbin/vsftpd /etc/vsftpd.conf

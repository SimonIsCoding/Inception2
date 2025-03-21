#!/bin/sh

mkdir -p /var/www/html

# Créer le répertoire sécurisé requis par vsftpd
mkdir -p /var/run/vsftpd/empty

# Ajouter un utilisateur FTP avec accès à /var/www/html
useradd -m -d /var/www/html -s /bin/bash "${FTP_USER}"
echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd

#We give the permissions to FTP_USER to write, read and execute on the html folder
#Very important if you want to use Filezilla and transfer files 
chmod 757 /var/www/html/.

/usr/sbin/vsftpd /etc/vsftpd.conf

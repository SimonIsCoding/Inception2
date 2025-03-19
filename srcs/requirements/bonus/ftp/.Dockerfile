FROM debian:bullseye

# Installer vsftpd et autres outils nécessaires
RUN apt update && apt install -y vsftpd openssh-client

RUN	mkdir -p /var/www/html
RUN	chmod 757 /var/www/html/.
# Ajouter un utilisateur FTP avec accès à /var/www/html
RUN useradd -m -d /var/www/html -s /bin/bash ftpuser && \
    echo "ftpuser:password" | chpasswd

# Copier le fichier de configuration de vsftpd
COPY ./conf/vsftpd.conf /etc/vsftpd.conf

# Donner les bons droits d'accès
RUN mkdir -p /var/www/html && \
	chmod 757 /var/www/html/. && \
    chown -R ftpuser:www-data /var/www/html
#	usermod -aG www-data ftpuser

# Créer le répertoire sécurisé requis par vsftpd
RUN mkdir -p /var/run/vsftpd/empty
RUN	echo "\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\n\n"
RUN	chmod 757 /var/www/html/.
RUN	echo "exit status: " && echo $?
RUN	echo "\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\n\n"
COPY	./script.sh .
RUN		chmod +x script.sh
# Exposer les ports FTP
EXPOSE 20 21

# Démarrer vsftpd
CMD	["./script.sh"]
#CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]

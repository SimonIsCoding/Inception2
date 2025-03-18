FROM debian:bullseye

# Installer vsftpd et autres outils nécessaires
RUN apt update && apt install -y vsftpd openssh-client

# Ajouter un utilisateur FTP avec accès à /var/www/html
RUN useradd -m -d /var/www/html -s /bin/bash ftpuser && \
    echo "ftpuser:password" | chpasswd

# Copier le fichier de configuration de vsftpd
COPY ./conf/vsftpd.conf /etc/vsftpd.conf

# Donner les bons droits d'accès
RUN mkdir -p /var/www/html
#    chown -R ftpuser:www-data /var/www/html
#   chmod -R 775 /var/www/html
# usermod -aG www-data ftpuser

# Créer le répertoire sécurisé requis par vsftpd
RUN mkdir -p /var/run/vsftpd/empty

# Exposer les ports FTP
EXPOSE 20 21

# Démarrer vsftpd
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]

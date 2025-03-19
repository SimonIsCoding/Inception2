FROM debian:bullseye

RUN apt update && apt install -y vsftpd openssh-client

RUN mkdir -p /var/www/html && \
    chmod 757 /var/www/html

# Ajouter un utilisateur FTP avec accès à /var/www/html
RUN useradd -m -d /var/www/html -s /bin/bash ftpuser && \
    echo "ftpuser:password" | chpasswd && \
    usermod -aG www-data ftpuser

# Copier le fichier de configuration de vsftpd
COPY ./conf/vsftpd.conf /etc/vsftpd.conf

# Créer le répertoire sécurisé requis par vsftpd
RUN mkdir -p /var/run/vsftpd/empty

COPY ./script.sh /usr/local/bin/script.sh
RUN chmod +x /usr/local/bin/script.sh

# Exposer les ports FTP
EXPOSE 20 21

# Démarrer vsftpd en utilisant le script
CMD ["/usr/local/bin/script.sh"]


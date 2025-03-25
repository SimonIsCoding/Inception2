FROM debian:bullseye-slim

RUN apt update && apt install -y vsftpd openssh-client

# Copier le fichier de configuration de vsftpd
COPY ./conf/vsftpd.conf /etc/vsftpd.conf

COPY ./script.sh /usr/local/bin/script.sh
RUN chmod +x /usr/local/bin/script.sh

# Exposer les ports FTP
EXPOSE 20 21

# Démarrer vsftpd en utilisant le script
CMD ["/usr/local/bin/script.sh"]


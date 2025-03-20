FROM debian:bullseye-slim

# Installer Fail2Ban et les dépendances
RUN apt-get update && apt-get install -y \
    fail2ban iptables \
    && rm -rf /var/lib/apt/lists/*

# Copier la configuration personnalisée si nécessaire
COPY jail.local /etc/fail2ban/jail.local

# Exposer les logs pour le suivi
VOLUME /var/log

# Démarrer Fail2Ban
CMD ["fail2ban-server", "-f"]

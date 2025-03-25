# Utiliser une image Debian spécifique pour un conteneur léger
#FROM	debian:bullseye-slim

# Définir la version spécifique de cAdvisor
#ENV		CADVISOR_VERSION=v0.52.1

# Installer les dépendances nécessaires
#RUN		apt-get update && apt-get install -y \
#		curl \
#		ca-certificates \
#		&& rm -rf /var/lib/apt/lists/*

# Télécharger et installer cAdvisor
#RUN		curl -L https://github.com/google/cadvisor/releases/download/${CADVISOR_VERSION}/cadvisor -o /usr/bin/cadvisor \
#   	&& chmod +x /usr/bin/cadvisor

# Exposer le port utilisé par cAdvisor
#EXPOSE	9090

# Définir l'entrée principale
#ENTRYPOINT ["/usr/bin/cadvisor"]

# Base image
FROM 		debian:bullseye

# Update and upgrade system & install wget
RUN 		apt -y update && apt -y upgrade
RUN 		apt -y install wget

# Change working directory
WORKDIR		/usr/local/bin

# Download and install cAdvisor
RUN 		wget https://github.com/google/cadvisor/releases/download/v0.39.0/cadvisor
RUN 		chmod +x cadvisor

# Execute cAdvisor
ENTRYPOINT	[ "cadvisor" ]

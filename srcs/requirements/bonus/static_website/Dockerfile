FROM debian:bullseye-slim

# Étape 2 : Installer les dépendances nécessaires
RUN apt update && apt install -y \
    curl \
    ca-certificates \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt install -y nodejs \
    && npm install -g npm \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# Définir le dossier de travail dans le conteneur
WORKDIR /app

# Copier les fichiers de configuration
COPY package.json ./

# Installer les dépendances
RUN npm install

# Copier le reste des fichiers (index.html, server.js, etc.)
COPY . .

# Exposer le port 3000
EXPOSE 3000

# Définir la commande de démarrage
ENTRYPOINT ["npm", "start"]

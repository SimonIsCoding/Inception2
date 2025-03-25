# Étape 1 : Utiliser une image Node.js officielle
FROM node:18-alpine

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

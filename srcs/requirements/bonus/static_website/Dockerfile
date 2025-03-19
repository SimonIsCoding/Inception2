# Utiliser une image Nginx officielle
FROM nginx:alpine

# Supprimer la config par défaut de Nginx
RUN rm -rf /usr/share/nginx/html/*

# Copier le site statique dans le conteneur
COPY html /usr/share/nginx/html

# Exposer le port 80 (celui utilisé par Nginx à l'intérieur du conteneur)
EXPOSE 80

# Lancer Nginx
CMD ["nginx", "-g", "daemon off;"]


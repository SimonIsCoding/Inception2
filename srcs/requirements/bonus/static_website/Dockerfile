# Utiliser une image Nginx officielle
#FROM	debian:bullseye
FROM	nginx:alpine
#RUN		apt update && apt upgrade -y && apt install -y nginx
# Supprimer la config par défaut de Nginx
RUN		rm -rf /usr/share/nginx/html/*

# Copier le site statique dans le conteneur
COPY	html /usr/share/nginx/html

EXPOSE	80

CMD		["nginx", "-g", "daemon off;"]

FROM	nginx:alpine

RUN		rm -rf /usr/share/nginx/html/*

# Copier le site statique dans le conteneur
COPY	./static_website_files/index.html /usr/share/nginx/html/.

EXPOSE	80

CMD		["nginx", "-g", "daemon off;"]

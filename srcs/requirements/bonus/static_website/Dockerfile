FROM	nginx:alpine

RUN		rm -rf /usr/share/nginx/html/*

# Copier le site statique dans le conteneur
COPY	./static_website_files/index.html /usr/share/nginx/html/.

#COPY 	script.sh /usr/local/bin/
#RUN		chmod +x /usr/local/bin/script.sh

EXPOSE	80

#CMD		["/usr/local/bin/script.sh"]
CMD		["nginx", "-g", "daemon off;"]

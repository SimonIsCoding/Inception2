FROM	debian:bullseye-slim

RUN		apt update && apt upgrade -y && apt install -y nginx openssl
RUN 	mkdir -p /etc/nginx/ssl && \
	    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	    -keyout /etc/nginx/ssl/nginx.key \
	    -out /etc/nginx/ssl/nginx.crt \
	    -subj "/C=ES/L=Barcelona/CN=$DOMAIN_NAME"

COPY	default /etc/nginx/sites-available/.

EXPOSE	443

CMD		["nginx", "-g", "daemon off;"]

FROM	debian:bullseye

RUN		apt update && apt upgrade && apt install -y nginx
RUN		echo "before copying"
COPY	default /etc/nginx/sites-available/.
RUN		echo "after copying"
RUN		cat /etc/nginx/sites-available/default

CMD		["nginx", "-g", "daemon off;"]

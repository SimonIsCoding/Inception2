FROM	debian:bullseye

RUN		apt update && apt install -y php-cli php-mysqli php-pdo php-json php-gd php-mbstring wget 

WORKDIR /var/www/html

RUN		wget -O index.php https://www.adminer.org/latest.php

EXPOSE	8080

CMD 	["php", "-S", "0.0.0.0:8080"]

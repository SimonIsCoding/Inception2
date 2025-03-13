FROM 	debian:bullseye

RUN		apt update && apt upgrade && apt install -y php-fpm
#RUN which php-fpm || ls /usr/sbin/
RUN 	mkdir -p /run/php /var/www/html && \
    	chown -R www-data:www-data /run/php /var/www/html && \
    	chmod -R 755 /var/www/html

COPY	www.conf /etc/php/7.4/fpm/pool.d/.

CMD		["php-fpm7.4", "-F"]

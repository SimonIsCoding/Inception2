#!/bin/bash
cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=wordpress --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb --allow-root
#./wp-cli.phar config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=localhost --title=inception --admin_user=$WP_USER --admin_password=$WP_PASSWORD --admin_email=simarcha@42.fr --allow-root
#./wp-cli.phar core install --url=localhost --title=inception --admin_user=wpuser --admin_password=password --admin_email=simarcha@42.fr --allow-root

php-fpm7.4 -F

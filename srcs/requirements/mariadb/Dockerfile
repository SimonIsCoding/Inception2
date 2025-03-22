FROM	debian:bullseye

ARG 	WP_USER
ARG		WP_PASSWORD

ENV		WP_USER=${WP_USER}
ENV		WP_PASSWORD=${WP_PASSWORD}

RUN		apt update && apt upgrade -y && apt install -y mariadb-server

COPY	50-server.cnf	/etc/mysql/mariadb.conf.d/.
COPY	init.sql	/etc/mysql/init.sql
COPY	script.sh	.

RUN		mkdir -p /run/mysqld
RUN		chmod +x script.sh

CMD		["./script.sh"]

FROM	debian:bullseye

RUN		apt update && apt upgrade -y && apt install -y redis
COPY	./redis.conf	/etc/redis.conf

CMD		["redis-server", "/etc/redis.conf"]

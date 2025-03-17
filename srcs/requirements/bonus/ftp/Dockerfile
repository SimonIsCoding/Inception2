FROM	debian:bullseye

RUN		apt update && apt upgrade -y && apt install vsftpd -y
COPY	./script.sh	.
RUN		chmod +x ./script.sh

CMD		["./script.sh"]

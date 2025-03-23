start_time := $(shell date +%s)

all:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

stop:
	cd ./srcs && docker-compose down

status:
	docker ps

clean:
	docker ps -qa | xargs -r docker rm || true
	docker images -q | xargs -r docker rmi -f || true
	docker volume ls -q | xargs -r docker volume rm || true
	docker network ls -q | xargs -r docker network rm || true
	sudo rm -rf /home/simon/data 

fclean: stop clean

re: fclean all

end:
	duration := $(shell echo $$(( $(shell date +%s) - $(start_time) )))
	ifeq ($(shell test $(duration) -ge 60 && echo 1),1)
		@echo "Build completed in $(shell echo $$(( $(duration) / 60 ))) minutes and $$(( $(duration) % 60 )) seconds."
	else
		@echo "Build completed in $(duration) seconds."
	endif

.PHONY: all stop clean fclean re

all:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

stop:
	cd ./srcs && docker-compose down

clean:
	sudo chown -R $(whoami) /home/simon/data
	sudo rm -rf /home/simon/data
	echo "1"
	@if [ -n "$$(docker ps -qa)" ]; then \
		docker rm -f $$(docker ps -qa); \
	fi
	echo "2"
	@if [ -n "$$(docker images -qa)" ]; then \
		docker rmi -f $$(docker images -qa); \
	fi
	echo "3"
	@if [ -n "$$(docker volume ls -q)" ]; then \
		docker volume rm -f $$(docker volume ls -q); \
	fi
	echo "4"
	@if [ -n "$$(docker network ls -q)" ]; then \
		docker network rm -f $$(docker network ls -q) 2>/dev/null; \
	fi
	echo "5"
	#docker system prune -f

fclean: stop clean

re: fclean all

.PHONY: all stop clean fclean re

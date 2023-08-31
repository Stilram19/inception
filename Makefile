all: up

up: volumes
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down
	@docker image rm -f $$(docker images -q)
	@docker volume rm $$(docker volume ls -q)

volumes:
	sudo rm -rf /home/obednaou/data/
	mkdir -p /home/obednaou/data/mysql
	mkdir -p /home/obednaou/data/wordpress
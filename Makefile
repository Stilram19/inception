all: up

up: volumes
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down
	@docker image rm -f $$(docker images -q)
	@docker volume rm $$(docker volume ls -q)
	@docker system prune --all --force
	sudo rm -rf /home/obednaou/data/

volumes:
	mkdir -p /home/obednaou/data/mysql
	mkdir -p /home/obednaou/data/wordpress

re: down up
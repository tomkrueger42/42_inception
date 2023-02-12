# INCEPTION Makefile

# general variables
DC_PATH		=	./srcs/docker-compose.yml

# colors
GREEN		=	\033[1;34m
NC			=	\033[0m

# Rules

.PHONY: all prep build clean fclean re dev check up down

all: prep build
	docker compose -f $(DC_PATH) up

# creates directories for databases
prep:
	mkdir -p ~/data
	mkdir -p ~/data/mysql_data
	mkdir -p ~/data/wordpress_content

build:
	docker compose -f $(DC_PATH) build

# removes containers, networks & volumes
clean:
	docker compose -f $(DC_PATH) down --volumes

# removes containers, networks, volumes, images & data
fclean:
	docker compose -f $(DC_PATH) down --rmi all --volumes
	sudo rm -rf ~/data

re: fclean all

# only removes image in IMG variable
dev: clean
	docker rmi -f $(if $(IMG),$(IMG),all)

# lists all containers, networks, volumes & images
check:
	@echo "$(GREEN)Docker Containers:$(NC)"
	@docker ps -a
	@echo "\n$(GREEN)Docker Networks:$(NC)"
	@docker network ls
	@echo "\n$(GREEN)Docker Volumes:$(NC)"
	@docker volume ls
	@echo "\n$(GREEN)Docker Images:$(NC)"
	@docker images

up: all
down: clean

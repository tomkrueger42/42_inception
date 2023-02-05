DC_PATH		=	./srcs/docker-compose.yml

all: prep build
	docker compose -f $(DC_PATH) up

# creates directories for databases
prep:
	mkdir -p ~/data
	mkdir -p ~/data/mysql
	mkdir -p ~/data/mysql/data
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/wordpress/content

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
	bash docker_check.sh

up: all
down: clean

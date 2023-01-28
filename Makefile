DC_PATH		=	./srcs/docker-compose.yml

all: prep build
	docker compose -f $(DC_PATH) up

prep:
	mkdir -p ~/data
	mkdir -p ~/data/mysql
	mkdir -p ~/data/wordpress

build:
	docker compose -f $(DC_PATH) build

# removes containers, networks & volumes
clean:
	docker compose -f $(DC_PATH) down --volumes

# removes containers, networks, volumes, images & data
fclean: 
	docker compose -f $(DC_PATH) down --rmi all --volumes
	rm -rf ~/data
	
re: fclean all

up: all
down: clean


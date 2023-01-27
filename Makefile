DC_PATH		=	./srcs/docker-compose.yml
MARIADB		=	mariadb
NGINX		=	nginx
DB_VOLUME	=	srcs_db_data

all: prep
	docker compose -f $(DC_PATH) build
	docker compose -f $(DC_PATH) up --remove-orphans

up: all

down:
	docker compose -f $(DC_PATH) down

prep:
	mkdir -p ~/data
	mkdir -p ~/data/mysql
	mkdir -p ~/data/wordpress

# removes containers
clean:
	docker compose -f $(DC_PATH) rm --force --stop --volumes

# removes containers, images, volumes & networks
fclean: clean
	sudo rm -rf ~/data
	docker image rm -f srcs-$(MARIADB)
	docker image rm -f srcs-$(NGINX)
	docker volume rm $(DB_VOLUME)

re: fclean all

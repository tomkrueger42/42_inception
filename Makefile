MARIADB		=	mariadb
NGINX		=	nginx
DB_VOLUME	=	srcs_db_data

start:
	mkdir -p ~/data
	mkdir -p ~/data/mysql
	docker compose -f ./srcs/docker-compose.yml up --remove-orphans

prep:
	mkdir -p ~/data
	mkdir -p ~/data/mysql

clean:
	docker rm -f $(MARIADB)
	docker rm -f $(NGINX)

fclean: clean
	sudo rm -rf ~/data
	docker image rm -f srcs-$(MARIADB)
	docker image rm -f srcs-$(NGINX)
	docker volume rm $(DB_VOLUME)

re: fclean start

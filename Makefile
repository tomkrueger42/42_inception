MARIADB_IMG	=	srcs-mariadb

start:
	docker compose -f ./srcs/docker-compose.yml up

rm-mariadb:
	docker image rm -f $(MARIADB_IMG)

re: rm-mariadb start
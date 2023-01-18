MARIADB		=	mariadb

start:
	docker-compose -f ./srcs/docker-compose.yml up --remove-orphans

clean:
	docker rm -f $(MARIADB)

fclean: clean
	docker image rm -f srcs-$(MARIADB)

re: fclean start

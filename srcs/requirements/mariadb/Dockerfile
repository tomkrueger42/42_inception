FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

EXPOSE 3306

COPY tools/entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT /entrypoint.sh

# FROM alpine:3.16.3

# #RUN apk update && apk upgrade

# # mariadb as mysql database
# # mariadb-client to connect to DB server
# RUN apk add --no-cache mariadb mariadb-client

# COPY conf/mariadb.cnf /etc/mysql/my.cnf
# COPY tools/entrypoint.sh ./

# RUN chmod +x ./entrypoint.sh

# ENTRYPOINT ["sh", "entrypoint.sh"]

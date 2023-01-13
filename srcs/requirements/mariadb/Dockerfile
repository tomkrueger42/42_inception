FROM alpine:3.16.3

RUN apk update
RUN apk add --upgrade apk-tools
RUN apk upgrade --available

# mariadb as mysql database
RUN apk add mariadb

# mariadb-client to connect to DB server
RUN apk add mariadb-client

# OpenRC initialization system to start, stop, restart the mariadb service
RUN apk add mariadb-openrc

COPY conf/mariadb_config.cnf /etc/mysql/my.cnf

COPY entrypoint.sh ./

RUN chmod 755 ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
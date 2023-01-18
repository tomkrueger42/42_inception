FROM alpine:3.16.3

RUN apk update && apk upgrade

# mariadb as mysql database
# mariadb-client to connect to DB server
RUN apk add --no-cache mariadb mariadb-client

COPY conf/mariadb_config.cnf /etc/mysql/my.cnf
COPY entrypoint.sh ./

EXPOSE 3306

RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["sh", "./entrypoint.sh"]
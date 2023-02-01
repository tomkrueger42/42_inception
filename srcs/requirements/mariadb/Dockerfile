FROM alpine:3.16.3

RUN apk update && apk --no-cache upgrade

# mariadb as mysql database
# mariadb-client to connect to DB server
RUN apk add --no-cache mariadb mariadb-client

COPY conf/mariadb.cnf /etc/mysql/my.cnf
COPY tools/entrypoint.sh ./

RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["sh", "entrypoint.sh"]

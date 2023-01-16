FROM alpine:3.16.3

RUN apk update \
    && apk add --upgrade apk-tools \
    && apk upgrade --available

# mariadb as mysql database
# mariadb-client to connect to DB server
# OpenRC initialization system to start, stop, restart the mariadb service
RUN apk add mariadb mariadb-client openrc mariadb-openrc \
    && rm -f /var/caches/apk/*

COPY conf/mariadb_config.cnf /etc/mysql/my.cnf

COPY entrypoint.sh ./

RUN chmod 755 ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
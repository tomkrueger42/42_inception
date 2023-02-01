FROM alpine:3.16.3

RUN apk update && apk --no-cache upgrade && \
    apk add --no-cache php-fpm

RUN mkdir -p /usr/share/webapps && \
    wget -P /usr/share/webapps http://wordpress.org/latest.tar.gz && \
    tar -xzvf /usr/share/webapps/latest.tar.gz && \
    rm /usr/share/webapps/latest.tar.gz && \
    chown -R root:root wordpress && \
    mkdir -p /var/www/ && \
    ln -s wordpress/ /var/www/


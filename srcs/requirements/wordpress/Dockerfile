FROM debian:buster

COPY conf/wp-config.php /

RUN apt-get update -y
RUN apt-get install -y  php7.3 php-mysqli php-fpm mariadb-client wget
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.3/fpm/pool.d

COPY tools/entrypoint.sh ./
RUN chmod +x ./entrypoint.sh
ENTRYPOINT ./entrypoint.sh


# FROM alpine:3.16.3

# RUN apk update && apk upgrade && \
#     apk add --no-cache \
#     mariadb-client \
#     php7 \
#     php7-fpm \
#     php-mysqli \
#     curl

# RUN mkdir -p /usr/share/webapps && \
#     wget -P /usr/share/webapps http://wordpress.org/latest.tar.gz && \
#     tar -xzvf /usr/share/webapps/latest.tar.gz && \
#     rm /usr/share/webapps/latest.tar.gz && \
#     chown -R root:root wordpress && \
#     mkdir -p /var/www/ && \
#     ln -s wordpress/ /var/www/


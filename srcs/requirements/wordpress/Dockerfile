FROM debian:buster

COPY conf/wp-config.php /var/www/html/

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
#     mariadb-client

# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp

# COPY conf/wp-config.php /var/www/html/
# COPY conf/wp-config.php /var/www/html/
# COPY conf/www.conf /etc/php8/php-fpm.d

# EXPOSE 9000
# COPY tools/entrypoint.sh /
# RUN chmod +x entrypoint.sh

# ENTRYPOINT [ "sh", "entrypoint.sh" ]

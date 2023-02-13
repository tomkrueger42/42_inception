# WordPress Dockerfile

# using alpine:3.16.3 as it is the penultimate stable version available to avoid dependancy conflicts
FROM alpine:3.16.3

# updating the alpine package keeper (apk) indexes
# upgrading any preinstalled packages
# adding necessary packages
#   wget as download manager
#   php8 and its associated extensions
#   mariadb-client as access tool for MySQL databases
RUN apk update \
    && apk --no-cache upgrade \
    && apk --no-cache add \
        wget \
        php8 \
        php8-cli \
        php8-fpm \
        php8-iconv \
        php8-mysqli \
        php8-phar \
        mariadb-client

# changing working directory of container to wordpress
WORKDIR /var/www/wordpress/

# copying the wordpress configuration files
COPY conf/wp-config.php /var/www/wordpress/
COPY conf/www.conf /etc/php8/php-fpm.d/

# copying an entrypoint initialization shell script to the root and allowing execution
COPY tools/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# downloading and preparing wordpress command-line-interface
# downloading and extracting WordPress core files to specified path
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && wp core download

# running entrypoint shell script to install WordPress and start php-fpm daemon
ENTRYPOINT [ "sh", "/usr/local/bin/entrypoint.sh" ]

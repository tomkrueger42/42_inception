#!/bin/bash
sleep 5
cd /var/www/html
wp core download --allow-root
cp /wp-config.php /var/www/html/
wp core install --allow-root --url=$HODO --title="42 Inceptom" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=tkruger@student.42heilbronn.de
mkdir /run/php

cd /
php-fpm7.3 --nodaemonize
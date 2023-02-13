#!/bin/sh

# sleeping until MariaDB Container is up and running
sleep 5

# installing and initializing WordPress core files with admin credentials
wp core install --url=$URL --title=$WP_TITLE \
                --admin_user=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PASS \
                --admin_email=$WP_ADMIN_MAIL --skip-email

# creating WordPress user with given credentials
wp user create $WP_USER_NAME $WP_USER_MAIL --user_pass=$WP_USER_PASS

# running 'FastCGI Process Manager' (php-fpm) in foreground
php-fpm8 --nodaemonize

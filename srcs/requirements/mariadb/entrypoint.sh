#!/bin/sh

# reference
# https://geekdudes.wordpress.com/2020/07/16/linux-bash-script-for-creating-and-configuring-maria-database/

echo "Configiring mariaDB..."

rc-service mariadb status

# rc-service mariadb status

# systemctl enable mariadb
# systemctl start mariadb

# # echo "root password: " $MYSQL_PASSWORD
# # root_password=$MYSQL_PASSWORD

# # # make sure that nobody can sign in to root without a password
# # mysql -e "UPDATE mysql.user SET Password = PASSWORD('$root_password') WHERE User = 'root'"

# # remove any anonymus users
# mysql -e "DROP USER IF EXISTS ''@'localhost'"
# # remove any other users
# mysql -e "DROP USER IF EXISTS ''@'$localhost'"
# # remove the demo database
# mysql -e "DROP DATABASE IF EXISTS test"


echo "mariaDB config done!"
systemctl start myswld
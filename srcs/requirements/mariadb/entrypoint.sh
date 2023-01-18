#!/bin/sh

# reference
# https://geekdudes.wordpress.com/2020/07/16/linux-bash-script-for-creating-and-configuring-maria-database/

echo "Configiring mariaDB..."

# echo "finding 'mariadb'"
# find / -name "mariadb"
# echo "finding 'mysql'"
# find / -name "mysql"


# cat /etc/insserv.conf.d/mariadb
# cat /usr/bin/mariadb

# ls /etc
# echo "1"
# ls /etc/init.d
# echo "2"

# /etc/init.d/mariadb setup
# echo "3"
# systemctl start mariadb.service
# echo "4"

# systemctl enable mariadb
# systemctl start mariadb

# echo "root password: " $MYSQL_PASSWORD
# root_password=$MYSQL_PASSWORD

# # # make sure that nobody can sign in to root without a password
# # UPDATE mysql.user SET Password = PASSWORD('$root_password') WHERE User = 'root'

# USE mysql
# # remove any anonymus users
# DROP USER IF EXISTS ''@'localhost'
# # remove any other users
# DROP USER IF EXISTS ''@'$localhost'
# # remove the demo database
# DROP DATABASE IF EXISTS test


# echo "mariaDB config done!"
# start

if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

rm -rf /var/lib/mysql/mysql
if [ ! -d "/var/lib/mysql/mysql" ]; then
	chown -R mysql:mysql /var/lib/mysql

	# init database
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

	/usr/bin/mysqld --user=mysql --bootstrap << EOF

USE mysql;
FLUSH PRIVILEGES;

DELETE FROM	mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';

CREATE DATABASE $MYSQL_DATABASE CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED by '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';

FLUSH PRIVILEGES;
EOF

else
    chown -R mysql:mysql /var/lib/mysql
fi

# allow remote connections
sed -i "s|skip-networking|# skip-networking|g" /etc/mysql/my.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/my.cnf

exec /usr/bin/mysqld --user=mysql --console
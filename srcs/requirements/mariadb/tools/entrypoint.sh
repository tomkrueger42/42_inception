#!/bin/bash

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then

echo "MariaDB entrypoint.sh: creating database '$DB_NAME'..."

service mysql start
sleep 1

mysql -u root << EOF
CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_PASS_ROOT');
EOF

service mysql stop 
echo "MariaDB entrypoint.sh: database '$DB_NAME' created."

else

echo "MariaDB entrypoint.sh: database '$DB_NAME' does already exist."

fi

mysqld_safe


# #!/bin/sh

# echo "entrypoint: Configiring mariaDB..."

# if [ ! -d "/run/mysqld" ]; then
# 	mkdir -p /run/mysqld
# 	chown -R mysql:mysql /run/mysqld
# fi

# if [ ! -d "/var/lib/mysql/mysql" ]; then
# 	chown -R mysql:mysql /var/lib/mysql

# 	# init database
# 	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

# 	/usr/bin/mysqld --user=mysql --bootstrap << EOF

# USE mysql;
# FLUSH PRIVILEGES;

# DROP DATABASE test;
# DELETE FROM mysql.db WHERE Db='test';
# DELETE FROM	mysql.user WHERE User='';
# DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

# ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';

# CREATE DATABASE $MYSQL_DATABASE CHARACTER SET utf8 COLLATE utf8_general_ci;
# CREATE USER '$MYSQL_USER'@'%' IDENTIFIED by '$MYSQL_PASSWORD';
# GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';

# FLUSH PRIVILEGES;
# EOF

# fi

# # allow remote connections
# sed -i "s|skip-networking|# skip-networking|g" /etc/mysql/my.cnf
# sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/my.cnf

# echo "entrypoint: mariaDB config complete."

# exec /usr/bin/mysqld --user=mysql --console

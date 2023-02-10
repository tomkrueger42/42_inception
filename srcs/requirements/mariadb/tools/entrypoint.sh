#!/bin/sh

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then

    echo "MariaDB entrypoint.sh: creating database '$DB_NAME'..."

    # launching openrc and creating runlevel file to specify current runlevels and system states
    openrc
    touch /run/openrc/softlevel

    # preparing and starting MariaDB for initial configuration
    /etc/init.d/mariadb setup
    /etc/init.d/mariadb start

    # changing MariaDB configuration using root user
    #   first, dropping possible anonymous users for unambigous connecting
    #   second, creating new database with name specified in environment
    #   third, creating new user with name and password specified in environment
    #   fourth, granting the new user privileges to the new database
    #   fifth, locking the root user to password specified in environment
    #   sixth, flushing for the privileges to take effect
    mysql -u root << EOF
DROP USER IF EXISTS ''@'%';
DROP USER IF EXISTS ''@'localhost';
CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS';
FLUSH PRIVILEGES;
EOF

    # stopping MariaDB for configuration changes to take effect
    /etc/init.d/mariadb stop

    echo "MariaDB entrypoint.sh: database '$DB_NAME' created."

else

    echo "MariaDB entrypoint.sh: database '$DB_NAME' does already exist."

fi

# running MariaDB through MySQL daemon using the mysql user
/usr/bin/mysqld --user=mysql

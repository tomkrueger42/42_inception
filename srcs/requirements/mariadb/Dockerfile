# MariaDB Dockerfile

# using alpine:3.16.3 as it is the penultimate stable version available to avoid dependancy conflicts
FROM alpine:3.16.3

# updating the alpine package keeper (apk) & upgrading any preinstalled packages
RUN apk update && apk upgrade --no-cache

# installing necessary tools
#   openrc as the init system for alpine & for managing services
#   mariadb as MySQL relational database management system
#   mariadb-client as access tool for MySQL databases
RUN apk add --no-cache mariadb mariadb-client openrc

# copying the MySQL server configuration file to its respective directory
COPY conf/mariadb-server.cnf /etc/my.cnf.d/

# copying an entrypoint initialization shell script to the root and allowing execution
COPY tools/entrypoint.sh /
RUN chmod +x /entrypoint.sh

# running entrypoint shell script to initialize MySQL database and start MariaDB daemon
ENTRYPOINT ["sh", "/entrypoint.sh"]

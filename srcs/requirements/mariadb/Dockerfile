# MariaDB Dockerfile

# using alpine:3.16.3 as it is the penultimate stable version available to avoid dependancy conflicts
FROM alpine:3.16.3

# updating the alpine package keeper (apk) indexes
# upgrading any preinstalled packages
# adding necessary packages
#   openrc as the init system for alpine & for managing services
#   mariadb as MySQL relational database management system
#   mariadb-client as access tool for MySQL databases
RUN apk update \
    && apk --no-cache upgrade \
    && apk --no-cache add \
        openrc \
        mariadb \
        mariadb-client

# copying the MySQL server configuration file
COPY conf/mariadb-server.cnf /etc/my.cnf.d/

# copying an entrypoint initialization shell script to the root and allowing execution
COPY tools/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# HEALTHCHECK --interval=5s --timeout=3s --retries=3 CMD mysql -u root

# running entrypoint shell script to initialize MySQL database and start MariaDB daemon
ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]

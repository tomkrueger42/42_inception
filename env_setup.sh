#!/bin/bash

ENV_FILE=./srcs/.env

# Colors
BLUE='\033[1;34m'
NC='\033[0m'

if [ ! -f ${ENV_FILE} ]; then

# General
echo -e "\n${BLUE}General setup${NC}"
echo -e "# General\n" > ${ENV_FILE}

echo -n "Domain (leave empty for https://tkruger.42.fr): https://"
read DOMAIN
if [ "${DOMAIN}" = "" ]; then
    echo -e "URL=https://tkruger.42.fr\n" >> ${ENV_FILE}
else
    echo -e "URL=https://${INCEPTION_DOMAIN}\n" >> ${ENV_FILE}
fi


# Docker
echo -e "# Docker\n" >> ${ENV_FILE}
echo -e "COMPOSE_PROJECT_NAME=inception\n" >> ${ENV_FILE}

# MySQL
echo -e "\n${BLUE}MySQL credentials${NC}"
echo -e "# MySQL\n" >> ${ENV_FILE}

echo "DB_HOST=mariadb" >> ${ENV_FILE}

echo -n "Insert database name:            "
read DB_NAME
echo "DB_NAME=${DB_NAME}" >> ${ENV_FILE}

echo -n "Insert database user:            "
read DB_USER
echo "DB_USER=${DB_USER}" >> ${ENV_FILE}

echo -n "Insert database password:        "
read DB_PASS
echo "DB_PASS=${DB_PASS}" >> ${ENV_FILE}

echo -e -n "\nInsert database root password:   "
read DB_ROOT_PASS
echo -e "DB_ROOT_PASS=${DB_ROOT_PASS}\n" >> ${ENV_FILE}

# WordPress
echo -e "\n${BLUE}WordPress credentials${NC}"
echo -e "# WordPress\n" >> ${ENV_FILE}

echo -n "Insert WordPress username:       "
read WP_USER_NAME
echo "WP_USER_NAME=${WP_USER_NAME}" >> ${ENV_FILE}

echo -n "Insert WordPress user email:     "
read WP_USER_MAIL
echo "WP_USER_MAIL=${WP_USER_MAIL}" >> ${ENV_FILE}

echo -n "Insert WordPress user password:  "
read WP_USER_PASS
echo -e "WP_USER_PASS=${WP_USER_PASS}\n" >> ${ENV_FILE}

echo -e -n "\nInsert WordPress admin name:     "
read WP_ADMIN_NAME
echo "WP_ADMIN_NAME=${WP_ADMIN_NAME}" >> ${ENV_FILE}

echo -n "Insert WordPress admin email:    "
read WP_ADMIN_MAIL
echo "WP_ADMIN_MAIL=${WP_ADMIN_MAIL}" >> ${ENV_FILE}

echo -n "Insert WordPress admin password: "
read WP_ADMIN_PASS
echo -e "WP_ADMIN_PASS=${WP_ADMIN_PASS}\n" >> ${ENV_FILE}

echo -e -n "\nInsert WordPress title:          "
read WP_TITLE
echo -e "WP_TITLE=${WP_TITLE}" >> ${ENV_FILE}

# Done
echo -e "\n${BLUE}Done!${NC}"

fi

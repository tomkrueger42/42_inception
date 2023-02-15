#!/bin/bash

ENV_FILE=./srcs/.env

# Colors
BLUE='\033[1;34m'
NC='\033[0m'

function write_to_env_file ()
{
    echo -e "$1" >> ${ENV_FILE}
}

function get_input ()
{
    INPUT=""
    while [ "${INPUT}" = "" ];
    do
        echo -n -e "$2: "
        read INPUT
    done
    write_to_env_file "$1=${INPUT}"
}

function get_input_with_suggestion ()
{
    echo -n -e "$2 (leave empty for $3): $4"
    read INPUT
    if [ "${INPUT}" = "" ]; then
        write_to_env_file "$1=$3"
    else
        write_to_env_file "$1=$4${INPUT}"
    fi
}

if [ ! -f ${ENV_FILE} ]; then


    # General

    echo -e "\n${BLUE}General setup${NC}"
    write_to_env_file "# General\n"

    get_input_with_suggestion "URL" "Domain" "https://localhost" "https://"


    # Docker

    write_to_env_file "\n# Docker\n"
    write_to_env_file "COMPOSE_PROJECT_NAME=inception"


    # MySQL

    echo -e "\n${BLUE}MySQL credentials${NC}"

    write_to_env_file "\n# MySQL\n"

    write_to_env_file "DB_HOST=mariadb"

    get_input_with_suggestion "DB_NAME" "Database name" "inception_db"

    get_input "DB_USER" "Database user"
    get_input "DB_PASS" "Database password"

    echo ""
    get_input "DB_ROOT_PASS" "Database root password"


    # WordPress

    echo -e "\n${BLUE}WordPress credentials${NC}"
    
    write_to_env_file "\n# WordPress\n"

    get_input "WP_USER_NAME" "WordPress username"
    get_input "WP_USER_MAIL" "WordPress user email"
    get_input "WP_USER_PASS" "WordPress user password"

    echo ""
    get_input "WP_ADMIN_NAME" "WordPress admin name"
    get_input "WP_ADMIN_MAIL" "WordPress admin email"
    get_input "WP_ADMIN_PASS" "WordPress admin password"

    echo ""
    get_input_with_suggestion "\nWP_TITLE" "WordPress title" "Inception"


    # Done
    echo -e "\n${BLUE}Done!${NC}"

fi

# 42_inception

This project consists of a small infrastructure composed of WordPress with a LEMP Stack (Alpine Linux, Nginx, MariaDB and PHP) using Docker / Docker-Compose under specific rules (see subject.pdf). 

## Docker Containers
- Nginx with SSL (TLSv1.3)
- MariaDB
- PHP with php-fpm (PHP FastCGI Process Manager) serving WordPress

## How to use
First, make sure that Docker is installed and ready-to-use!

Then, clone the repository using

```sh
$ git clone https://github.com/tomkrueger42/42_inception.git
```

Change into the directory and start the services with

```sh
$ make
```

During the first startup, 'make' will run the 'env_setup.sh' script, which will ask you to set up the credentials for the MariaDB database manager and WordPress user and admin panels. These will be stored inside a .env file for future start-ups. 

##### Note: if you change the domain from localhost to a custom domain, you will have to either register the domain with a DNS or change the '/etc/hosts' file.  

#### Now you can access the WordPress site with 'https://localhost' (or your provided domain) in your browser!

##### Note: Since the ssl certificate is self-signed and not trusted by a Certificate Authority (CA), you might need to change your browser settings or allow the untrusted certificate.

To stop and remove the containers, run
```sh
$ make clean
```
If you would like to remove the images and '~/data' directory, run
```sh
$ make fclean
```

## Nextcloud 

Nextcloud is a suite of client-server software for creating and using file hosting services. It is enterprise-ready with comprehensive support options. Being free and open-source software, anyone is allowed to install and operate it on their own private server devices


# Quick start

The easiest way to start nextcloud with Mariadb is using Docker Compose. Just clone this repo and run following command in the root directory. The default docker-compose.yml uses Mariadb and phpMyAdmin.

### Install

## Using DECK
Install nextcloud from the DECK marketplace and follow the instructions on the GUI

### From terminal with Docker
```
git clone https://github.com/deck-app/nextcloud.git
cd nextcloud
```
Edit .env file to change any setting before installing like nextcloud, mariadb, php etc
```
docker-compose up -d
```
### Modifying project settings

From the DECK app, go to stack list and click on project's `More > configure > Advanced configuration` Follow the instructions below and restart your stack from the GUI

##### Edit Apache configuration

httpd.conf is located at `./nextcloud/httpd.conf`

##### Edit Nginx configuration

httpd.conf is located at `./nextcloud/default.conf`

#### Editing php.ini

PHP ini file is located at `./nextcloud/php.ini`

##### Rebuilding from terminal

You have to rebuild the docker image after you make any changes to the project configuration, use the snippet below to rebuild and restart the stack
```
docker-compose stop && docker-compose up --build -d
```

# Overview
This repository for setup wordpress with docker nginx as web service

# Requirements

- [docker](https://docs.docker.com/install/)
- [docker-compose](https://docs.docker.com/compose/install/)
- [composer](https://getcomposer.org/doc/00-intro.md)
- git

# Installation

1. Create project directory

        mkdir ~/dev
        git clone https://github.com/heangratha/nginx-php.git ~/dev/local-wordpress.com
        cd ~/dev/local-wordpress.com
        comopser install

2. Check your local user id open your terminal

        id -u $USER

3. Replace docker-compose.yaml 'LOCAL_USER_ID' with your current ID

        DEFAULT_MYSQL_PASS: root
        DEFAULT_MYSQL_DB: database

4. Update .env file with your specific php and mysql version

        php_tag=7.4
        mysql_tag=5.7

5. Up docker containers

        docker-compose up -d

6. Create hosts file

        sudo vi /etc/hosts
        0.0.0.0 local-wordpress.com

7. Test Website

        Open you favourite browser
        type: http://local-wordpress.com

You should see the new wordpress setup site pop up

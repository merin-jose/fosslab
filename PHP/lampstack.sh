#!/bin/bash

#setting up lampstack
#to install appache
sudo apt-get update
sudo apt-get install apache2


#to install MySQL
sudo apt-get install mysql-server
mysql_secure_installation

#to login as mysql root user
mysql -u root -p

#to insatll php
sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql
sudo nano /etc/apache2/mods-enabled/dir.conf
sudo systemctl restart apache2
sudo systemctl status apache2

#create info.php
sudo nano /var/www/html/info.php

http://localhost/info.php



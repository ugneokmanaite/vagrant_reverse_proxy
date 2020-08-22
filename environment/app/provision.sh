#!/bin/bash

# Update the sources list
sudo apt-get update -y

# upgrade any packages available
sudo apt-get upgrade -y

# install nginx
sudo apt-get install nginx -y

# moving into relevant folder
cd /etc/nginx/sites-available

# sudo chmod 666 reverse-proxy.conf
sudo chmod 666 default

# inserting server information into the connection file
echo "server{
  listen 80;
  location / {
      proxy_pass http://192.168.10.100:3000;
  }
}" > default
# > to overwrite the current default file with new server info

# test if nginx file was succesfully edited
sudo nginx -t

# restart nginx
sudo service nginx restart

# check status of nginx
sudo service nginx status

# install nodejs
sudo apt-get install python-software-properties
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y

# install npm
sudo apt-get install npm -y

# install pm2
sudo npm install pm2 -g

# App set up
cd /home/ubuntu/app
sudo su
npm install
node app.js

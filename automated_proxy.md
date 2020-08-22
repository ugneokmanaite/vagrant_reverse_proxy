# Automated reverse proxy

## Ensure to install all pre-requisites
- [x] Ruby (ensure to install bundler)
- [x] Vagrant
- [x] Virtual Box

For details on how to install all please [click here](https://github.com/ugneokmanaite/vb_vagrant_installtion)

- Instructions in this document ensure that reverse proxy does not need to be set up manually (we love automation :heart_eyes: )

## Fork or clone the repo
Save it to your chosen destination 

## Open your git bash terminal
Follow the file path where you have saved `vagrant_reverse_proxy` folder.

e.g.
```
~/Documents/vagrant_reverse_proxy (master)
```

## Locate your `provision.sh` file
The following path would locate you to the required folder directly
```
~/Documents/vagrant_reverse_proxy/environment/app
```
and type `nano provision.sh` to open the file 

or you can access manually by entering 
```
cd environment/ 
cd app/
nano provision.sh
```

## Your provision file should have the following contents:
```

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

# install git
sudo apt-get install git -y

# install nodejs
sudo apt-get install python-software-properties
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y

# install npm
sudo apt-get install npm -y

# install pm2
sudo npm install pm2 -g

# App set up
# Creating environment variable for DB
export DB_HOST="mongodb://192.168.10.150:27017/posts"
cd /home/ubuntu/app
sudo su
npm install
node app.js
```

## Save and exit 
Using `ctrl + x` press `y` and `enter `

## Go into Vagrantfile
In bash terminal type `cd ..` and press `enter` (2 x) to go back into folder path
``` 
~/Documents/vagrant_reverse_proxy (master)

```

## Access Vagrant file
In bash terminal type `nano Vagrantfile`

## Edit file to sync provision folder in VM
```
app.vm.provision "shell", path: "environment/app/provision.sh", privileged: false
```

## Start up Virtual Machine
In bash terminal access the path where relevant folder is saved
```
~/Documents/vagrant_reverse_proxy (master)
```
use the command `vagrant up` 

this should start both of the VM (db and app )

this should prompt the following message:

```
app: Your app is ready and listening on port 3000
```

We should be able to see our application on Three different URL's
`http://development.local/`
`http://development.local/fibonacci/8`
`http://development.local/posts`



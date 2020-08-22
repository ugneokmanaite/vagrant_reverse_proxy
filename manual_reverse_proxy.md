# Manual Reversing Proxy

## Ensure to install all pre-requisites
- [x] Ruby (ensure to install bundler)
- [x] Vagrant
- [x] Virtual Box

For details on how to install all please [click here](https://github.com/ugneokmanaite/vb_vagrant_installtion)

## Fork or clone the repo
Save it to your chosen destination 

## Open your git bash terminal
Follow the file path where you have saved `vagrant_reverse_proxy` folder.

e.g.
```
~/Documents/vagrant_reverse_proxy (master)
```

## Open VM 
- type `vagrant up`
- type `vagrant status` to check that both VMs are running
- type `vagrant ssh app` to open VM in app

## Access default file
- `sudo nano default`

## What is default?
- Default file - homepage for nginx server. It is an open server for all who would like to use reverse proxy for their web pages

## Injecting own info into the default file
- Delete the file to make it easier
- `rm -r default`
- Create the same file but blank `sudo touch default`
- In the file add the following :

```
server {
    listen 80;
    server_name _;
    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

- We are telling the server to listen on port 80 & to pass the proxy
- After this is finished enter the following command:

```
sudo systemctl restart nginx
sudo systemctl status nginx
```

- Now rerun the app from the location
- `npm start`
- Now when you enter http://development.local/ in the browser it should say app is running successfully!!

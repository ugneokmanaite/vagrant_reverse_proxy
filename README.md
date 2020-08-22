# This repo displays manual & automated reverse proxy configuration 

## CONTENTS
### Background Information
1. What is proxy
2. Benefits of proxy
3. What is reverse proxy
4. Benefits of reverse proxy
5. What is nginx

### Manual reversing proxy
Step-by-Step [click here](https://github.com/ugneokmanaite/vagrant_reverse_proxy/blob/master/manual_reverse_proxy.md)

### Automated reverse proxy
Step-by Step [click here](https://github.com/ugneokmanaite/vagrant_reverse_proxy/blob/master/automated_proxy.md)

### DOD

- [x] Install & configure nginx as a reverse proxy.This will listen for requests on port 80 and pass them on to our app on port 3000

- [x] Amend your provisioning script for your app VM so that it installs nginx and does the necessary configuration

- [x] Recreate your VM from scratch and run this provisioning script in order to test it works properly


# Background information 

## What is a proxy?
- Server that hides the identity of the client
- Connecting through a proxy to a server
- Proxy makes a request to the server so the server does not know who the client is

## Benefits of a proxy
- Anonymity
- Caching = proxy will keep a local cashe so that everything does not need to be pulled from beginning
- Blocking unwated sites
- Geofencing = certain clients can only access certain content

## What is a reverse proxy?
- The client doesn't know which server they are connecting to

## Benefits of reverse proxy
- Load Balancing
- Caching - cache content if requests dont change
- Isolating internal traffic 
- Logging - which server is going down/ which is up etc

![image](https://smartproxy.com/wp-content/uploads/2019/03/reverse-vs-forward-proxies.png)

## What is Nginx?
- Software that acts both as a web server and a proxy
- Open source web server

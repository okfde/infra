offenedaten.de (beta) server config
====================================

This directory contains configuration for
the offenedaten.de (beta) server.

For further information, contact
Matt.

# Basics
offenedaten.de runs on CKAN, developer version. We may standardize on 2.3 once it is released. CKAN in turn is written in Python using the Pylons framework and can be served directly (for development) or via nginx or Apache.

Additionally, the following components are used:

* PostgreSQL for data storage
* SOLR for indexing/search
* Redis for keeping track of things for harvesting

# Install
The components are installed using Docker, with a few post install steps. There are 4 containers to be installed:

    sudo docker run -d --name redis redis
    sudo docker run -d --name db ckan/postgresql
    sudo docker run -d --name solr cygri/solr:2.3a

The third container is an extension of the CKAN 2.3a image from cygri (https://registry.hub.docker.com/u/cygri/ckan/). It adds some extensions and configuration. First clone the file (this repo) somewhere and change to the folder with the Dockerfile. Now we need to find out what IP addresses our Redis, SOLR and Postgres containers have. There is work to improve on this mess (https://github.com/ckan/ckan-docker), but for now we will do it once, the hard way. Whilst we are at it, we will change the CKAN DB password to something other than 'ckan' (IMPORTANT!). This can be anything you like, but you will need it later.

List your containers:
    
    sudo docker ps
    
List the IPs (http://stackoverflow.com/questions/17157721/getting-a-docker-containers-ip-address-from-the-host):

    sudo docker ps | tail -n +2 | while read cid b; do echo -n "$cid\t"; sudo docker inspect $cid | grep IPAddress | cut -d \" -f 4; done

This should allow you to figure out which IP SOLR and which IP Postgres have. Change these on the lines

    ckan.harvest.mq.hostname = 172.17.0.52
    
and (including password change)

    sqlalchemy.url = postgresql://ckan:<NEW PASSWORD HERE!!!>@172.17.0.11:5432/ckan
    
and

    solr_url = http://172.17.0.13:8983/solr/ckan
    
respectively.

Before you stop editing, change the line

Then type:

    sudo docker build -t offenedaten_de . 
    
Note that none of the containers expose ports to the outside world except for the final one. That means that any operations that require database access etc. have to be run from within the (CKAN) container using Docker links. Hence a few things that it might have been nice to package in the Dockerfile happen with a post install script, postinstall.sh:

    sudo ./postinstall.sh
    
Namely and in this order, changing the ckan DB password, initializing the DB for harvesting, and adding a sysadmin user called harvester (the first and last require interactive input anyway). The first thing that happens is that the postgresql client attempts to log in to the DB. When asked for the password, enter 'ckan'. Next, you will be asked for a new password. Change it to whatever you chose for the customconfig.ini file above. When making the harvester user, you will be asked for a password. Write this down - it is suggested to use it as THE sysadmin for the CKAN instance.
    
Assuming that all works, you can finally start the fourth container:

    sudo docker run -d -p 80:80 --link db:db --link solr:solr --link redis:redis offenedaten_de

#Base data
Now we move on to putting in the data basics into the CKAN instance.

TODO: Test scripts with container and document






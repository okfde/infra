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

These components are installed using Docker, with a few post install steps. There are 4 containers to be installed:

docker run -d --name redis redis


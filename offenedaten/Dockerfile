############################################################
# Dockerfile for offenedaten.de
# Based on ckan/ckan
############################################################

FROM cygri/ckan:2.3a

# Install git, supervisor, libxml
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y git cron supervisor libxml2-dev libxslt1-dev python-dev
RUN mkdir -p /var/log/supervisor
RUN mkdir -p /var/log/ckan/std
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD runharvesters.sh /etc/runharvesters.sh

# Install our python module
RUN $CKAN_HOME/bin/pip install -e git+https://github.com/SebastianBerchtold/odm-catalogreaders.git#egg=odm
# Install the extension (production)
RUN $CKAN_HOME/bin/pip install -e git+https://github.com/okfde/ckanext-offenedaten.git#egg=ckanext-offenedaten
# Install pika and redis
RUN $CKAN_HOME/bin/pip install pika
RUN $CKAN_HOME/bin/pip install redis
#This is a fork of a fork which solves an issue. In my fork the default branch is the branch that solves an issue
#Switch back to ckan harvester soon! (After 2.3 release)
RUN $CKAN_HOME/bin/pip install -e git+https://github.com/mattfullerton/ckanext-harvest.git#egg=ckanext-harvest

# Add my custom configuration file
ADD customconfig.ini $CKAN_CONFIG/ckan.ini

# Run supervisor
CMD ["/usr/bin/supervisord"]

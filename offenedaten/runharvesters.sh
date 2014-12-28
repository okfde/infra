#!/bin/bash
cd $CKAN_HOME/src/ckan
. $CKAN_HOME/bin/activate
paster --plugin=ckanext-harvest harvester run --config=$CKAN_CONFIG/ckan.ini

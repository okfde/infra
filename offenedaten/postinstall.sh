#Change password
docker run -i -t --link db:db --link offenedaten_de bin/bash -c 'psql -U ckan -h 172.17.0.11 -d ckan -c \\password'

#Initialize harvesting
docker run -i -t --link db:db --link solr:solr offenedaten_de sbin/my_init -- bin/bash -c '$CKAN_HOME/bin/paster --plugin=ckanext-harvest harvester initdb --config=$CKAN_CONFIG/ckan.ini'

# Add harvester user
docker run -i -t --link db:db --link solr:solr offenedaten_de  sbin/my_init -- bin/bash -c '$CKAN_HOME/bin/paster --plugin=ckan sysadmin add harvester -c $CKAN_CONFIG/ckan.ini'


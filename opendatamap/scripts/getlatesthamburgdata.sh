#!/bin/bash
source venvs/odm/bin/activate
cd ~/checkouts/odm-datenerfassung/readdatacatalogs
python ckanApiV3.py hamburg
cd ..
gzip -c metadata/hamburg/catalog.json > metadata/hamburg/catalog.json.gz
git pull
git commit -m "Hamburg Metadata update" metadata/hamburg/catalog.json.gz
git push
rm metadata/hamburg/catalog.json
deactivate

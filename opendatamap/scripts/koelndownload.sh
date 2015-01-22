#!/bin/bash
source venvs/odm/bin/activate
cd ~/checkouts/odm-datenerfassung/readdatacatalogs
python ckanApiV3.py koeln
cd ..
git pull
git commit -m "Koeln Metadata update" metadata/koeln/catalog.json
git push
deactivate

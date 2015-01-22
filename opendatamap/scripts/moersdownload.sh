#!/bin/bash
source venvs/odm/bin/activate
cd ~/checkouts/odm-datenerfassung/readdatacatalogs
python bremen-sixcms-moers-json.py moers
cd ..
git pull
git commit -m "Moers Metadata update" metadata/moers/catalog.json
git push
deactivate

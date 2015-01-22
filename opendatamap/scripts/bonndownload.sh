#!/bin/bash
source venvs/odm/bin/activate
cd ~/checkouts/odm-datenerfassung/readdatacatalogs
python ckanApiV3.py bonn
cd ..
git pull
git commit -m "Bonn Metadata update" metadata/bonn/catalog.json
git push
deactivate

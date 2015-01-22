#!/bin/bash
source venvs/odm/bin/activate
cd ~/checkouts/odm-datenerfassung/readdatacatalogs
python ulm-daten.ulm.de-downloadISO19139.py
python ulm-daten.ulm.de-readISO19139.py
cd ..
git pull
git commit -m "Ulm Metadata update" metadata/ulm/catalog.json metadata/ulm/catalog.xml
git push
deactivate

#!/bin/bash
source venvs/odm/bin/activate
export BERLINCKANAPIKEY=INSERTKEYHERE!!!
cd ~/checkouts/odm-datenerfassung/readdatacatalogs
python diepholz-gdi.diepholz.de.py
python ckanApiV3.py frankfurt
python ckanApiV3.py aachen
python ckanApiV3.py berlin
python ckanApiV3.py muenchen
python rostock-rlp-ckan.py rostock
python bremen-sixcms-moers-json.py bremen
python bochum-scrape.py
python arnsberg.py
python baden-wuerttenberg-opendata.service-bw.de.py
python braunschweig-geoportal.braunschweig.de.py
python bayern-opendata.bayern.de.py
cd ..
git pull
git commit -m "Braunschweig, Diepholz Metadata update" metadata/diepholz/catalog.xml metadata/braunschweig/catalog.xml
git push
deactivate

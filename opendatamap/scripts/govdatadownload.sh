#!/bin/bash
source venvs/odm/bin/activate
cd ~/checkouts/odm-datenerfassung/readdatacatalogs
wget https://www.govdata.de/ckan/dump/govdata.de-daily.json.gz
gunzip -f govdata.de-daily.json.gz
#Get other data
python datagov-ckan-getDataFromSettlements.py all govdata.de-daily.json http://daten.rlp.de,http://datenregister.berlin.de,http://www.offenedaten.moers.de/,www.opendata.service-bw.de,http://www.opendata.bayern.de
rm *.json
deactivate

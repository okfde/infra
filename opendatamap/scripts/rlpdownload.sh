#!/bin/bash
source venvs/odm/bin/activate
cd ~/checkouts/odm-datenerfassung/readdatacatalogs
python rostock-rlp-ckan.py rlp rlpoutputignore
deactivate

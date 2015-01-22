#!/bin/bash
source venvs/odm/bin/activate
cd ~/checkouts/odm-datenerfassung/searchengineresults
python search.py INSERTBINGKEYHERE!!!
deactivate

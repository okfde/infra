#!/bin/bash
source venvs/odm/bin/activate
cd ~/checkouts/odm-datenerfassung/utils
python consistentDb.py
deactivate

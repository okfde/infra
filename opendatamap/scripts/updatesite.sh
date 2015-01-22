#!/bin/bash
source venvs/odm/bin/activate
cd ~/checkouts/odmonitormap/data
python downloadDataFromDB.py
cd ..
git pull
git add data/*.csv
git commit -m "Automatic site update from DB" data/*.csv 
git push
deactivate

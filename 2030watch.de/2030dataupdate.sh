#!/usr/bin/env bash
cd /home/matt/checkouts/2030-watch.de
git checkout gh-pages
git pull
rm /home/matt/checkouts/2030-watch.de/_data/datasets/online/*
rm /home/matt/checkouts/2030-watch.de/datastatic/datasets/online/*
. /home/matt/venvs/2030watch/bin/activate
cd /home/matt/checkouts/2030-watch-dataprocessing
pip install --upgrade -r requirements.txt
cd /home/matt/checkouts/2030-watch-dataprocessing
if python gsToJson.py; then
  cd ../2030-watch.de
  git add _data/datasets/online/*
  git add datastatic/*
  git commit -a -m "Data update"
  git push
else
  echo Python returned an error
fi

Prerequisites:
* You're called matt
* You have a folder called checkouts with the two relevant projects odm-datenerfassung and odmonitor in it
* You have a PostgreSQL DB running with the data in it
* You have a folder venvs/odm with the python virtual environent with all necessary modules installed, which are:
    * BeautifulSoup
    * psycopg2
    * requests
    * lxml
    * unicodecsv
    * You'll also need a symlink from odm-datenerfassung/readdatacatalogs/metautils.py to your site packages folder. Sorry about that.
* You copy the crontab as shown in this repo
* You have commit rights to odmonitormap and have the SSH key set up correctly

If you fulfill all of those, you may have a chance at running open-data-map.de. If not, you should consider running offenedaten.de, which is somewhat better set up.

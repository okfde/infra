require("ep_etherpad-lite/node_modules/npm").load({}, function (er, npm) {

	process.chdir(npm.root + '/..');

	// This script requires that you have modified your settings.json file
	// to work with a mysql database.  Please make a backup of your sqlite-etherpad-lite.db
	// file before using this script, just to be safe.

	var async = require("../src/node_modules/async");
	var settings = require("ep_etherpad-lite/node/utils/Settings");
	var ueberDB = require("../src/node_modules/ueberdb2");
	var mysql = require("../src/node_modules/mysql");
	var log4js = require("../src/node_modules/log4js");
	var logger = log4js.getLogger("ueberDB");
	var sqlite = new ueberDB.database('sqlite', {"filename": "var/sqlite-etherpad-lite.db"}, {}, logger);
	var db = mysql.createConnection(settings.dbSettings);
	console.log("Waiting for sqlite to parse its file.");
	sqlite.init(function () {
		sqlite.db.wrappedDB.db.all('SELECT * FROM store', [], function (err, results) {
			sqlite.close(function () {
				if (err) return console.log('sqlite error', err);
				console.log('Writing', results.length, 'entries');
				var sql = "REPLACE INTO `store` VALUES (?,?)";
				var i = 0;
				async.forEachSeries(results, function (o, next) {
					i++;
					console.log('writing entry', i, 'of', results.length);
					db.query(sql, [o.key, o.value], function (err) {
						if (err) {
							return console.log(err);
						}
						next();
					});
				}, function () {
					console.log('done');
				});
			});
		});
	});
});

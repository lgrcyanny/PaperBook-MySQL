var utils = require('../../lib/utils');
var squel = require('squel');

module.exports = {
  table: 'literatures',
  getGlobalViewData: function (callback) {
    // var sql = 'SELECT b.username as username, count(*) as literature_count FROM paperbook.literatures as a join paperbook.users as b on a.user_id = b.id GROUP BY a.user_id, b.username;';
    //var sql = 'SELECT year(a.add_at) as add_year, b.username as username, count(*) as literature_count FROM paperbook.literatures as a right join paperbook.users as b on a.user_id = b.id GROUP BY add_year,a.user_id, b.username;';
    var sql = 'select b.add_year as add_year, b.username as username, ifnull(a.literature_count,0) as literature_count from(SELECT year(a.add_at) as add_year, b.username as username, count(*) as literature_count FROM paperbook.literatures as a join paperbook.users as b on a.user_id = b.id GROUP BY add_year,a.user_id, b.username) as a right join(select distinct year(a.add_at) as add_year,username as username from literatures as a,users as b) as b on a.add_year=b.add_year and a.username=b.username order by add_year,username';
    utils.exec(sql, null, function (err, results) {
      if (err) {
        results = [];
      };
      callback(results);
    });
  }
}
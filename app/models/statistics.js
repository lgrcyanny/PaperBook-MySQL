var utils = require('../../lib/utils');
var squel = require('squel');

module.exports = {
  table: 'literatures',
  getGlobalViewData: function (callback) {
    var sql = 'SELECT b.username as username, count(*) as literature_count FROM paperbook.literatures as a join paperbook.users as b on a.user_id = b.id GROUP BY a.user_id, b.username;';

    utils.exec(sql, null, function (err,results) {
      if (err) {
        results=[];
      };
      callback(results);
    });
  }
}
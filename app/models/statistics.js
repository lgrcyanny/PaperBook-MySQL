var utils = require('../../lib/utils');
var squel = require('squel');

module.exports = {
  table: 'literatures',
  getGlobalViewData: function (callback) {
    callback({
      data: 'haha'
    });
    // utils.exec(query, literature, callback);
  }
}
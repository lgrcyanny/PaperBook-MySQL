var utils = require('../../lib/utils');

module.exports = {
  table: 'literatures',
  save: function (literature, cb) {
    var query = 'INSERT INTO literatures SET ?';
    utils.exec(query, literature, cb);
  },

  update: function (id, data, cb) {
    var query = 'UPDATE literatures SET ? WHERE id = ' + id;
    utils.exec(query, data, cb);
  },

  delete: function (id, cb) {
    var query = 'DELETE FROM literatures WHERE id = ?';
    utils.exec(query, [id], cb);
  },

  findById: function (id, cb) {
    var query = 'SELECT * FROM ?? WHERE id = ?';
    var data = [this.table, id];
    utils.exec(query, data, cb);
  },

  findByUser: function (userid, cb) {
    var query = 'SELECT id, title, add_at FROM ?? WHERE user_id = ? ORDER BY add_at desc';
    var data = [this.table, userid];
    utils.exec(query, data, cb);
  }
}
var utils = require('../../lib/utils');

module.exports = {
  table: 'brief_comments',

  findByLiterature: function (literaturId, cb) {
    var query = 'SELECT b.username as username, a.content as content FROM ?? as a JOIN ?? as b on a.user_id = b.id WHERE a.literature_id = ?';
    var data = [this.table, 'users', literatureId];
    utils.exec(query, data, cb);
  },

  findByUser: function (useId, cb) {
    var query = 'SELECT a.content as content, a.id as id FROM ?? WHERE a.literature_id = ? AND a.publicshed = ?';
    var data = [this.table, userId, 0];
    utils.exec(query, data, cb);
  },

  save: function (data, cb) {
    var query = 'INSERT INTO brief_comments SET ?';
    utils.exec(query, data, cb);
  },

  update: function (id, data, cb) {
    var query = 'UPDATE INTO brief_comments SET ? WHERE id = ?';
    utils.exec(query, data, id);
  }
}
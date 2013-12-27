var utils = require('../../lib/utils');

module.exports = {
  table: 'brief_comments',

  findByLiterature: function (literaturId, cb) {
    var query = 'SELECT b.username as username, a.content as content FROM ?? as a JOIN ?? as b on a.user_id = b.id WHERE a.literature_id = ?';
    var data = [this.table, 'users', literatureId];
    utils.exec(query, data, cb);
  },

  findByUser: function (literatureId, useId, cb) {
    var query = 'SELECT a.id as id, a.content as content FROM ?? AS a WHERE a.literature_id = ? AND a.publicsh = ? AND a.user_id = ?';
    var data = [this.table, literatureId, userId, 0];
    utils.exec(query, data, cb);
  },

  save: function (data, cb) {
    var query = 'INSERT INTO brief_comments SET ?';
    utils.exec(query, data, cb);
  },

  update: function (id, data, cb) {
    var query = 'UPDATE INTO brief_comments SET ? WHERE id = ' + id;
    utils.exec(query, data, id);
  }
}
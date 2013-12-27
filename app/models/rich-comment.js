var utils = require('../../lib/utils');

module.exports = {
  table: 'rich_comments',
  save: function (data, cb) {
    var query = 'INSERT INTO rich_comments SET ?';
    utils.exec(query, data, cb);
  },

  updateById: function (commentId, data, cb) {
    var query = 'UPDATE rich_comments SET ? WHERE id = ' + commentId;
    utils.exec(query, data, cb);
  },

  findDraft: function (literatureId, userId, cb) {
    var query = 'SELECT id, content FROM ?? WHERE literature_id = ? AND user_id = ? AND publish = ?';
    //console.log(query);
    var data = [this.table, literatureId, userId, 0];
    utils.exec(query, data, cb);
  },

  findById: function (commentId, cb) {
    var query = 'SELECT a.id AS id, a.content AS content, a.created_at AS created_at, b.username AS username FROM ?? as a JOIN ?? as b ON a.user_id = b.id WHERE a.id = ?';
    var data = [this.table, 'users', commentId];
    utils.exec(query, data, cb);
  },

  findByLiterature: function (literatureId, cb) {
    var query = 'SELECT a.id AS id, a.content AS content, a.created_at AS created_at, b.username AS username FROM ?? as a JOIN ?? as b ON a.user_id = b.id WHERE literature_id = ? AND publish = ? ORDER BY a.created_at DESC LIMIT 8';
    var data = [this.table, 'users', literatureId, 1];
    utils.exec(query, data, cb);
  }
}
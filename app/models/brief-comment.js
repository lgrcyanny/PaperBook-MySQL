var utils = require('../../lib/utils');

module.exports = {
  table: 'brief_comments',
  save: function (data, cb) {
    var query = 'INSERT INTO brief_comments SET ?';
    utils.exec(query, data, cb);
  },

  updateById: function (commentId, data, cb) {
    var query = 'UPDATE brief_comments SET ? WHERE id = ' + commentId;
    utils.exec(query, data, cb);
  },

  findDraft: function (literatureId, userId, cb) {
    var query = 'SELECT id, content, score, tags FROM ?? WHERE literature_id = ? AND user_id = ? AND publish = ?';
    //console.log(query);
    var data = [this.table, literatureId, userId, 0];
    utils.exec(query, data, cb);
  },

  findById: function (commentId, cb) {
    var query = 'SELECT a.id AS id, a.content AS content, a.created_at AS created_at, b.username AS username, a.score AS score FROM ?? as a JOIN ?? as b ON a.user_id = b.id WHERE a.id = ?';
    var data = [this.table, 'users', commentId];
    utils.exec(query, data, cb);
  },

  findByLiterature: function (literatureId, cb) {
    var query = 'SELECT a.id AS id, a.content AS content, a.created_at AS created_at, a.score AS score, b.username AS username FROM ?? as a JOIN ?? as b ON a.user_id = b.id WHERE literature_id = ? AND publish = ? ORDER BY a.created_at DESC LIMIT 5';
    var data = [this.table, 'users', literatureId, 1];
    utils.exec(query, data, cb);
  }
}
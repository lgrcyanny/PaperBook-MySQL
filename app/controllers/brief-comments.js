var utils = require('../../lib/utils');

module.exports = {
  table: 'brief_comments',

  findByLiterature: function (literaturId, cb) {
    var query = 'SELECT b.username as username, a.content as content FROM ?? as a JOIN ?? as b on a.user_id = b.id WHERE a.literature_id=?';
    var data = [this.table, 'users', literatureId];
    utils.exec(query, data, cb);
  },

  findByUser: function (useId, cb) {
    var query = 'SELECT a.content, as content a.id, as id FROM ?? WHERE a.literature_id=? AND a.publicshed=?';
    var data = [this.table, userId, 0];
    utils.exec(query, data, cb);
  },

  saveDraft: function (briefComment, cb) {
    var query = 'INSERT INTO brief_comments SET ?';
    utils.exec(query, briefComment, cb);
  },

  delete: function (id, cb) {
    var query = 'DELETE FROM ?? WHERE id = ?'
    var data = [this.table, id];
    utils.exec(query, data, cb);
  },
}
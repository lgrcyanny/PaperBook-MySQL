var utils = require('../../lib/utils');
var squel = require('squel');

module.exports = {
  table: 'literatures',
  save: function(literature, cb) {
    var query = 'INSERT INTO literatures SET ?';
    utils.exec(query, literature, cb);
  },

  update: function(id, data, cb) {
    var query = 'UPDATE literatures SET ? WHERE id = ' + id;
    utils.exec(query, data, cb);
  },

  delete: function(id, cb) {
    var query = 'DELETE FROM literatures WHERE id = ?';
    utils.exec(query, [id], cb);
  },

  findById: function(id, cb) {
    var query = 'SELECT * FROM ?? WHERE id = ?';
    var data = [this.table, id];
    utils.exec(query, data, cb);
  },

  findByUser: function(userid, cb) {
    var query = 'SELECT id, title, add_at FROM ?? WHERE user_id = ? ORDER BY add_at desc';
    var data = [this.table, userid];
    utils.exec(query, data, cb);
  },

  findByTitle: function(title, page, pageSize, callback) {
    
    var words = title.split(' '),
      query = squel.select()
        .from('literatures');

    words.forEach(function(word, index) {
      query = query.where("title like '%" + word + "%'")
    });

    query.offset((page-1)*pageSize)
      .limit(pageSize);

    console.log(query.toString());
    utils.exec(query.toString(), null, function(err, results) {
      if (err) {
        callback(err)
      };
      callback(null, results);
    });
  },

  findAll: function(title, callback) {
    var words = title.split(' '),
      query = squel.select()
        .from('literatures');

    words.forEach(function(word, index) {
      query = query.where("title like '%" + word + "%'")
    });

    utils.exec(query.toString(), null, function(err, results) {
      if (err) {
        callback(err)
      };
      callback(null, results);
    });
  }
}
var utils = require('../../lib/utils');

module.exports = {
  findAll: function(callback) {
    var query = "select * from literatures";
    var connection = utils.getDBConnection();
    utils.connectToDB(connection);
    connection.query(query, function(err, res) {
      utils.endDBConnection(connection);
      if (err) {
        callback(err);
      }
      callback(res);
    });
  },
  findByTitle: function(title,callback) {
    var query = "select * from literatures where title like '%"+title+"%'";
    var connection = utils.getDBConnection();
    utils.connectToDB(connection);
    connection.query(query, function(err, res) {
      utils.endDBConnection(connection);
      if (err) {
        callback(err);
      }
      callback(res);
    });
  }
}
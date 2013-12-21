var utils = require('../../lib/utils');
var squel = require('squel');

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
  findByTitle: function(title, callback) {
    var words = title.split(' '),
      query = squel.select()
        .from('literatures');
    
    words.forEach(function(word, index) {
      query = query.where("title like '%" + word + "%'")
    });

    console.log(query.toString());
    
    var connection = utils.getDBConnection();
    utils.connectToDB(connection);
    connection.query(query.toString(), function(err, results) {
      utils.endDBConnection(connection);
      if (err) {
        callback(err);
      }
      callback(null,results);
    });
  }
}
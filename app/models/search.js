var utils = require('../../lib/utils');
var squel = require('squel');

module.exports = {
  findByTitle: function(title, callback) {
    var words = title.split(' '),
      query = squel.select()
        .from('literatures');
    
    words.forEach(function(word, index) {
      query = query.where("title like '%" + word + "%'")
    });

    console.log(query.toString());
    utils.exec(query.toString(),null,function (err,results) {
      if (err) {
        callback(err)
      };
      callback(null,results);
    });
  }
}
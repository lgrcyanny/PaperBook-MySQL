var utils = require('../../lib/utils');
//var squel = require('squel');

module.exports = {
  table: 'references',
  save: function (referenceId, references, cb) {
    var values = '';
    var query = 'INSERT INTO paperbook.references (`reference`, `cited`, `type`) VALUES ';
    //console.log(references);
    for (var i = 0; i < references.length; i++) {
      var item = references[i];
      if (item.id) {
        values = values + '(' + '\'' +referenceId + '\'' + ', ' + '\'' + item.id + '\'' + ', ' + '\'' + item.type + '\')' + ',';
      }
    }
    if (values.length === 0) {
      cb (null, {
        message: 'No Records INSERT'
      })
    } else {
      //console.log(values);
      values = values.substr(0, (values.length - 1));
      query = query + values;
      console.log(query);
      utils.exec(query, null, cb);
    }
  },

  findByCited: function (citedId, cb) {
    var query = 'SELECT a.reference as id, b.title as title FROM ?? as a JOIN ?? as b on a.reference = b.id WHERE a.cited = ?';
    var data = [this.table, 'literatures', citedId]
    utils.exec(query, data, cb);
  },

  deleteByReference: function (referenceId, cb) {
    var query = 'DELETE FROM ?? WHERE reference = ?'
    var data = [this.table, referenceId]
    utils.exec(query, data, cb);
  }
}
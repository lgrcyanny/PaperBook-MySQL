var utils = require('../../lib/utils');
module.exports = {
  table: 'global_config',
  literatureConfigInfo: ['title', 'year', 'authors', 'url', 'pages', 'keywords', 'abstract', 'references', 'publisher', 'book', 'book_name', 'editors', 'editon', 'isbn', 'publication', 'volume', 'issue', 'city', 'doi', 'college'],
  /**
   * Find Config Info By Types
   * @param  {[mixed]} types, ['literature_type', 'rich_comment', 'reference_type'] or '*'
   */
  findByTypes: function (types, cb) {
    var query = '';
    var data = '';
    if (types === '*') {
      query = 'SELECT * FROM ?? WHERE id=1';
      data = [this.table];
    } else {
      query = 'SELECT ?? FROM ?? WHERE id=1';
      data = [types, this.table];
    }
    utils.exec(query, data, cb);
  },

  /**
   * Update, only for 'literature_type', 'rich_comment', 'reference_type'
   */
  save: function (configData, cb) {
    var query = 'UPDATE global_config SET ? WHERE id=1';
    utils.exec(query, configData, cb);
  }
}
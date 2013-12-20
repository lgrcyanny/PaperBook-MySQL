//Literature.plugin(textSearch);
var Search = require('../models/search');

exports.index = function(req, res) {
  res.render("search/index", {});
};

exports.showSearchResults = function(req, res) {
  var title = req.body.query;
  Search.findByTitle(title, function(results) {
    res.render('search/results', {
      title: 'results:',
      results: results
    });
  });
};
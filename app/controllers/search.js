//Literature.plugin(textSearch);
var Search = require('../models/search');

exports.index = function(req, res) {
  res.render("search/index", {});
};

exports.showSearchResults = function(req, res) {
  var title = req.body.query;
  if (!title && title != '') {
    title = req.session.query;
  }
  var page = req.query.p ? parseInt(req.query.p) : 1;
  Search.findByTitle(title, function(results) {
    var total = results.length;

    req.session.query = title;
    var limitedResults = [];
    var first = page * 10 - 10;
    var length = total - page * 10 + 10;
    if (length > 10) {
      length = 10;
    };
    console.log('results_page_' + page+':show results [' + first + "," + (first + length) + ")");
    for (var i = first; i < first + length; i++) {
      limitedResults.push(results[i]);
    }
    res.render('search/results', {
      title: 'results:',
      page: page,
      total: Math.floor(total / 10) + 1,
      isFirstPage: page == 1,
      isLastPage: (page * 10) >= total && ((page - 1) * 10) < total,
      results: limitedResults
    });
  });
};
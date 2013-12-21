//Literature.plugin(textSearch);
var Literature = require('../models/literature');
var querystring = require('querystring');
var url = require('url');

exports.index = function(req, res) {
  res.render("search/index", {});
};

exports.showSearchResults = function(req, res) {

  var title = querystring.parse(url.parse(req.url).query)["query"],
    startTime = new Date().getTime(),
    page = req.query.p ? parseInt(req.query.p) : 1,
    pageSize=10;

  title = (title === undefined) ? req.session.query : title;

  if (page == 1) {
    Literature.findAll(title, function(err, results) {
      if (err) {
        results = []
      };
      req.session.total = results.length;
      req.session.query = title;
    });
  };

  Literature.findByTitle(title, page, pageSize, function(err, results) {
    var endTime = new Date().getTime(),
      total = req.session.total;

    if (err) {
      results = [];
    };

    res.render('search/results', {
      title: 'results:',
      page: page,
      total: total,
      time: (endTime - startTime) / 1000,
      totalPage: Math.ceil(total / 10),
      isFirstPage: page == 1,
      isLastPage: page == this.totalPage,
      results: results
    });
  });
};
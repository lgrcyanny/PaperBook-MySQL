//Literature.plugin(textSearch);
var Literature = require('../models/literature');
var querystring=require('querystring');
var url=require('url');

exports.index = function(req, res) {
  res.render("search/index", {});
};

exports.showSearchResults = function(req, res) {

  var title=querystring.parse(url.parse(req.url).query)["query"];
  title = (title === undefined) ? req.session.query : title;
  console.log(title);
  var startTime = new Date().getTime();
  var page = req.query.p ? parseInt(req.query.p) : 1;
  Literature.findByTitle(title, function(err,results) {
    if (err) {
      results=[];
    };
    endTime = new Date().getTime();
    req.session.query = title;

    var total = results.length,
      first = (page - 1) * 10,
      length = ((total - first) > 10) ? 10 : (total - first),
      limitedResults = results.slice(first, first + length);

    console.log('results_page_' + page + ':show results [' + first + "," + (first + length) + ")");
    res.render('search/results', {
      title: 'results:',
      page: page,
      total: total,
      time: (endTime - startTime)/1000,
      totalPage: Math.ceil(total / 10),
      isFirstPage: page == 1,
      isLastPage: page == this.totalPage,
      results: limitedResults
    });
  });
};
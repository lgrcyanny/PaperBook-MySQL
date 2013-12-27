//Literature.plugin(textSearch);
var Literature = require('../models/literature');

exports.index = function (req, res) {
  res.render("search/index", {});
}

exports.showSearchResults = function (req, res) {

  var title = (req.query.query === undefined) ? req.session.query : req.query.query,
    startTime = new Date()
      .getTime(),
    page = req.query.p ? parseInt(req.query.p) : 1,
    pageSize = 10;

  if (req.query.query) {
    Literature.findAllByTitle(title, function (err, results) {
      if (err) {
        results = []
      };
      req.session.total = results.length;
      req.session.query = title;
    });
  }

  Literature.findByTitle(title, page, pageSize, function (err, results) {
    var endTime = new Date()
      .getTime(),
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
}

exports.showComplexSearchResults = function (res, req) {
  var condition = {
    // allWords: req.query.allWords,
    // exactPhrase: req.query.exactPhrase,
    // oneWords: req.query.oneWords,
    // withoutWords: req.query.withoutWords,
    // authors: req.query.authors,
    // publications: req.query.publications,
    // lYear: req.query.lYear,
    // rYear: req.query.rYear
  } //,
  // startTime = new Date()
  //   .getTime(),
  // page = req.query.p ? parseInt(req.query.p) : 1,
  // pageSize = 10;


  // if (req.query.allWords === undefined) {
  //   condition = req.session.condition;
  // };
  condition = {
    allWords: 'per',
    exactPhrase: 'cloud',
    oneWords: 'of',
    withoutWords: 'ggg hhhh',
    authors: 'Iosup A',
    publications: 't2 t3',
    lYear: 2000,
    rYear: 2012
  };

  Literature.findAll(condition, function (err, results) {
    results.forEach(function (result, index) {
      console.log(result.title);
      if (err) {
        results = [];
      };
    });
  });
}
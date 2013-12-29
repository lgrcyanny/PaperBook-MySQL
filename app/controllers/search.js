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

  if (!req.query.query) {
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

exports.showAdvancedSearchResults = function (req, res) {
  var condition = {
    allWords: req.query.allWords,
    exactPhrase: req.query.exactPhrase,
    oneWords: req.query.oneWords,
    withoutWords: req.query.withoutWords,
    authors: req.query.authors,
    publications: req.query.publications
    // lYear: req.query.lYear,
    // rYear: req.query.rYear
  },
    startTime = new Date()
      .getTime();
  // page = req.query.p ? parseInt(req.query.p) : 1,
  // pageSize = 10;


  // if (req.query.allWords === undefined) {
  //   condition = req.session.condition;
  // };

  Literature.findAll(condition, function (err, results) {
    // results.forEach(function (result, index) {
    //   console.log(result.title);
    // });
    var endTime = new Date()
      .getTime();
    if (err) {
      results = [];
      res.send({
        success: false
      });
    } else {
      res.send({
        success: true,
        title: 'results:',
        page: 1,
        total: 1,
        time: (endTime - startTime) / 1000,
        totalPage: Math.ceil(this.total / 10),
        isFirstPage: this.page == 1,
        isLastPage: this.page == this.totalPage,
        results: results
      });
    };
  });
}
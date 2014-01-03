var Statistics = require('../models/statistics');

exports.globalView = function (req, res) {
  var options = {};
  res.render('statistics/global', {
    title: 'statistics',
  });
}

exports.getGlobalViewData = function (req, res) {
  Statistics.getGlobalViewData(function (results) {
    res.send({
      success: true,
      results: results
    });
  })
}
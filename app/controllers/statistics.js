var Statistics = require('../models/statistics');

exports.globalView = function (req, res) {
  var options = {};
  res.render('statistics/global', {
    title: 'statistics',
  });
}

exports.getGlobalViewData = function (req, res) {
  Statistics.getGlobalViewData(function (data) {
    res.send({
      success: true,
      data: data
    });
  })
}
//var Statistics = require('../models/statistics');

exports.globalView = function (req, res) {
  var options = {};
  res.render('statistics/global', {
    title: 'statistics',
  });
}
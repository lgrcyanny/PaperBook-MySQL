var Statistics = require('../models/statistics');

exports.globalView = function (req, res) {
  var options = {};
  res.render('statistics/global', {
    title: 'statistics',
  });
}

exports.briefCommentsView = function (req, res) {
  var options = {};
  res.render('statistics/brief-comments', {
    title: 'statistics',
  });
}

exports.getGlobalViewData = function (req, res) {
  Statistics.getGlobalViewData(function (highchartsData) {
    res.send({
      success: true,
      highchartsData: highchartsData
    });
  })
}

exports.getUserViewData = function (req, res) {
  Statistics.getUserViewData(req, function (highstockData) {
    res.send({
      success: true,
      highstockData: highstockData,
      username: req.user.username
    });
  })
}

exports.getBriefCommentsData = function (req, res) {
  Statistics.getBriefCommentsData(req, function (highchartsData, highstockData) {
    res.send({
      success: true,
      highchartsData: highchartsData,
      highstockData: highstockData,
      username: req.user.username
    });
  });
}
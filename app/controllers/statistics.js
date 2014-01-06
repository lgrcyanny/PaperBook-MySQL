var Statistics = require('../models/statistics');

exports.literaturesView = function (req, res) {
  res.render('statistics/literatures', {
    title: 'statistics',
  });
}


exports.getLiteraturesData = function (req, res) {
  Statistics.getLiteraturesData(req, function (highchartsData, highstockData) {
    res.send({
      success: true,
      highchartsData: highchartsData,
      highstockData: highstockData,
      username: req.user.username
    });
  })
}

exports.briefCommentsView = function (req, res) {
  res.render('statistics/brief-comments', {
    title: 'statistics',
  });
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

exports.richCommentsView = function (req, res) {
  res.render('statistics/rich-comments', {
    title: 'statistics',
  });
}

exports.getRichCommentsData = function (req, res) {
  Statistics.getRichCommentsData(req, function (highchartsData, highstockData) {
    res.send({
      success: true,
      highchartsData: highchartsData,
      highstockData: highstockData,
      username: req.user.username
    });
  });
}
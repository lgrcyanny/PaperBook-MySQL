var configModel = require('../models/global-config');
var userModel = require('../models/user');
var moment = require('moment');
var _ = require('underscore');
exports.showAdminPage = function (req, res) {

  configModel.findByTypes('*', function (err, results) {
    if (err) {
      return next(err);
    }
    var config = wrapConfigForAdminPageShow(results[0]);
    userModel.findAll(function (err, users) {
      if (err) {
        return next(err);
      }
      res.render('admin/config', {
        title: 'PaperBook Config',
        literatureTypes: config.literature_type,
        literatureConfigInfo: configModel.literatureConfigInfo,
        richComment: config.rich_comment,
        referenceType: config.reference_type,
        users: users
      });
    });
  });
}

exports.saveConfig = function (req, res) {
  var configInfo = req.body.configInfo;
  var configType = req.body.configType;
  var configData = {};
  configData[configType] = configInfo;
  configModel.save(configData, function (err) {
    if (err) {
      res.send({
        success: false,
        error: err
      });
    }
    res.send({
      success: true
    });
  });
}

exports.removeUser = function (req, res) {
  var userId = req.body.userId;
  userModel.deleteById(userId, function (err) {
    if (err) {
      res.send({
        success: false,
        error: err
      });
    }
    res.send({
      success: true
    });
  });
}

/**
 * Private Functions
 */
var wrapConfigForAdminPageShow = function (config) {
 config.literature_type = JSON.parse(config.literature_type);
 config.rich_comment = JSON.parse(config.rich_comment);
 config.reference_type = JSON.parse(config.reference_type);
  return config;
}

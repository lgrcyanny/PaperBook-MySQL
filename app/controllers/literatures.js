/**
 * Module Dependencies
 */
var literatureModel = require('../models/literature');
var fs = require('fs');
var mkdirp = require('mkdirp');
var path = require('path');
var moment = require('moment');
var env = process.env.NODE_ENV || 'development';
var config = require('../../config/config')[env];

exports.fetchById = function (req, res, next, id) {
  var literature = literatureModel.findById(id, function (err, results) {
    if (err) return next(err);
    var literature = wrapLiteratureForShow(results[0]);
    req.literature = literature;
    next();
  });
}

exports.showUploadPage = function (req, res) {
  res.render('literatures/upload', {
    title: 'Upload literature',
    literature: {},
    returnUrl: '',
    requestUrl: '/literatures'
  });
}

exports.create = function (req, res, next) {
  //console.log(req.body);
  var literature = wrapLiteratureForDBSave(req.user.id, req.body.literature);
  literatureModel.save(literature, function (err, result) {
    if (err) {
      return next(err);
    }
    if (result) {
      res.send({
        success: true,
        literatureId: result.insertId
      });
    }
  });
}

exports.showUpdatePage = function (req, res, next) {
  var literature = req.literature;
  res.render('literatures/upload', {
    title: 'Update Literature',
    literature: literature,
    returnUrl: '/myliterature',
    requestUrl: '/literatures/update/' + literature.id
  });
}

exports.update = function (req, res, next) {
  var id = req.param('updateId');
  var literature = wrapLiteratureForDBSave(req.user.id, req.body.literature);
  literatureModel.update (id, literature, function (err, result) {
    if (err) {
      return next(err);
    }
    if (result) {
      console.log(result);
      res.send({
        success: true,
        literatureId: id
      });
    }
  });
}


exports.showDetailPage = function (req, res) {
  res.render('literatures/detail', {
    title: 'Cloud Computing'
  });
}

exports.uploadFileLiterature = function (req, res) {
  var file = req.files.literature;
  uploadFile(file, 'literatures', req.user.username, res);
}

exports.uploadFileAccessory = function (req, res) {
  var file = req.files.accessory;
  uploadFile(file, 'accessories', req.user.username, res);
}

exports.removeFile = function (req, res) {
  var filepath = req.body.filepath;
  console.log(filepath);
  fs.unlink(filepath, function (err) {
    if (err) {
      console.log(err);
      res.send({
        success: false,
        error: err
      });
    }
    res.send({success: true});
  });
}


exports.showMyLiteraturePage = function (req, res, next) {
  var userid = req.user.id;
  literatureModel.findByUser(userid, function (err, results) {
    if (err) {
      return next(err);
    }
    //console.log(results);
    res.render('literatures/my-literature', {
      title: 'My Literature',
      literatures: results
    });
  });
}

exports.remove = function (req, res) {
  var id = req.param('removeId');
  literatureModel.delete(id, function (err, results) {
    if (err) {
      res.send({
        success: false,
        error: err
      });
    }
    res.send({
      success: true
    })
  });
}

/**
 * Private Functions
 */

/**
 * Upload File to uploadDir defaults to 'root/uploads'
 * @param  {[file]} file
 * @param  {[String]} type 'literatures' or 'accessories'
 * @param  {[Object]} res      resoponse object
 */
var uploadFile = function (file, type, username, res) {
  var filename = file.originalFilename;
  var filepath = file.path;
  var year = moment().format('YYYY');
  var month = moment().format('MM');
  var date = moment().format('DD');
  var uploadDir = config.uploadDir;
  var destDir = uploadDir + '/' + username + '/' + type + '/' + year + '/' + month + '/' + date;
  var serverpath = destDir + '/' + filename;
  mkdirp(destDir, function (err) {
    if (err) {
      console.log(err);
      res.send({success: false, errors: err});
    }
    fs.rename(filepath, serverpath, function (err) {
      if (err) {
        console.log(err);
        res.send({success: false, errors: err});
      }
      res.send({
        success: true,
        file: {
          name: filename,
          path: serverpath
        }
      });
    });
  });
}

var wrapLiteratureForDBSave = function (userid, literature) {
  if (literature.accessories) {
    literature.accessories = literature.accessories.join(',');
  } else {
    literature.accessories = null;
  }

  if (!literature.file_path) {
    literature.file_path = null;
  }

  literature.user_id = userid;
  return literature;
}

var wrapLiteratureForShow = function (literature) {
  if (literature.file_path) {
    literature.filename = path.basename(literature.file_path);
  }

  if (literature.accessories) {
    var accessories = literature.accessories.split(',');
    literature.accessories = [];
    for (var i = 0; i <  accessories.length; i++) {
      var item = accessories[i];
      var obj = {
        name: path.basename(item),
        path: item
      }
      literature.accessories.push(obj);
    }
  }
  return literature;
}


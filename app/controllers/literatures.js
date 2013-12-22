/**
 * Module Dependencies
 */
var literatureModel = require('../models/literature');
var referenceModel = require('../models/reference');
var fs = require('fs');
var mkdirp = require('mkdirp');
var path = require('path');
var moment = require('moment');
var env = process.env.NODE_ENV || 'development';
var config = require('../../config/config')[env];

exports.fetchById = function (req, res, next, id) {
  var literature = literatureModel.findById(id, function (err, results) {
    if (err) return next(err);
    if (results.length === 0) {
      return next({
        message: 'not found'
      });
    }
    var literature = wrapLiteratureForShow(results[0]);
    req.literature = literature;
    next();
  });
}

exports.fetchByTitle = function (req, res, next) {
  var title = req.query.title;
  literatureModel.findByTitle(title, 1, 10, function (err, results) {
    if (err) {
      res.send({
        error: err,
        success: false
      })
    }
    res.send({
      success: true,
      literatures: results
    })
  });
}

exports.showUploadPage = function (req, res) {
  res.render('literatures/upload', {
    title: 'Upload literature',
    returnUrl: '',
    requestUrl: '/literatures',
    categories: [{
      name: 'Book',
      info: ['title', 'year', 'authors', 'url', 'pages', 'keywords', 'abstract', 'references', 'publisher', 'edition', 'editors', 'isbn']
    },
    {
      name: 'BookSection',
      info: ['title', 'year', 'authors', 'url', 'pages', 'keywords', 'abstract', 'references', 'book_name','publisher', 'edition', 'editors', 'isbn']
    },
    {
      name: 'Journal',
      info: ['title', 'year', 'authors', 'url', 'pages', 'keywords', 'abstract', 'references', 'publication', 'volume', 'issue', 'doi']
    },
    {
      name: 'Conference',
      info: ['title', 'year', 'authors', 'url', 'pages', 'keywords', 'abstract', 'references', 'publication', 'city', 'doi']
    },
    {
      name: 'Thesis',
      info: ['title', 'year', 'authors', 'url', 'pages', 'keywords', 'abstract', 'references', 'college']
    },
    {
      name: 'Online',
      info: ['title', 'year', 'authors', 'url', 'pages', 'keywords', 'abstract', 'references']
    },
    {
      name: 'Report',
      info: ['title', 'year', 'authors', 'url', 'pages', 'keywords', 'abstract', 'references']
    }],
    referencesType: ['Mention', 'Related', 'Use', 'Compare', 'Unknown']
  });
}

exports.create = function (req, res, next) {
  var literature = wrapLiteratureForDBSave(req.user.id, req.body.literature);
  literatureModel.save(literature, function (err, result) {
    if (err) {
      return next(err);
    }
    //console.log(req.body.literature.references);
    if (result) {
      // Since object param is parsed by reference, so references is stringified now.
      var references = JSON.parse(req.body.literature.references);
      referenceModel.save(result.insertId, references, function (err, saveRes) {
        if (err) {
          return next(err);
        }

        res.send({
          success: true,
          literatureId: result.insertId
        });
      })
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
  var literature = req.literature;
  res.render('literatures/detail', {
    title: literature.title,
    literature: literature
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

exports.fetchCited = function (req, res) {
  var id = req.query.id;
  referenceModel.findByCited(id, function (err, results) {
    if (err) {
      throw err;
    }
    res.send({
      success: true,
      results: results
    });
  })
}

exports.removeCited = function (req, res) {
  var id = req.body.referenceId;
  referenceModel.deleteByReference(id, function (err, results) {
    if (err) {
      res.send({
        success: false,
        error: err
      })
    }
    res.send({
      success: true,
      results: results
    })
  })
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
    literature.accessories = JSON.stringify(literature.accessories);
  }

  if (!literature.file_path) {
    literature.file_path = null;
  }

  literature.references = JSON.stringify(literature.references);

  literature.user_id = userid;
  return literature;
}

var wrapLiteratureForShow = function (literature) {
  if (literature.file_path) {
    literature.filename = path.basename(literature.file_path);
  }

  if (literature.accessories) {
    var accessories = JSON.parse(literature.accessories);
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

  literature.references = JSON.parse(literature.references);
  return literature;
}

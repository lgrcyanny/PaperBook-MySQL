var richCommentModel = require('../models/rich-comment');
var moment = require('moment');

exports.fetchDraft = function (req, res) {
  var literatureId = req.query.literatureId;
  if (!req.user) {
    res.send({
      success: true,
      comment: null
    });
  }
  var userId = req.user.id;
  richCommentModel.findDraft(literatureId, userId, function (err, results) {
    if (err) {
      res.send({
        success: false,
        error: err
      });
    }
    var comment = null;
    if (results.length >= 1) {
      comment = results[0];
      comment.content = JSON.parse(comment.content);
    }
    res.send({
      success: true,
      comment: comment
    });
  });
}

exports.fetchComments = function (req, res) {
  var literatureId = req.query.literatureId;
  richCommentModel.findByLiterature(literatureId, function (err, results) {
    if (err) {
      res.send({
        success: false,
        error: err
      });
    }
    for (var i = 0; i < results.length; i++) {
      var item = results[i];
      item.content = JSON.parse(item.content.trim());
      item.created_at = moment(item.created_at).format('YYYY-MM-DD HH:mm:ss');
    }
    res.send({
      success: true,
      comments: results
    });
  });
}

/**
 * param: comment
 */
exports.saveDraft = function (req, res) {
  if (!req.user) {
    res.send({
      success: false,
      error: 'Please Signin.'
    });
  }
  var comment = req.body.comment;
  comment.publish = 0;
  comment.user_id = req.user.id;
  var commentId = comment.id ? comment.id : null;
  delete comment['id'];
  handleCommentDBSave(comment, commentId, res);
}

/**
 * param: comment
 */
exports.publish = function (req, res) {
  if (!req.user) {
    res.send({
      success: false,
      error: 'Please Signin.'
    });
  }
  var comment = req.body.comment;
  comment.publish = 1;
  comment.user_id = req.user.id;
  var commentId = comment.id ? comment.id : null;
  delete comment['id'];
  //console.log(comment);
  handleCommentDBSave(comment, commentId, res);
}

/**
 * Private Functions
 */
var handleCommentDBSave = function (data, commentId, res) {
  if (commentId) {
    // The record is already in db
    richCommentModel.updateById(commentId, data, function (err) {
      if (err) {
        res.send({
          success: false,
          error: err
        });
      }
      richCommentModel.findById(commentId, function (err, results) {
        if (err) {
          res.send({
            success: false,
            error: err
          });
        }
        var comment = results[0];
        comment.content = JSON.parse(comment.content);
        comment.created_at = moment(comment.created_at).format('YYYY-MM-DD HH:mm:ss');
        res.send({
          success: true,
          comment: comment
        });
      })
    });
  } else {
    // The record isn't in db
    richCommentModel.save(data, function (err, saveRes) {
      if (err) {
        res.send({
          success: false,
          error: err
        });
      }
      richCommentModel.findById(saveRes.insertId, function (err, results) {
        if (err) {
          res.send({
            success: false,
            error: err
          });
        }
        var comment = results[0];
        comment.content = JSON.parse(comment.content);
        comment.created_at = moment(comment.created_at).format('YYYY-MM-DD HH:mm:ss');
        res.send({
          success: true,
          comment: comment
        });
      })
    });
  }
}


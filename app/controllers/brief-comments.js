var briefCommentsModel = require('../models/brief-comment');

exports.fetchBriefComments = function (req, res) {
  var id = req.query.literatureId;
  briefCommentsModel.find
  (id, function (err, res) {
    if (err) {
      res.send({
        success: false
        error: err
      });
    }
    res.send({
      success: true,
      result: res
    })
  })
}
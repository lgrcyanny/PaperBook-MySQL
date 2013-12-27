$(function () {
  var literatureComment = {
    rootUrl: 'http://' + window.location.hostname + ':' + window.location.port,
    init: function () {

    },
    sendRequest: function () {

    },
    loadBriefComment: function () {
      var self = this;

      $.ajax({
        url: self.rootUrl + '/literatures/detail/briefcomments',
        type: 'GET',
        data: {
          literatureId: $('input#literature-id').val()
        },
        success: function (res, textStatus) {
          if (res.success) {
            
          }
        }
      })
    }
  }
})
$(function () {
  var myLiterature = {
    rootUrl: 'http://' + window.location.hostname + ':' + window.location.port,

    init: function () {
      this.addRemoveActionListener();
    },

    addRemoveActionListener: function () {
      var self = this;
      $('.remove-literature').click(function () {
        var requestUrl = $(this).data('requesturl');
        var nodeself = $(this);
        $.ajax({
          url: self.rootUrl + requestUrl,
          type: 'POST',
          data: {},
          success: function (res, textStatus) {
            if (res.success) {
              nodeself.parents('tr').remove();
            } else {
              console.log(res);
            }
          }
        });
      });
    }
  }
  myLiterature.init();
})
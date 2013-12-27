$(function () {
  var richComment = {
    rootUrl: 'http://' + window.location.hostname + ':' + window.location.port,
    literatureId: $('input#literature-id').val(),
    richCommentType: JSON.parse(unescape($('input#rich-comment-type').val())),
    init: function () {
      this.loadCommentModal();
      this.loadCommentList();
      this.addModalActionListener();
    },

    loadCommentModal: function () {
      var self = this;
      $.ajax({
        url: self.rootUrl + '/literatures/detail/comments/rich/draft',
        type: 'GET',
        data: {
          literatureId: $('input#literature-id').val()
        },
        success: function (res) {
          if (res.success) {
            var comment = res.comment;
            var modalHTML = new EJS({url: '/comments/rich-comment-modal.ejs'}).render({
              richCommentType: self.richCommentType,
              comment: comment
            });
            $('div#rich-comments').append(modalHTML);
            self.addModalActionListener();
          }
        }
      });
    },

    loadCommentList: function () {
      var self = this;
      $.ajax({
        url: self.rootUrl + '/literatures/detail/comments/rich',
        type: 'GET',
        data: {
          literatureId: $('input#literature-id').val()
        },
        success: function (res) {
          if (res.success) {
            var comments = res.comments;
            var listHTML = new EJS({url: '/comments/rich-comment-list.ejs'}).render({
              comments: comments
            });
            $('div#rich-comments-list').append(listHTML);
          }
        }
      });
    },

    addModalActionListener: function () {
      var self = this;
      $('#rich-comment-save-draft-btn').click(function () {
        self.sendSaveDraftRquest();
      });
      $('#rich-comment-publish-btn').click(function () {
        self.sendPublishRequest();
      });
    },

    sendSaveDraftRquest: function () {
      var self = this;
      var comment = this.handleForm();
      console.log(comment);
      $.ajax({
        url: self.rootUrl + '/literatures/detail/comments/rich/draft',
        type: 'POST',
        data: {
          comment: comment
        },
        success: function (res) {
          if (res.success) {
            $('input#rich-comment-draft-id').val(res.comment.id);
            var alertSuccessHTML = new EJS({url: '/alerts/alert-success.ejs'}).render({});
            $('#rich-comment-modal .modal-body').append(alertSuccessHTML);
          } else {
            var alertErrorHTML = new EJS({url: '/alerts/alert-error.ejs'}).render({
              error: res.error
            });
            $('#rich-comment-modal .modal-body').append(alertErrorHTML);
          }
        }
      });
    },

    sendPublishRequest: function () {
      var self = this;
      var comment = this.handleForm();
      $.ajax({
        url: self.rootUrl + '/literatures/detail/comments/rich',
        type: 'POST',
        data: {
          comment: comment
        },
        success: function (res) {
          if (res.success) {
            $('#rich-comment-modal input, #rich-comment-modal textarea').val('');
            var commentItemHTML = new EJS({url: '/comments/rich-comment-item.ejs'}).render({
              comment: res.comment
            });
            console.log(commentItemHTML);
            $('#rich-comment-modal').modal('hide');
            $('#rich-comments-list-accordion .panel-collapse').removeClass('in').addClass('collapse');
            $('#rich-comments-list-accordion').prepend(commentItemHTML);
          } else {
            var alertErrorHTML = new EJS({url: '/alerts/alert-error.ejs'}).render({
              error: res.error
            });
            $('#rich-comment-modal .modal-body').append(alertErrorHTML);
          }
        }
      });
    },

    handleForm: function () {
      var comment = {};
      var content = {};
      content.Title = $('#rich-comment-modal input#Title').val().trim();
      comment.id = $('input#rich-comment-draft-id').val() ? $('input#rich-comment-draft-id').val() : null;
      comment.literature_id = this.literatureId;
      $('#rich-comment-modal form textarea').each(function () {
        var value = $(this).val().trim();
        if (value.length > 0) {
          content[$(this).attr('name')] = value;
        }
      });
      comment.content = JSON.stringify(content);
      return comment;
    }
  }
  richComment.init();
});
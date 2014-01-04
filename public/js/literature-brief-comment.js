$(function () {
  var briefComment = {
    rootUrl: 'http://' + window.location.hostname + ':' + window.location.port,
    literatureId: $('input#literature-id').val(),
    init: function () {
      this.loadCommentModal();
      this.loadCommentList();
      this.addModalActionListener();
    },

    loadCommentModal: function () {
      var self = this;
      $.ajax({
        url: self.rootUrl + '/literatures/detail/comments/brief/draft',
        type: 'GET',
        data: {
          literatureId: self.literatureId
        },
        success: function (res) {
          if (res.success) {
            var comment = res.comment;
            var modalHTML = new EJS({url: '/comments/brief-comment-modal.ejs'}).render({
              comment: comment
            });
            $('div#brief-comments').append(modalHTML);
            self.addModalActionListener();
          }
        }
      });
    },

    loadCommentList: function () {
      var self = this;
      $.ajax({
        url: self.rootUrl + '/literatures/detail/comments/brief',
        type: 'GET',
        data: {
          literatureId: self.literatureId
        },
        success: function (res) {
          if (res.success) {
            var comments = res.comments;
            var listHTML = new EJS({url: '/comments/brief-comment-list.ejs'}).render({
              comments: comments
            });
            $('div#brief-comments-list').append(listHTML);
          }
        }
      });
    },

    addModalActionListener: function () {
      var self = this;
      $('#brief-comment-save-draft-btn').click(function () {
        self.sendSaveDraftRquest();
      });
      $('#brief-comment-publish-btn').click(function () {
        self.sendPublishRequest();
      });
    },

    sendSaveDraftRquest: function () {
      var self = this;
      var comment = this.handleForm();
      console.log(comment);
      $.ajax({
        url: self.rootUrl + '/literatures/detail/comments/brief/draft',
        type: 'POST',
        data: {
          comment: comment
        },
        success: function (res) {
          if (res.success) {
            $('input#brief-comment-draft-id').val(res.comment.id);
            var alertSuccessHTML = new EJS({url: '/alerts/alert-success.ejs'}).render({});
            $('#brief-comment-modal .modal-body').append(alertSuccessHTML);
          } else {
            var alertErrorHTML = new EJS({url: '/alerts/alert-error.ejs'}).render({
              error: res.error
            });
            $('#brief-comment-modal .modal-body').append(alertErrorHTML);
          }
        }
      });
    },

    sendPublishRequest: function () {
      var self = this;
      var comment = this.handleForm();
      console.log(comment);
      $.ajax({
        url: self.rootUrl + '/literatures/detail/comments/brief',
        type: 'POST',
        data: {
          comment: comment
        },
        success: function (res) {
          if (res.success) {
            $('#brief-comment-modal input, #brief-comment-modal textarea').val('');
            var commentItemHTML = new EJS({url: '/comments/brief-comment-item.ejs'}).render({
              comment: res.comment
            });
            var rateInfoHTML = new EJS({url: '/literatures/rate-info.ejs'}).render({
              scoreAvg: res.scoreAvg,
              scoreCount: res.scoreCount
            });

            var tagsInfoHTML = new EJS({url: '/literatures/tags-info.ejs'}).render({
              tags: res.tags
            });

            //Update rate info on detail page
            $('div#literature-rating span#literature-rating-star').remove();
            $('div#literature-rating').append(rateInfoHTML);

            // Update tags info
            $('div.tab-content div#tags').empty().append(tagsInfoHTML);

            //console.log(commentItemHTML);
            $('#brief-comment-modal').modal('hide');
            $('#brief-comments-list ul').prepend(commentItemHTML);
          } else {
            var alertErrorHTML = new EJS({url: '/alerts/alert-error.ejs'}).render({
              error: res.error
            });
            $('#brief-comment-modal .modal-body').append(alertErrorHTML);
          }
        }
      });
    },

    handleForm: function () {
      var comment = {};
      comment.id = $('input#brief-comment-draft-id').val() ? $('input#brief-comment-draft-id').val() : null;
      comment.score = $('#brief-comment-modal input#rate').val();
      comment.tags = $('#brief-comment-modal input#tags').val().trim().split(',').join(',');
      comment.literature_id = this.literatureId;
      comment.content = $('#brief-comment-modal textarea#content').val().trim();
      return comment;
    }
  }
  briefComment.init();
});
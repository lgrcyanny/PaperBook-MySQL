$(function () {
  'use strict';
  var commentTags = {
    rootUrl: 'http://' + window.location.hostname + ':' + window.location.port,
    literatureId: $('input#literature-id').val(),
    init: function () {
      this.addTagsBackupInfoToModal();
    },

    /**
     * Unused function
     */
    addTagsTypeaheadListener: function () {
      var self = this;
      $('div.modal div.modal-body input.tags-typeahead').typeahead({
        source: function (query, process) {
          $.ajax({
            url: self.rootUrl + '/literatures/detail/tags',
            type: 'GET',
            data: {
              literatureId: self.literatureId
            },
            success: function (res) {
              if (res.success) {
                var tags = res.tags ? res.tags.split(',') : [];
                process(tags);
              }
            }
          });
        }
      });
    },

    addTagsBackupInfoToModal: function () {
      var self = this;
      $.ajax({
        url: self.rootUrl + '/literatures/detail/tags',
        type: 'GET',
        data: {
          literatureId: self.literatureId
        },
        success: function (res) {
          if (res.success) {
            var tags = res.tags ? res.tags.split(',') : [];
            var tagsHTML = new EJS({url: '/comments/tags-backup.ejs'}).render({
              tags: tags
            });
            console.log(tagsHTML);
            $('div.modal div.modal-body div.tags-info').append(tagsHTML);
            self.addTagsBackupInfoListener();
          }
        }
      });
    },

    addTagsBackupInfoListener: function () {
      $('div.modal div.modal-body div.tags-info div.tags-backup-content span').click(function () {
        var text = $(this).text().trim();
        console.log(text);
        var currentTags = $(this).parents('div.tags-info').find('input').val();
        if (currentTags && currentTags.length > 0 ) {
          text = currentTags + ',' + text;
        }
        $(this).parents('div.tags-info').find('input').val(text);
      });
    }
  }

  window.commentTags = commentTags;
  commentTags.init();
});
$(function () {
  'use strict';
  var literatureDetail = {
    rootUrl: 'http://' + window.location.hostname + ':' + window.location.port,
    init: function () {
      this.addCheckBoxListener();
      this.addDownloadListener();
    },

    addCheckBoxListener: function () {
      $('div.tab-pane .checkbox-options input:checkbox').change(function () {
        var reftypes = [];
        $(this).parents('.checkbox-options').find('input:checked').each(function () {
          reftypes.push($(this).val());
        });
        $(this).parents('div.tab-pane').find('li').each(function () {
          if (reftypes.indexOf($(this).data('ref-type')) >= 0) {
            $(this).css('display', 'block');
          } else {
            $(this).css('display', 'none');
          }
        })
      });
    },

    addDownloadListener: function () {
      var self = this;
      $('div#literature-meta dd span.file-download-btn').click(function () {
        var filepath = $(this).attr('data-filepath');
        var requestpath = self.rootUrl + '/literatures/detail/download?filepath=' + filepath;

        // This is trick, since ajax cant handle download because of security limit
        var link = document.createElement('a');
        link.href = requestpath;
        link.click();
      });
    }
  }
  literatureDetail.init();
})

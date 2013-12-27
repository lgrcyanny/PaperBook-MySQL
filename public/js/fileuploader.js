$(function () {
'use strict';
var fileUploader = {
  rootURL: 'http://' + window.location.hostname + ':' + window.location.port,

  init: function () {
    this.addLiteratureFileUploadListener();
    this.addAccessorFileUploadListener();
    fileUploader.addRemoveActionListener('div.tab-pane #uploaded-literature .remove-file');
    fileUploader.addRemoveActionListener('div.tab-pane #uploaded-accessories .remove-file');
  },

  addLiteratureFileUploadListener: function () {
    $('div.tab-pane #file-upload-literature').fileupload({
        url: fileUploader.rootURL + '/literatures/upload/files/literature',
        dataType: 'json',
        done: function (e, data) {
            var file = data.result.file;
            var html = fileUploader.generateUploadedFilesHtml(file, 'file');
            $('div.tab-pane #uploaded-literature').empty().append(html);
            fileUploader.addRemoveActionListener('div.tab-pane #uploaded-literature .remove-file');
            setTimeout(function () {
                $('div.tab-pane #upload-progress-literature').css('display', 'none');
            }, 2000);
        },
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('div.tab-pane #upload-progress-literature').css('display', 'block');
            $('div.tab-pane #upload-progress-literature .progress-bar').css({
                width: progress + '%'
            });
        }
    }).prop('disabled', !$.support.fileInput)
        .parent().addClass($.support.fileInput ? undefined : 'disabled');
  },

  addAccessorFileUploadListener: function () {
    $('div.tab-pane #file-upload-accessory').fileupload({
        url: fileUploader.rootURL + '/literatures/upload/files/accessory',
        dataType: 'json',
        done: function (e, data) {
            var file = data.result.file;
            var html = fileUploader.generateUploadedFilesHtml(file, 'accessories[]');
            $('div.tab-pane #uploaded-accessories').append(html);
            fileUploader.addRemoveActionListener('div.tab-pane #uploaded-accessories .remove-file');
            setTimeout(function () {
                $('div.tab-pane #upload-progress-accessory').css('display', 'none');
            }, 2000);
        },
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('div.tab-pane #upload-progress-accessory').css('display', 'block');
            $('div.tab-pane #upload-progress-accessory .progress-bar').css(
                'width',
                progress + '%'
            );
        }
    }).prop('disabled', !$.support.fileInput)
        .parent().addClass($.support.fileInput ? undefined : 'disabled');
  },

  addRemoveActionListener: function (removeBtn) {
    $(removeBtn).click(function (e) {
        var self = $(this);
        $.ajax({
            type: 'POST',
            url: fileUploader.rootURL + '/literatures/upload/files/remove',
            data: {
                filepath: self.data('path')
            },
            success: function (res, textStatus) {
                if (res.success || res.error.code === 'ENOENT') {
                    self.parents('p').remove();
                }
            }
        })
    });
  },

  generateUploadedFilesHtml: function (file, inputname) {
    var html = '<p>' +
                file.name + ' (' + file.size + ')' +
                '<span data-path="' + file.path + '" class="remove-file glyphicon glyphicon-remove"></span>'  +
                '<input type="hidden" name="' + inputname + '" value="' + escape(JSON.stringify(file)) +'" />' +
                '</p>';
    return html;
  }
}

fileUploader.init();

});
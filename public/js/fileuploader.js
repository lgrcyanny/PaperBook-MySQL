$(function () {
'use strict';
var fileUploader = {
  rootURL: 'http://' + window.location.hostname + ':' + window.location.port,

  init: function () {
    this.addLiteratureFileUploadListener();
    this.addAccessorFileUploadListener();
    fileUploader.addRemoveActionListener('#uploaded-literature .remove-file');
    fileUploader.addRemoveActionListener('#uploaded-accessories .remove-file');
  },

  addLiteratureFileUploadListener: function () {
    $('#file-upload-literature').fileupload({
        url: fileUploader.rootURL + '/literatures/upload/files/literature',
        dataType: 'json',
        done: function (e, data) {
            var file = data.result.file;
            var html = fileUploader.generateUploadedFilesHtml(file, 'file_path');
            $('#uploaded-literature').empty().append(html);
            fileUploader.addRemoveActionListener('#uploaded-literature .remove-file');
            setTimeout(function () {
                $('#upload-progress-literature').css('display', 'none');
            }, 3000);
        },
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('#upload-progress-literature').css('display', 'block');
            $('#upload-progress-literature .progress-bar').css({
                width: progress + '%'
            });
        }
    }).prop('disabled', !$.support.fileInput)
        .parent().addClass($.support.fileInput ? undefined : 'disabled');
  },

  addAccessorFileUploadListener: function () {
    $('#file-upload-accessory').fileupload({
        url: fileUploader.rootURL + '/literatures/upload/files/accessory',
        dataType: 'json',
        done: function (e, data) {
            var file = data.result.file;
            var html = fileUploader.generateUploadedFilesHtml(file, 'accessories[]');
            $('#uploaded-accessories').append(html);
            fileUploader.addRemoveActionListener('#uploaded-accessories .remove-file');
            setTimeout(function () {
                $('#upload-progress-accessory').css('display', 'none');
            }, 3000);
        },
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('#upload-progress-accessory').css('display', 'block');
            $('#upload-progress-accessory .progress-bar').css(
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
                file.name +
                '<span data-path="' + file.path + '" class="remove-file glyphicon glyphicon-remove"></span>'  +
                '<input type="hidden" name="' + inputname + '" value="' + file.path +'" />' +
                '</p>';
    return html;
  }
}

fileUploader.init();

});
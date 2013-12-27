$(function () {
  'use strict';
  var literatureUploader = {
    rootUrl: 'http://' + window.location.hostname + ':' + window.location.port,
    init: function () {
      this.addActionListener();
      this.initTypeahead();
      this.addReferenceActionListener();
      this.addReferenceTypeaheadListener();
    },

    /**
     * Process Form Data before ajax Rquest
     * @return {[Object]} the processed literature
     */
    handleForm: function () {
      var data = {};
      // fetch  info
      $('div#upload-info div.tab-pane.active input:not(input[type="file"]), div#upload-info div.tab-pane.active textarea').each(function () {
         data[$(this).attr('name')] = $(this).val();
      });

      if (data.hasOwnProperty('references[]')) {
        delete data['references[]'];
        var references = [];
        $('div.tab-pane.active div.form-group div.reference-item').each(function () {
          var item = $(this);
          var title = $(this).find('input[name="references[]"]').val();
          if (title && title.length > 0) {
            var type = $(this).find('select[name="reference-type"]').val();
            var id = '';
            // User regexp to parse id
            var regexp = /^\[(\d+)\]-.*/ig;
            var res = regexp.exec(title);
            if (res !== null && res.length >= 2) {
              id = res[1];
            }
            references.push({
              id: id,
              title: title,
              type: type
            });
          }
        });
        data['references'] = JSON.stringify(references);
      } else {
        data['references'] = JSON.stringify([]);
      }

      if (data.hasOwnProperty('file')) {
        delete data['file'];
        var fileinfo = $('div#upload-info div.tab-pane.active #uploaded-literature input').val();
        // Since File Info is escaped by fileUploader.js, so must call unescape
        fileinfo = unescape(fileinfo);
        if (fileinfo) {
          data['file'] = fileinfo;
        }
      } else {
        data['file'] = JSON.stringify({});
      }

      // accessories file_path is special, handle it specially
      if (data.hasOwnProperty('accessories[]')) {
        delete data['accessories[]'];
        var accessories = [];
        $('div#upload-info div.tab-pane.active input[name="accessories[]"]').each(function () {
          accessories.push(JSON.parse(unescape($(this).val())));
        })
        data['accessories'] = JSON.stringify(accessories);
      } else {
        data['accessories'] = JSON.stringify([]);
      }
      return data;
    },

    sendRequest: function (data) {
      var self = this;
      var requestUrl = $('#submit-btn').data('requesturl');
      $.ajax({
        url: self.rootUrl + requestUrl,
        type: 'POST',
        data: {
          literature: data
        },
        success: function (res) {
          if (res.success) {
            //console.log(res);
            window.location.href = self.rootUrl + '/myliterature'
          }
        }
      });
    },

    clearForm: function () {
       $('input, textarea').val('');
    },

    addActionListener: function() {
      var self = this;
      $('#submit-btn').click(function () {
        var data = self.handleForm();
        console.log(data);
        self.sendRequest(data);
      });

      $('#cancle-btn').click(function () {
        if ($(this).data('returnurl').length > 0) {
          window.location.href = $(this).data('returnurl');
        } else {
          self.clearForm();
        }
      });
    },

    initTypeahead: function () {
      $('#Journal input#publication').typeahead({
        source: ['MM-ACM Multimedia', 'MM&Sec-Multimedia & Security', 'IEEE SOFTWARE', 'ACM', 'MMM-Conference On Multimedia Modeling', 'ACM COMPUTING SURVEYS']
      });

      $('#Conference input#publication').typeahead({
        source: ['ISCA-International Symposium on Computer Architecture',
        'CVPR-IEEE Conf on Comp Vision and Pattern Recognition',
        'PODS-ACM SIGMOD Conf on Principles of DB Systems',
        'CIKM-Intl. Conf on Information and Knowledge Management',
        'SIGMOD-ACM SIGMOD Conf on Management of Data',
        'HPCA: IEEE Symp on High-Perf Comp Architecture',
        'IEEE/WIC International Joint Conf on Web Intelligence and Intelligent Agent Technology',
        'ACM-MM: ACM Multimedia Conference']
      });
    },

    addReferenceActionListener: function () {
      var self = this;
      $('div.reference-item #add-reference-btn').click(function (e) {
        console.log('add-reference-btn');
        var item = $(this).parents('div.reference-item').clone();
        item.find('label[for="references"]').text('');
        item.find('span#add-reference-btn').removeClass('glyphicon-plus').addClass('glyphicon-remove');
        item.find('input').val('');
        $(this).parents('.form-group').append(item);
        self.addReferenceRemoveListener();
        self.addReferenceTypeaheadListener();
      });

      this.addReferenceRemoveListener();
    },

    addReferenceRemoveListener: function () {
      if ($('div.reference-item span.glyphicon-remove')) {
        $('div.reference-item span.glyphicon-remove').unbind('click').click(function (e) {
          $(this).parents('div.reference-item').remove();
        });
      }
    },

    addReferenceTypeaheadListener: function () {
      var self = this;
      $('.reference-item input').typeahead({
        source: function (query, process) {
          $.ajax({
            url: self.rootUrl + '/literatures/upload/references/query',
            type: 'GET',
            data: {
              title: query.trim()
            },
            success: function (res) {
              var data = [];
              if (res.success) {
                var literatures = res.literatures;
                for (var i = 0; i < literatures.length; i++) {
                  var item = literatures[i];
                  data.push('[' +item.id + ']-' + item.title);
                }
              }
              process(data);
            }
          })
        }
      });
    }
  }

  literatureUploader.init();
});
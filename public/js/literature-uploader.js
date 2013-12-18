$(function () {
  'use strict';
  var literatureUploader = {
    rootUrl: 'http://' + window.location.hostname + ':' + window.location.port,
    init: function () {
      this.addActionListener();
      this.initAdditionInfoTab();
      this.initTypeahead();
    },

    /**
     * Process Form Data before ajax Rquest
     * @return {[Object]} the processed literature
     */
    handleForm: function () {
      var inputs = $('input');
      var data = {};
      // fetch basic info
      $('#basic-info input:not(input[type="file"]), #basic-info select, #basic-info textarea').each(function () {
         data[$(this).attr('name')] = $(this).val();
      });

      // fetch additional info
      $('#additional-info .tab-content div.active form input').each(function () {
        data[$(this).attr('name')] = $(this).val();
      })

      // accessories file_path is special, handle it specially
      if (data['accessories[]']) {
        delete data['accessories[]'];
        var accessories = [];
        $('#basic-info input[name="accessories[]"]').each(function () {
          accessories.push($(this).val());
        })
        data['accessories'] = accessories;
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
            console.log(res);
            window.location.href = self.rootUrl + '/literatures/detail/' + res.literatureId;
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
        //console.log(data);
        self.sendRequest(data);
      });

      $('#cancle-btn').click(function () {
        if ($(this).data('returnurl').length > 0) {
          window.location.href = $(this).data('returnurl');
        } else {
          self.clearForm();
        }
      });

      $('select#category').on('change', function () {
        var category = $('select#category option:selected').attr('rel');
        $('#additional-info div.active').removeClass('active');
        $('#additional-info div.active').removeClass('in');
        $('#additional-info #' + category).addClass('active');
        $('#additional-info #' + category).addClass('in');

        $('#additional-info ul.dropdown-menu li.active').removeClass('active');
        $('#additional-info ul.dropdown-menu li a[href="#' + category + '"]').parent('li').addClass('active');
      })
    },

    initAdditionInfoTab: function () {
      var activeTab = $('#additional-info ul.dropdown-menu li.active');
      if (activeTab.length == 0) {
        $('#additional-info ul.dropdown-menu li a[href="#book"]').parent('li').addClass('active');
        $('#additional-info div#book').addClass('active');
        $('#additional-info div#book').addClass('in');
      }
    },

    initTypeahead: function () {
      $('#additional-info #journal input#publication').typeahead({
        source: ['MM-ACM Multimedia', 'MM&Sec-Multimedia & Security', 'IEEE SOFTWARE', 'ACM', 'MMM-Conference On Multimedia Modeling', 'ACM COMPUTING SURVEYS']
      });

      $('#additional-info #conference input#publication').typeahead({
        source: ['ISCA-International Symposium on Computer Architecture',
        'CVPR-IEEE Conf on Comp Vision and Pattern Recognition',
        'PODS-ACM SIGMOD Conf on Principles of DB Systems',
        'CIKM-Intl. Conf on Information and Knowledge Management',
        'SIGMOD-ACM SIGMOD Conf on Management of Data',
        'HPCA: IEEE Symp on High-Perf Comp Architecture',
        'IEEE/WIC International Joint Conf on Web Intelligence and Intelligent Agent Technology',
        'ACM-MM: ACM Multimedia Conference']
      });

    }
  }
  literatureUploader.init();
});
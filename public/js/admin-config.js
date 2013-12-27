$(function () {
  'use strict';
  var config = {
    rootURL: 'http://' + window.location.hostname + ':' + window.location.port,

    init: function () {
      this.addSaveListener();
      this.addCancelListener();
      this.addRemoveListener();
      this.addPlusListener();
      this.addUserRemoveListener();
    },

    sendRequest: function (configInfo, configType) {
      var self = this;
      $.ajax({
        url: self.rootURL + '/admin/config',
        type: 'POST',
        data: {
          configInfo: configInfo,
          configType: configType
        },
        success: function (res) {
          if (res.success) {
            self.showAlert('alert-success', null);
          } else {
            self.showAlert('alert-error', res.error);
          }
        }
      });
    },

    showAlert: function (type, error) {
      var html = new EJS({url: '/alerts/' + type + '.ejs'}).render(error);
      $('#admin-config div.tab-pane.active table').after(html);
    },

    handleLiteratureConfig: function () {
      var configInfo = [];
      $('#literature-config table tbody tr').each(function () {
        var typeName = $(this).find('td input[name="literature-type-name"]').val();
        if (typeName.length) {
          typeName = typeName.split(' ').join('');
          var configItem = {
            name: typeName,
            info: []
          }
          $(this).find('td input:checked').each(function () {
            configItem.info.push($(this).val());
          });
          configInfo.push(configItem);
        }
      });
      return JSON.stringify(configInfo);
    },

    /**
     * This is for rich-comment and reference-type config, they are in the same style
     * @return String Config info
     */
    handleConfig: function (id) {
      var configInfo = [];
      $(id + ' input').each(function () {
        var item = $(this).val().trim();
        if (item.length) {
          configInfo.push($(this).val());
        }
      });
      return JSON.stringify(configInfo);
    },

    addSaveListener: function () {
      var self = this;

      $('#literature-config-save-btn').click(function () {
        var configInfo = self.handleLiteratureConfig();
        var configType = 'literature_type';
        console.log(configInfo);
        self.sendRequest(configInfo, configType);
      });

      $('#rich-comment-config-save-btn').click(function () {
        var configInfo = self.handleConfig('#rich-comment-config');
        var configType = 'rich_comment';
        console.log(configInfo);
        self.sendRequest(configInfo, configType);
      });

      $('#ref-config-save-btn').click(function () {
        var configInfo = self.handleConfig('#ref-config');
        var configType = 'reference_type';
        console.log(configInfo);
        self.sendRequest(configInfo, configType);
      });
    },

    addCancelListener: function () {
      $('#admin-config button.cancel-btn').click(function () {
        window.location.href = window.location.href;
      });
    },

    addRemoveListener: function () {
      $('#literature-config span.remove-btn, #rich-comment-config span.remove-btn, #ref-config span.remove-btn').click(function () {
         $(this).parents('tr').remove();
      });
    },

    addPlusListener: function () {
      var self = this;
      $('#admin-config div.tab-pane span.add-btn').click(function () {
        var item = $(this).parents('tr').clone();
        $(this).parents('tbody').append(item);
        $(this).removeClass('glyphicon-plus add-btn').removeClass('glyphicon-plus').addClass('glyphicon-remove remove-btn');
        $(this).unbind('click').click(function () {
          $(this).parents('tr').remove();
        });
        self.addPlusListener();
      });
    },

    addUserRemoveListener: function () {
      var self = this;
      $('#user-config .user-remove-btn').click(function () {
        var userId = $(this).parents('tr').find('td:first-child').text();
        var nodeself = $(this);
        $.ajax({
          url: self.rootURL + '/admin/users/remove',
          type: 'POST',
          data: {
            userId: userId
          },
          success: function (res) {
            if (res.success) {
              nodeself.parents('tr').remove();
              self.showAlert('alert-success', null);
            } else {
              self.showAlert('alert-error', res.error);
            }
          }
        });
      });
    }
  }
  config.init();
});
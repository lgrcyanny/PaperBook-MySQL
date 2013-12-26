$(function () {
  'use strict';
  var literatureDetail = {
    rootUrl: 'http://' + window.location.hostname + ':' + window.location.port,
    init: function () {
      this.addCheckBoxListener();
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

    addRateListener: function () {

    },

    sendRateRequest: function (rate) {

    }
  }
  literatureDetail.init();
})

$(function () {

  var rootURL = 'http://' + window.location.hostname + ':' + window.location.port;

  $.ajax({
    url: rootURL + '/statistics/globalViewData',
    type: 'GET',
    data: {},
    success: function (res) {
      if (res.success) {
        $('div#globalView')
          .highcharts({
            chart: {
              type: 'column',
              inverted: true
            },
            title: {
              text: 'Global View'
            },
            credits: {
              enabled: false
            },
            yAxis: {
              allowDecimals: false,
              title: {
                text: 'Articles'
              }
            },
            xAxis: {
              type: 'category'
            },
            series: res.highchartsData
          });
      }
    }
  });
})
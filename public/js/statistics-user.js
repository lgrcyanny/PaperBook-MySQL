$(function () {

  var rootURL = 'http://' + window.location.hostname + ':' + window.location.port;

  $.ajax({
    url: rootURL + '/statistics/userViewData',
    type: 'GET',
    data: {},
    success: function (res) {
      if (res.success) {
        console.log(res.highstockData);
        $('div#userView')
          .highcharts('StockChart', {
            rangeSelector: {
              selected: 4
            },
            title: {
              text: res.username
            },
            credits: {
              enabled: false
            },
            xAxis: {
              ordinal: false,
              // minRange: 1 * 24 * 3600 * 1000 
            },
            yAxis: {
              allowDecimals: false
            },
            series: [{
              name: 'Articles',
              marker: {
                enabled: true,
                radius: 3
              },
              shadow: true,
              tooltip: {

              },
              data: res.highstockData
            }]
          });
      }
    }
  });
})
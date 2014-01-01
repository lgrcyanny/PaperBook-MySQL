$(function () {

  var rootURL = 'http://' + window.location.hostname + ':' + window.location.port;
  var highchartsData = Array();
  $.ajax({
    url: rootURL + '/statistics/globalViewData',
    type: 'GET',
    data: {

    },
    success: function (res) {
      if (res.success) {
        res.results.forEach(function (record, index) {
          highchartsData.push([record.username, record.literature_count]);
        })

        console.log('data:' + highchartsData);

        $('div#container')
          .highcharts({
            "chart": {
              "type": "column",
              "inverted": true
            },
            "title": {
              "text": "Global View"
            },
            "credits": {
              "enabled": false
            },
            "yAxis": {
              "title": {
                "text": "Articles"
              }
            },
            "xAxis": {
              "type": "category"
            },
            "series": [{
              "index": 0,
              "name": "Year 2013",
              "data": highchartsData
            }]
          });
      }
    }
  });

})
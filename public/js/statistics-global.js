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
        
        while (res.results[0].add_year === null) {
          res.results.shift();
        }

        var year = res.results[0].add_year,
          index = 0,
          temp = [];
        res.results.forEach(function (result) {
          var result_year = result.add_year;
          if (year != result_year) {
            highchartsData.push({
              'index': index,
              'name': 'Year ' + year,
              'data': temp
            });
            year = result_year;
            temp = [];
          };
          //console.log('result:' + result.add_year + ' ' + result.username + ' ' + result.literature_count);
          temp.push([result.username, result.literature_count]);
        })
        highchartsData.push({
          'index': index,
          'name': 'Year ' + year,
          'data': temp
        });

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
            "series": highchartsData
          });
      }
    }
  });

})
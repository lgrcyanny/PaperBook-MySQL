$(function () {

  var rootURL = 'http://' + window.location.hostname + ':' + window.location.port;
  $.ajax({
    url: rootURL + '/statistics/globalViewData',
    type: 'GET',
    data: {

    },
    success: function (res) {
      if (res.success) {
        console.log(res.data);
      };
    }
  });

  console.log('data likes:' + [
    [1, 0],
    [2, 6],
    [3, 7],
    [4, 8],
    [5, 13],
    [6, 17],
    [7, 18],
    [8, 17],
    [9, 14],
    [10, 19],
    [11, 23],
    [12, 21]
  ]);

  $('div#container')
    .highcharts({
      "yAxis": {
        "title": {
          "text": "Articles"
        }
      },
      "chart": {
        "type": "line"
      },
      "title": {
        "text": "Statistics"
      },
      "subtitle": {
        "text": "Global view"
      },
      "xAxis": {
        "title": {
          "text": "Month"
        }
      },
      "series": [{
        "index": 0,
        "name": "Liang",
        "data": [
          [1, 7],
          [2, 7],
          [3, 9],
          [4, 14],
          [5, 18],
          [6, 21],
          [7, 25],
          [8, 26],
          [9, 23],
          [10, 18],
          [11, 13],
          [12, 9]
        ]
      }, {
        "index": 1,
        "name": "Zhang",
        "data": [
          [1, 1],
          [2, 3],
          [3, 5],
          [4, 11],
          [5, 17],
          [6, 22],
          [7, 24],
          [8, 24],
          [9, 20.1],
          [10, 14],
          [11, 18],
          [12, 22]
        ]
      }, {
        "index": 2,
        "name": "Feng",
        "data": [
          [1, 0],
          [2, 6],
          [3, 7],
          [4, 8],
          [5, 13],
          [6, 17],
          [7, 18],
          [8, 17],
          [9, 14],
          [10, 19],
          [11, 23],
          [12, 21]
        ]
      }]
    });
})
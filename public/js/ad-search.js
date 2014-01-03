$(function () {
  $("#ad-search-submit")
    .click(function () {
      var allWords = $('input#allWords')
        .val(),
        exactPhrase = $('input#exactPhrase')
          .val(),
        oneWords = $('input#oneWords')
          .val(),
        withoutWords = $('input#withoutWords')
          .val(),
        authors = $('input#authors')
          .val(),
        publications = $('input#publications')
          .val();

      var rootURL = 'http://' + window.location.hostname + ':' + window.location.port;

      $.ajax({
        url: rootURL + '/advancedsearch/results',
        type: 'GET',
        data: {
          allWords: allWords,
          exactPhrase: exactPhrase,
          oneWords: oneWords,
          withoutWords: withoutWords,
          authors: authors,
          publications: publications
        },
        success: function (res) {
          if (res.success) {
            var modalHTML = new EJS({
              url: '/search/results-list.ejs'
            })
              .render({
                title: res.title,
                page: res.page,
                total: res.total,
                time: res.time,
                totalPage: res.totalPage,
                isFirstPage: res.isFirstPage,
                isLastPage: res.isLastPage,
                results: res.results
              });
            $('div#searchModal').remove();
            $('body').removeClass('modal-open');
            $('div.search-box.row').replaceWith(modalHTML);
          }
        }
      });
    });
})
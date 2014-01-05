var utils = require('../../lib/utils');
var squel = require('squel');

module.exports = {
  table: 'literatures',
  save: function (literature, cb) {
    var query = 'INSERT INTO literatures SET ?';
    utils.exec(query, literature, cb);
  },

  update: function (id, data, cb) {
    var query = 'UPDATE literatures SET ? WHERE id = ' + id;
    utils.exec(query, data, cb);
  },

  delete: function (id, cb) {
    var query = 'DELETE FROM literatures WHERE id = ?';
    utils.exec(query, [id], cb);
  },

  findById: function (id, cb) {
    var query = 'SELECT * FROM ?? WHERE id = ?';
    var data = [this.table, id];
    utils.exec(query, data, cb);
  },

  findByUser: function (userid, cb) {
    var query = 'SELECT id, title, add_at FROM ?? WHERE user_id = ? ORDER BY add_at desc';
    var data = [this.table, userid];
    utils.exec(query, data, cb);
  },

  findByTitle: function (title, page, pageSize, callback) {

    var words = title.split(' '),
      query = squel.select()
        .from('literatures');

    words.forEach(function (word, index) {
      query = query.where("title like '%" + word + "%'")
    });

    query.offset((page - 1) * pageSize)
      .limit(pageSize);

    // console.log(query.toString());
    utils.exec(query.toString(), null, function (err, results) {
      if (err) {
        callback(err)
      };
      callback(null, results);
    });
  },

  findAllByTitle: function (title, callback) {
    var words = title.split(' '),
      query = squel.select()
        .from('literatures');

    words.forEach(function (word, index) {
      query = query.where("title like '%" + word + "%'")
    });

    utils.exec(query.toString(), null, function (err, results) {
      if (err) {
        callback(err)
      };
      callback(null, results);
    });
  },

  findAll: function (condition, callback) {
    var allWords = condition.allWords.split(' '),
      exactPhrase = condition.exactPhrase,
      oneWords = condition.oneWords.split(' '),
      withoutWords = condition.withoutWords.split(' '),
      authors = condition.authors.split(' '),
      publications = condition.publications.split(' ');
    // lYear = condition.lYear,
    // rYear = condition.rYear;

    console.log('allWords:', allWords);
    console.log('exactPhrase:', exactPhrase);
    console.log('oneWords:', oneWords);
    console.log('withoutWords:', withoutWords);
    console.log('authors:', authors);
    console.log('publications:', publications);
    // console.log('year:' + lYear + '-' + rYear);

    //search expressions
    var allWordsExpr = squel.expr(),
      oneWordsExpr = squel.expr(),
      withoutWordsExpr = squel.expr(),
      authorsExpr = squel.expr(),
      publicationsExpr = squel.expr(),
      // yearExpr = squel.expr(),
      query = squel.select()
        .from('literatures');

    allWords.forEach(function (word, index) {
      allWordsExpr = allWordsExpr.and("title like '%" + word + "%'");
    });
    oneWords.forEach(function (word, index) {
      oneWordsExpr = oneWordsExpr.or("title like '%" + word + "%'");
    });
    withoutWords.forEach(function (word, index) {
      withoutWordsExpr = withoutWordsExpr.and("title not like '%" + word + "%'");
    });
    authors.forEach(function (word, index) {
      authorsExpr = authorsExpr.or("authors like '%" + word + "%'");
    });
    publications.forEach(function (word, index) {
      publicationsExpr = publicationsExpr.or("publication like '%" + word + "%'");
    });
    // yearExpr = yearExpr.and("year >=" + lYear)
    //   .and("year <=" + rYear);

    query = query.where(allWordsExpr)
      .where("title like '%" + exactPhrase + "%'")
      .where(oneWordsExpr)
      // .where(withoutWordsExpr)
      .where(authorsExpr)
      .where(publicationsExpr);
    // .where(yearExpr);
    if (condition.withoutWords!=''){
      query=query.where(withoutWordsExpr);
    }
    console.log(query.toString());

    utils.exec(query.toString(), null, function (err, results) {
      if (err) {
        callback(err)
      };
      callback(null, results);
    });
  },

  /**
   * When make rich comment and brief comment, should update tags and score
   */
  updateForComment: function (literatureId, score, tags, cb) {
    var query = 'SELECT score_avg, score_count, tags FROM ?? WHERE id = ?';
    var data = ['literatures', literatureId];
    utils.exec(query, data, function (err, results) {
      if (err) {
        cb(err);
      }
      var literature = results[0];
      score = parseInt(score);
      if (score > 0) {
        var scoreAvg = parseInt(literature.score_avg);
        var scoreCount = parseInt(literature.score_count);
        scoreAvg = ((scoreAvg * scoreCount) + score) / (scoreCount + 1);
        scoreAvg = scoreAvg.toPrecision(2);
        literature.score_avg = scoreAvg;
        literature.score_count = scoreCount + 1;
      }

      if (tags.length > 0) {
        literature.tags = literature.tags ? (literature.tags + ',' + tags) : tags;
      }

      if (score === 0 && tag.length === 0) {
        cb(null);
      }

      query = 'UPDATE literatures SET ? WHERE id = ' + literatureId;
      utils.exec(query, literature, cb);
    });
  }
}
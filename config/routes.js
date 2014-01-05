/*!
 * Module dependencies.
 */

var async = require('async')

/**
 * Controllers
 */

var users = require('../app/controllers/users');
var search = require('../app/controllers/search');
var admin = require('../app/controllers/admin');
var auth = require('./middlewares/authorization');
var literatures = require('../app/controllers/literatures');
var richComments = require('../app/controllers/rich-comments');
var briefComments = require('../app/controllers/brief-comments');
var statistics = require('../app/controllers/statistics');

/**
 * Expose routes
 * Watch out:  the order of routes is really important
 * Watch out: To avoid 404 error, make sure there is no "/" at the end of each route path
 */

module.exports = function (app, passport) {

  // User routes
  app.get('/signin', users.showSignIn);
  app.get('/signup', users.showSignUp);
  app.get('/signout', users.signout);
  app.post('/users', users.create);
  app.post('/users/session',
    passport.authenticate('local', {
      failureRedirect: '/signin',
      failureFlash: true
    }), users.session);

  app.get('/users/:userId', users.showProfile);

  app.param('userId', users.user);
  app.get('/showtestuser', users.showtestuser);

  // home route
  app.get('/', search.index);

  // search route
  app.get('/search/results', search.showSearchResults);
  app.get('/advancedsearch/results',search.showAdvancedSearchResults);

  //Statistics route
  app.get('/statistics',statistics.globalView);
  app.get('/statistics/globalViewData',statistics.getGlobalViewData);

  // Literature upload route
  app.post('/literatures', literatures.create);
  app.get('/literatures/upload', auth.requiresSignin, literatures.showUploadPage);
  app.post('/literatures/upload/files/literature', literatures.uploadFileLiterature);
  app.post('/literatures/upload/files/accessory', literatures.uploadFileAccessory);
  app.post('/literatures/upload/files/remove', literatures.removeFile);
  app.get('/literatures/upload/references/query', literatures.fetchByTitle);

  // Literature update route
  app.get('/literatures/update/:literatureId', literatures.showUpdatePage);
  app.post('/literatures/update/:updateId', literatures.update);

  // My Literature route
  app.get('/myliterature', auth.requiresSignin, literatures.showMyLiteraturePage);
  app.post('/literatures/remove/:removeId', literatures.remove);

  // Literature detail route
  app.get('/literatures/detail/tags', literatures.fetchTags);
  app.get('/literatures/detail/cited', literatures.fetchCited);
  app.get('/literatures/detail/download', literatures.downloadFile);
  app.get('/literatures/detail/:literatureId', literatures.showDetailPage);

  app.param('literatureId', literatures.fetchById);

  // Admin Route
  app.get('/admin', auth.requiresSignin, admin.showAdminPage);
  app.post('/admin/config', admin.saveConfig);
  app.post('/admin/users/remove', admin.removeUser);

  // Rich comment route
  app.get('/literatures/detail/comments/rich/draft', richComments.fetchDraft);
  app.get('/literatures/detail/comments/rich', richComments.fetchComments);
  app.post('/literatures/detail/comments/rich/draft', richComments.saveDraft);
  app.post('/literatures/detail/comments/rich', richComments.publish);

  // Brief comment route
  app.get('/literatures/detail/comments/brief/draft', briefComments.fetchDraft);
  app.get('/literatures/detail/comments/brief', briefComments.fetchComments);
  app.post('/literatures/detail/comments/brief/draft', briefComments.saveDraft);
  app.post('/literatures/detail/comments/brief', briefComments.publish);
}

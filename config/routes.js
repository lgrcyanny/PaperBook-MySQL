/*!
 * Module dependencies.
 */

var async = require('async')

/**
 * Controllers
 */

var users = require('../app/controllers/users');
var search = require('../app/controllers/search');
var auth = require('./middlewares/authorization');
var literatures = require('../app/controllers/literatures');


/**
 * Expose routes
 * Watch out:  the order of routes is really important
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
  app.post('/search/results', search.showSearchResults);
  // Literature Route
  app.post('/literatures', literatures.create);
  app.get('/literatures/upload', auth.requiresSignin, literatures.showUploadPage);
  app.post('/literatures/upload/files/literature', literatures.uploadFileLiterature);
  app.post('/literatures/upload/files/accessory', literatures.uploadFileAccessory);
  app.post('/literatures/upload/files/remove', literatures.removeFile);

  app.get('/literatures/update/:literatureId', literatures.showUpdatePage);
  app.post('/literatures/update/:updateId', literatures.update);

  app.get('/myliterature', auth.requiresSignin, literatures.showMyLiteraturePage);
  app.post('/literatures/remove/:removeId', literatures.remove);

  app.get('/literatures/detail/:literatureId', literatures.showDetailPage);
  app.param('literatureId', literatures.fetchById);

}

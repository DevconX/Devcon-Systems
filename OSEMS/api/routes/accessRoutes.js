'use strict';
module.exports = function(app) {
  var access = require('../controllers/accessController');

  app.route('/access')
    .post(access.create_an_access);

  app.route('/authenticate')
    .post(access.authenticate);
}

'use strict';
module.exports = function(app) {
  var mail = require('../controllers/mailController'),
      access = require('../controllers/accessController');

  app.route('/mail/welcome')
    .post(mail.send_welcome_mail);
}

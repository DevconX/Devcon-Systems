'use strict';
module.exports = function(app) {
  var profile = require('../controllers/profileController'),
      access = require('../controllers/accessController');

  // This controller need to be validated
  app.use('/profile/:id', access.validate_token);

  app.route('/profile')
    .get(profile.get_all_profiles)
    .post(profile.create_a_profile);

  app.route('/profile/:id')
    .get(profile.read_a_profile)
    .put(profile.update_a_profile)
    .delete(profile.delete_a_profile);
}

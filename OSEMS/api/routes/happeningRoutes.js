'use strict';
module.exports = function(app) {
  var happening = require('../controllers/happeningController'),
      access = require('../controllers/accessController');

  // This controller need to be validated
  app.use('/happening', access.validate_token);

  // www.example.com/happening
  app.route('/happening')
    .get(happening.get_all_happening)
    .post(happening.create_a_happening);

  app.route('/happening/:id')
    .get(happening.read_a_happening)
    .put(happening.update_a_happening)
    .delete(happening.delete_a_happening);

  app.route('/happening/type/:type')
    .get(happening.get_happening_by_type);

  // SUBDOCUMENT

  app.route('/happening/attendee/:id')
    .put(happening.add_an_attendee);

  app.route('/happening/location/:id')
    .put(happening.add_a_location);

  app.route('/happening/sponsor/:id')
    .put(happening.add_a_sponsor);
}

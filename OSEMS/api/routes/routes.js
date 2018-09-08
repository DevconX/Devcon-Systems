'use strict';
module.exports = function(app) {
  var happeningRoutes = require('./happeningRoutes');
  var profileRoutes = require('./profileRoutes');
  var accessRoutes = require('./accessRoutes');
  var mailRoutes = require('./mailRoutes');

  happeningRoutes(app);
  profileRoutes(app);
  accessRoutes(app);
  mailRoutes(app);
}

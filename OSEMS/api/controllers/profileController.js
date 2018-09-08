'use strict';

var mongoose = require('mongoose');
var Profile = mongoose.model('Profile');

exports.get_all_profiles = function(req, res) {
  Profile.find({}, function(err, profiles) {
    if(err)
      res.send(err);

    res.json(profiles);
  });
};

exports.create_a_profile = function(req, res) {

  var newProfile = new Profile(req.body);
  newProfile.save(function(err, profile) {
    if(err)
      res.send(err);

    res.json(profile);
  });
};

exports.read_a_profile = function(req, res) {
  Profile.findById(req.params.id, function(err, profile) {
    if(err)
      res.send(err);

    res.json(profile);
  });
};

exports.update_a_profile = function(req, res) {
  Profile.findOneAndUpdate(
    {_id: req.params.id},
    req.body,
    {new: true},
    function(err, profile) {
      if(err)
        res.send(err);

      res.json(profile);
    });
};

exports.delete_a_profile = function(req, res) {

  Profile.remove(
    {_id: req.params.id},
    function (err, profile) {
        if(err)
          res.send(err);

        res.json({
          success: true,
          message: 'Profile successfully deleted'
        });
    });
};

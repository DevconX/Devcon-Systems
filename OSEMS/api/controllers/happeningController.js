'use strict';

var mongoose = require('mongoose');
var Happening = mongoose.model('Happening');

exports.get_all_happening = function(req, res) {
  Happening.find({}, function(err, happening) {
    if(err)
      res.send(err);

    res.json(happening);
  });
};

exports.create_a_happening = function(req, res) {
  var new_happening = new Happening(req.body);
  new_happening.save(function(err, happening) {
    if(err)
      res.send(err);

    res.json(happening);
  });
};

exports.read_a_happening = function(req, res) {
  Happening.findById(req.params.id, function(err, happening) {
    if(err)
      res.send(err);

    res.json(happening);
  });
};

exports.get_happening_by_type = function(req, res) {
  Happening.find(
    {'type': req.params.type},
    function(err, happenings) {
      if(err)
        res.send(err);

      res.json(happenings);
  });
};

exports.update_a_happening = function(req, res) {

  Happening.findOneAndUpdate(
    {_id: req.params.id},
    req.body,
    {new: false},
    function(err, happening) {
      if(err)
        res.send(err);

      res.json(happening);
    });
};

exports.delete_a_happening = function(req, res) {

  Happening.remove(
    {_id: req.params.id},
    function (err, happening) {
        if(err)
          res.send(err);

        res.json({
          success: true,
          message: 'Happening successfully deleted'
        });
    });
};

/******************************
 * SUBDOCUMENT: Attendee
 ******************************/
exports.add_an_attendee = function(req, res) {

  Happening.findOneAndUpdate(
    {_id: req.params.id},
    { $push: {attendees: req.body.attendee}},
    {new: false},
    function(err, happening) {
      if(err)
        res.send(err);

      if(happening == null)
        res.json({message: "Happening doesn't exists"});
      else
        res.json(happening);
    });
}

/******************************
 * SUBDOCUMENT: Location
 ******************************/
exports.add_a_location = function(req, res) {

  var data = {
      name: req.body.name,
      address: req.body.address,
      coordinate: [req.body.latitude, req.body.longitude]
  }

  Happening.findOneAndUpdate(
    {_id: req.params.id},
    { $push: {locations: data}},
    {new: false},
    function(err, happening) {
      if(err)
        res.send(err);

      if(happening == null)
        res.json({message: "Happening doesn't exists"});
      else
        res.json(happening);
    });
}

/******************************
 * SUBDOCUMENT: Sponsor
 ******************************/
exports.add_a_sponsor = function(req, res) {

  var data = {
      name: req.body.name,
      image: req.body.image,
      link: req.body.link
  }

  Happening.findOneAndUpdate(
    {_id: req.params.id},
    { $push: {sponsors: data}},
    {new: false},
    function(err, happening) {
      if(err)
        res.send(err);

      if(happening == null)
        res.json({
          success: true,
          message: "Happening doesn't exists"
        });
      else
        res.json(happening);
    });
}

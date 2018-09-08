'use strict';

var mongoose = require('mongoose');
var Access = mongoose.model('Access');
var jwt = require('jsonwebtoken');
// var config = require('./config');
var error = require('../../error');

exports.create_an_access = function(req, res) {
  var newAccess = new Access(req.body);
  newAccess.save(function(err, access) {
    if(err)
      return res.send(err);

    res.json(access);
  });
}

exports.authenticate = function(req, res) {

  Access.findOne(
    {email: req.body.email},
    function(err, access) {

      if(err)
        return res.status(500).send(err);

      if(!access) {
        return res.status(500).send({
          success: false,
          message: error.account_not_exist
        })
      }

      //invalidate the authentication if the secret key is missing
      // if(!access.secret) {
      //   res.send("Access is revoke, please register a new account");
      // }

      access.comparePassword(req.body.password, function(err, isMatch){
        if(err)
          return res.status(500).send(err);

        // return token?
        const payload = {
          id: access._id,
          email: access.email,
          privileges: access.privileges,
          timestamp: Date.Now
        };

        var token = jwt.sign(payload, 'devcon', {
          expiresIn: '1h' // 24-hour
        });

        res.json({
          success: true,
          token: token
        });
      });
  });
};

exports.validate_token = function(req, res, next) {

  var token = req.body.token || req.query.token || req.headers['authorization'];

  if(token) {

    var key = token.split(" ");

    if(key[0] !== "Bearer") {
      return res.status(500).send({
        success: false,
        message: error.invalid_token
      });
    }
    
    jwt.verify(key[1].trim(), 'devcon', function(err, decoded) {
      if(err) {
        return res.status(500).send({
          success: false,
          message: error.token_authentication_fail
        });
      }

      req.decoded = decoded;
      next();
    });

  } else {
    return res.status(403).send({
      success: false,
      message: error.no_token
    });
  }
};

'use strict';

var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var bcrypt = require('bcrypt');
var SALT_WORK_FACTOR = 10;

var AccessSchema = new Schema({
  email: {
    type: String,
    required: true,
    unique: true
  },
  password: {
    type: String,
    required: true
  },
  secret: {
    type: String,
    default: 'devcon'
  },
  privileges: {
    type: String,
    enum: ['FULLACCESS', 'READONLY'],
    default: 'FULLACCESS'
  },
  created_date: {
    type: Date,
    default: Date.now
  },
  timestamp_date: {
    type: Date,
    default: Date.now
  },
  access: {
    type: Schema.ObjectId,
    ref: 'User'
  }
}, {
  toObject: {
    transform: function(doc, ret) {
      delete ret.__v;
    }
  },
  toJSON: {
    transform: function(doc, ret) {
      delete ret.__v;
    }
  }
});

AccessSchema.pre('save', function(next) {

    var access = this;

    // only hash the password if it has been modified
    if(!access.isModified('password'))
      return next();

    // generate a salt
    bcrypt.genSalt(SALT_WORK_FACTOR, function(err, hash) {
      if(err) return next(err);

      // overide the cleartext password
      access.password = hash;
      next(access);
    });
});

AccessSchema.methods.comparePassword = function(password, cb) {

    bcrypt.compare(password, this.password, function(err, isMatch) {
      if(err)
        return cb(err);

      cb(null, isMatch);
    });
};

module.exports = mongoose.model('Access', AccessSchema);

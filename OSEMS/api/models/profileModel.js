'use strict';

var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var ProfileSchema = new Schema({
  name: {
    type: String,
    required: 'Name required'
  },
  registration_date: {
    type: Date,
    default: Date.now
  },
  github: String,
  state: {
    type: String,
    enum: ['NONE', 'JOHOR', 'KEDAH', 'KELANTAN', 'MELAKA', 'NEGERI SEMBILAN', 'PAHANG',
    'PERAK', 'PERLIS', 'PULAU PINANG', 'SABAH', 'SARAWAK', 'SELANGOR', 'TERENGGANU',
    'KUALA LUMPUR', 'LABUAN', 'PUTRAJAYA'],
    default: 'NONE'
  },
  gender: {
    type: String,
    enum: ['NONE', 'MALE', 'FEMALE'],
    default: 'NONE'
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

module.exports = mongoose.model('Profile',ProfileSchema);

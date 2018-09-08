'use strict';

var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var HappeningSchema = new Schema({
  type: {
    type: String,
    enum: ['meetup', 'hackathon'],
    defaults: 'meetup'
  },
  title: {
    type: String,
    required: 'Name required'
  },
  description: {
    type: String
  },
  poster_image: String,
  event_start_date: {
    type: Date,
    required: 'Start Date required'
  },
  event_end_date: {
    type: Date,
    required: 'End Date required'
  },
  created_date: {
    type: Date,
    default: Date.now
  },
  timestamp_date: {
    type: Date,
    default: Date.now
  },
  max: {
    type: Number,
    required: 'Maximum number of attendee'
  },
  attendees: [{
    type: Schema.ObjectId,
    ref: 'User'
  }],
  locations: [{
    name: String,
    address: String,
    coordinate: [Number]
  }],
  sponsors: [{
    name: String,
    image: {
      type: String
    },
    link: {
      type: String
    }
  }]
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

module.exports = mongoose.model('Happening', HappeningSchema);

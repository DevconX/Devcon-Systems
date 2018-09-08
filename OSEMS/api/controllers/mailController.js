'use strict';

var nodemailer = require('nodemailer');
const Email = require('email-templates');
var config = require('../../config');
// var templatesDir = path.resolve(__dirname, 'app/templates');

exports.send_welcome_mail = function(req, res) {

  // transport
  let smtpTransport = nodemailer.createTransport({
    host: config.smtp_o_host,
    port: config.smtp_o_port,
    secure: true,
    auth: {
      user: config.smtp_username,
      pass: config.smtp_password
    }
  });

  //
  let email = new Email({
    transport: smtpTransport,
    message: {
      from: config.smtp_username
    },
    views: {
      options: {
        extension: 'ejs'
      }
    }
  });

  email.send({
    template: 'welcome',
    message: {
      to: req.body.to
    },
    locals: {
      id: 'AyamGoreng',
      title: 'Meetup #3',
      telegram: 'https://t.me/joinchat/Ai-ffUO0vEy5W_0s8xu2rw'
    }
  }).then(console.log).catch(console.log);
}

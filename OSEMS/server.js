var express = require('express');
var mongoose = require('mongoose');
var cors = require('cors');
var bodyParser = require('body-parser');

var error = require('./error');

var app = express();
var port = process.env.PORT || 3002;
// CORS - setup
var corsOption = {
    optionSuccessStatus: 200
};

app.options('*', cors(corsOption));
app.use(cors());

// Models
var Happening = require('./api/models/happeningModel');
var Profile = require('./api/models/profileModel');
var Access = require('./api/models/accessModel')

// mongoose instance connection
mongoose.Promise = global.Promise;
mongoose.connect('mongodb://localhost/osems', {
  useMongoClient: true
});

app.use(bodyParser.urlencoded({ extended: true}));
app.use(bodyParser.json());

// importing routes
// var happeningRoutes = require('./api/routes/happeningRoutes');
// var userRoutes = require('./api/routes/userRoutes');
// var accessRoutes = require('./api/routes/accessRoutes');
// var mailRoutes = require('./api/routes/mailRoutes');
//
// happeningRoutes(app);
// userRoutes(app);
// accessRoutes(app);
// mailRoutes(app);

let routes = require('./api/routes/routes');
routes(app);

app.listen(port);

app.use(function(req, res) {
  res.status(404).send({url: req.originalUrl + ' not found'})
});

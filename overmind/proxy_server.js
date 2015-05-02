var express = require('express');
var ip = require('ips')().local;
var app = express();
var ports = require('./services.json');

app.use(express.static(__dirname + '/dist'));
app.get('/', function (req, res) {
  res.render('index.html')
});

app.get('/ip', function (req, res) {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Methods', 'GET');
  res.send(ip);
});

app.get('/services', function (req, res) {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Methods', 'GET');
  res.json(ports);
});


app.get('/:service', function (req, res) {
  try {
    var port = eval('ports.' + req.params.service) || 8000;
    res.redirect('http://' + ip + ':' + port + '/');
  } catch (e) {
    res.redirect('http://' + ip + ':8000/');
  }
});

app.listen(8000);
console.log('Overmind is started at http://' + ip + ':8000/');

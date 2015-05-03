#!/usr/bin/env node
var express = require('express');
var os = require('os');
var app = express();
var ports = require('./services.json');
var ip = function (){
  var deviceMap={
    'darwin':'en0',
    'linux':'eth0'
  };
  var device = eval('deviceMap.'+os.platform());
  var infos = eval('os.networkInterfaces().'+device);
  var ip;
  infos.forEach(function(device){
      if (device.family === 'IPv4'){
        ip = device.address;
        return;
      }
  });
  return ip
}();

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
console.log('Overmind is running on http://' + ip + ':8000/');

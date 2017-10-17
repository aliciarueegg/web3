//const
//    http = require('http'),
//    server = http.createServer(function(req, res) {
//        res.writeHead(200, {'Content-Type': 'text/plain'});
//        res.end('Hello World\n');
//    });
//server.listen(8080, function(){
//    console.log('ready captain!');
//});
//
//
//
//#!/usr/bin/env node

const
    express = require('express'),
    bodyParser = require('body-parser'),
    morgan = require('morgan'),
    app = express();

app.use(morgan('dev'));
app.use(express.static(__dirname + ''));
// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }));

//var todos = [];
//
//app.post('/todos', function(req, res) {
//    todos.push(req.body.todo);
//    res.status(201).json({'todo': req.body.todo});
//});
//
//
//app.get('/todos', function(req, res) {
//    res.status(200).json({'todos': todos});
//});

app.listen(8080, function(){
    console.log("ready captain.");
});

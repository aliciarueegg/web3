"use strict";

const
    http = require('http'),
    fs = require('fs'),
    url = require('url'),
    path = require('path'),
    index = fs.readFile('index.html'),
    server = http.createServer(function(request, response) {
        var uri = url.parse(request.url).pathname;
        var filename = path.join(process.cwd(), uri);
        console.log("serving: " + filename);
        fs.readFile(filename, 'binary', function(err, file) {
            response.writeHead(200);
            response.write(file, "binary");
            response.end();
        })
    });

server.listen(8080, function(){
    console.log('ready captain!');
});
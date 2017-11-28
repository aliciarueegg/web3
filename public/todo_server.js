const
    express = require('express'),
    bodyParser = require('body-parser'),
    morgan = require('morgan'),
    app = express();
		port = process.env.PORT || 8080;

app.use(morgan('dev'));
app.use(express.static(__dirname + ''));
app.use(bodyParser.urlencoded({ extended: false }));

app.listen(port, function(){
    console.log("ready captain.");
});

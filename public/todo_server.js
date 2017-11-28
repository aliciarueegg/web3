const
    express = require('express'),
    bodyParser = require('body-parser'),
    morgan = require('morgan'),
    app = express();

app.use(morgan('dev'));
app.use(express.static(__dirname + ''));
app.use(bodyParser.urlencoded({ extended: false }));

app.listen(8080, function(){
    console.log("ready captain.");
});

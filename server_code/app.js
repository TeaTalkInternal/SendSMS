
const express = require('express');
const bodyParser = require('body-parser');
const helmet = require('helmet');
const cors = require('cors');
const sms_route = require("./sms_route");

const app = express();

//middlewares
app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));
app.use(cors());
app.use(helmet());

//Redirect request to send-sms route
app.use('/send-sms', sms_route);
//Default route
app.use('/', (req, res, next) => {
    res.setHeader('Content-Type', 'application/json');
    res.status(401).json({
        'message': 'Invalid Access'
    });
});

app.listen(process.env.PORT || 3600, () => {
    console.log('Server Started');
});


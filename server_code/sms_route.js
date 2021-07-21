const express = require('express');
const Router = express.Router();

var FCM = require('fcm-node');
//put your server key here
var serverKey = 'server key here'; 
var fcm = new FCM(serverKey);

Router.get('/', (req, res, next) => {
var phone = req.query.phone;
var message = req.query.message;


    var message = { // to : token genrtated from your app
        to: 'token here', 
        collapse_key: 'your_collapse_key',
        
        notification: {
            title: 'sms', 
            body: message 
        },
        
        data: {  //you can send only notification or only data(or include both)
            'message': message,
            'phone': phone
        }
    };
    
    fcm.send(message, function(err, response){
        if (err) {
            console.log("Something has gone wrong!", err);
            res.setHeader('Content-Type', 'application/json');
         return res.status(400).send(err);
        } else {
            console.log("Successfully sent with response: ", response);
            res.setHeader('Content-Type', 'application/json');
         return res.status(200).send(response);
        }
    });
});

module.exports = Router;
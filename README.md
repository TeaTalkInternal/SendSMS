# SendSMS
This repository consists of 2 projects, one flutter app and second Node.js backend.

The Sole goal of this repo is help developers build an REST Api for sending SMS.

The idea is simple, 

Expose a REST Api built using Node.js, This API accepts phone number and messge as query params. Send a push notification whenver API is triggered.
Create a flutter app which uses firebase messaging library. This App reads the notification and sends out sms.

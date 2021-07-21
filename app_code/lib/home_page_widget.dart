// ignore: import_of_legacy_library_into_null_safe
import 'package:background_sms/background_sms.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

Future backgroundMessageHandler(RemoteMessage message) async {
  /// something to do
  final messageStr = message.data['message'];
  final phoneNumberStr = message.data['phone'] as String;

  if (phoneNumberStr.length == 10) {
    SmsStatus result = await BackgroundSms.sendMessage(
        phoneNumber: phoneNumberStr, message: messageStr);
    if (result == SmsStatus.sent) {
      print("Sent");
    } else {
      print("Failed");
    }
  }
  print("Message : $messageStr, Phone : $phoneNumberStr");
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  String _messge = '';
  @override
  void initState() {
    super.initState();
//Handle messages in foreground
    FirebaseMessaging.onMessage
        .listen((message) => backgroundMessageHandler(message));

    FirebaseMessaging.instance.getToken().then((token) {
      print('token: $token');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SMS-MAN'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _messge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_news_app/src/ui/app.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_news_app/main.dart' as main;

FirebaseMessaging f;
Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
    print(data);
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
    print(notification);
  }

  // Or do other work.
}

class MessageHandler extends StatefulWidget {
  @override
  _MessageHandlerState createState() => _MessageHandlerState();
}

class _MessageHandlerState extends State<MessageHandler> {
  @override
  void initState() {
    f = new FirebaseMessaging();
    f.requestNotificationPermissions();
    f.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        if (message['data']['tab'] == 'all') {
          main.selectedCategory = 0;
        } else if (message['data']['tab'] == 'business') {
          main.selectedCategory = 1;
        } else if (message['data']['tab'] == 'health') {
          main.selectedCategory = 2;
        } else if (message['data']['tab'] == 'science') {
          main.selectedCategory = 3;
        } else if (message['data']['tab'] == 'sport') {
          main.selectedCategory = 4;
        } else if (message['data']['tab'] == 'tech') {
          main.selectedCategory = 5;
        } else if (message['data']['tab'] == 'entertainment') {
          main.selectedCategory = 6;
        }
        _showFlutterToast(message);
        // _showItemDialog(message);
      },
      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        if (message['data']['tab'] == 'all') {
          main.selectedCategory = 0;
        } else if (message['data']['tab'] == 'business') {
          main.selectedCategory = 1;
        } else if (message['data']['tab'] == 'health') {
          main.selectedCategory = 2;
        } else if (message['data']['tab'] == 'science') {
          main.selectedCategory = 3;
        } else if (message['data']['tab'] == 'sport') {
          main.selectedCategory = 4;
        } else if (message['data']['tab'] == 'tech') {
          main.selectedCategory = 5;
        } else if (message['data']['tab'] == 'entertainment') {
          main.selectedCategory = 6;
        }
        _showFlutterToast(message);
        // _navigateToItemDetail(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        if (message['data']['tab'] == 'all') {
          main.selectedCategory = 0;
        } else if (message['data']['tab'] == 'business') {
          main.selectedCategory = 1;
        } else if (message['data']['tab'] == 'health') {
          main.selectedCategory = 2;
        } else if (message['data']['tab'] == 'science') {
          main.selectedCategory = 3;
        } else if (message['data']['tab'] == 'sport') {
          main.selectedCategory = 4;
        } else if (message['data']['tab'] == 'tech') {
          main.selectedCategory = 5;
        } else if (message['data']['tab'] == 'entertainment') {
          main.selectedCategory = 6;
        }
        _showFlutterToast(message);
        // _navigateToItemDetail(message);
      },
    );

    f.getToken().then((value) {
      f.getToken().then((value) {
        print(value);
      });
    });
    super.initState();
  }

  void _showFlutterToast(Map<String, dynamic> message) {
    Fluttertoast.showToast(msg: message['notification']['body']);
    print('shown toast!');
  }

  @override
  Widget build(BuildContext context) {
    return App();
  }
}

import 'package:flutter/material.dart';

import 'notification_muter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Notification Sound')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              NotificationSoundController.reduceNotificationSound();
            },
            child: const Text('Reduce Notification Sound'),
          ),
        ),
      ),
    );
  }
}

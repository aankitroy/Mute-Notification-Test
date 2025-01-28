import 'package:flutter/services.dart';

class NotificationSoundController {
  static const MethodChannel _channel =
      MethodChannel('notification_sound_channel');

  static Future<void> reduceNotificationSound() async {
    try {
      await _channel.invokeMethod('reduceNotificationSound');
    } on PlatformException catch (e) {
      print("Error reducing notification sound: ${e.message}");
    }
  }
}

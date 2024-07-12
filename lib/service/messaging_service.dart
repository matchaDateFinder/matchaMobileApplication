import 'dart:async';
import 'dart:convert';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../core/app_export.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

class MessagingService {

  // create an instance to init notifications
  final _firebaseMessaging = FirebaseMessaging.instance;
  final PrefUtils _prefUtils = PrefUtils();

  // function to initialize notifications
  Future<void> initNotifications() async {
    // request permission from user
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    // fetch FCM token for this device
    final fCMToken = await _firebaseMessaging.getToken();

    // put token to the shared preferences
    _prefUtils.setDeviceToken(fCMToken!);

    // init further settings for push notif
    initPushNotifications();
  }

  // function to handle received messages
  void handleMessage(RemoteMessage? message) {
    if(message == null) return;
    showNotification(message);
  }

  // function to initialize the foreground and background settings
  Future initPushNotifications() async {
    var initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );

    // handle notifications if the app was terminated and now opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    // handle message while application is in the foreground
    FirebaseMessaging.onMessage.listen(handleMessage);

    // handle message while application is in the background
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // attach event listens for when a notifications opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

  }

  void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    Map<String, dynamic> payloadMap = json.decode(payload!);
    Map<String,String> result = {};
    result["userPhoneNumber"] = payloadMap["userPhoneNumber"];
    result["receiverPhoneNumber"] = payloadMap["receiverPhoneNumber"];
    result["receiverName"] = payloadMap["receiverName"];
    result["chatRoomId"] = payloadMap["chatRoomId"];
    Get.toNamed(
        AppRoutes.chatRoomOneScreen,
        arguments: result
    );
  }

}

// Background message handler
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if(message == null) return;
  showNotification(message);
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) async {
  final String? payload = notificationResponse.payload;
  Map<String, dynamic> payloadMap = json.decode(payload!);
  Map<String,String> result = {};
  result["userPhoneNumber"] = payloadMap["userPhoneNumber"];
  result["receiverPhoneNumber"] = payloadMap["receiverPhoneNumber"];
  result["receiverName"] = payloadMap["receiverName"];
  result["chatRoomId"] = payloadMap["chatRoomId"];
  Get.toNamed(
      AppRoutes.chatRoomOneScreen,
      arguments: result
  );
}

void showNotification(RemoteMessage message) async {
  var notification = message.data;
  print(notification);
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );
  var platformChannelSpecifics =
  NotificationDetails(android: androidPlatformChannelSpecifics);
  Map<String,String> payloadMap = {};
  payloadMap["userPhoneNumber"] = notification["receiverPhoneNumber"];
  payloadMap["receiverPhoneNumber"] = notification["senderPhoneNumber"];
  payloadMap["receiverName"] = notification["senderName"];
  payloadMap["chatRoomId"] = notification["chatRoomID"];
  flutterLocalNotificationsPlugin.show(
    0,
    notification["title"],
    notification["body"],
    platformChannelSpecifics,
    payload: json.encode(payloadMap)
  );
}

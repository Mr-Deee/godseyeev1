import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:godseyeev1/common_widgets/show_logger.dart';

 AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
   'This channel is used for important notifications.',
  importance: Importance.max,
);

class NotificationService {
  factory NotificationService() {
    return _singleton;
  }

  NotificationService._internal();
  static final NotificationService _singleton = NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> localPlugin() async =>
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

  Future<void> initialize() async {
    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@drawable/parental_launch'),
      ),
    );
  }

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> _requestPermissions() async {
    final androidImplementation =
    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    // await androidImplementation.requestPermission();
  }

  Future<void> configureFirebaseMessaging() async {
    try {
      JHLogger.$.d('A new onMessageOpenedApp event was published!');
      await _requestPermissions().whenComplete(() {
        FirebaseMessaging.onMessage.listen(_onBackgroundListening);
        FirebaseMessaging.onMessageOpenedApp.listen(_onBackgroundListening);
        FirebaseMessaging.onBackgroundMessage(_onBackgroundListening);
      });
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> _onBackgroundListening(RemoteMessage message) async {
    final notification = message.notification;
    final android = message.notification?.android;

    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channel.id,
      channel.description,
      icon: android?.smallIcon,
      color: Colors.black,
      channel.name,
      importance: Importance.max,
      priority: Priority.high,
    );

    if (notification != null && android != null) {
      await flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(android: androidPlatformChannelSpecifics),
      );
    }
  }

}

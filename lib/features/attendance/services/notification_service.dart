import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin
      _notifications = FlutterLocalNotificationsPlugin();

  /// INIT SEKALI DI main.dart
  static Future<void> initialize() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings =
        InitializationSettings(android: androidSettings);

    await _notifications.initialize(settings);
  }

  /// NOTIF GPS AKTIF (SELAMA JAM KERJA)
  static Future<void> showGpsTrackingNotification() async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'gps_tracking_channel',
      'GPS Tracking',
      channelDescription:
          'Aplikasi sedang melacak lokasi untuk absensi',
      importance: Importance.high,
      priority: Priority.high,
      ongoing: true,
      autoCancel: false,
    );

    const NotificationDetails details =
        NotificationDetails(android: androidDetails);

    await _notifications.show(
      1001,
      'GPS Aktif',
      'Aplikasi sedang mengambil lokasi untuk kehadiran',
      details,
    );
  }

  /// HENTIKAN NOTIF
  static Future<void> cancelGpsNotification() async {
    await _notifications.cancel(1001);
  }
}

import 'dart:async';
import 'package:geolocator/geolocator.dart';

import 'notification_service.dart';
import 'location_service.dart';
import 'connectivity_service.dart';
import 'attendance_online_service.dart';
import 'tracking_buffer_service.dart';
import '../models/location_tracking.dart';

class LocationTrackingService {
  static Timer? _timer;
  static bool _isRunning = false;

  static bool _isWorkingHour() {
    final now = DateTime.now();

 
    return (now.hour >= 8 && now.hour < 12) ||
           (now.hour >= 13 && now.hour < 17);
  }


  static String? _attendanceTypeByTime() {
    final hour = DateTime.now().hour;

    if (hour >= 8 && hour < 12) {
      return 'checkin';
    }

    if (hour >= 13 && hour < 17) {
      return 'checkout';
    }

    return null;
  }

  static Future<void> startTracking() async {
    if (_isRunning) return;

    _isRunning = true;

    await NotificationService.showGpsTrackingNotification();

    await _trackOnce();

    _timer = Timer.periodic(
      const Duration(minutes: 5),
      (_) async {
        await _trackOnce();
      },
    );
  }

  static Future<void> stopTracking() async {
    _timer?.cancel();
    _timer = null;
    _isRunning = false;

    await NotificationService.cancelGpsNotification();
  }

  static Future<void> _trackOnce() async {
    if (!_isWorkingHour()) return;

    try {
      final Position position =
          await LocationService.getCurrentLocation();

      final bool isOnline =
          ConnectivityService.currentStatus;

      if (isOnline) {
        await AttendanceOnlineService.submitTracking(
          userId: 'test_user',
          latitude: position.latitude,
          longitude: position.longitude,
        );
      } else {
        await TrackingBufferService.add(
          LocationTracking(
            latitude: position.latitude,
            longitude: position.longitude,
            time: DateTime.now(),
          ),
        );
      }
    } catch (_) {
      // optional: log error
    }
  }
}

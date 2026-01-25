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

  // ===============================
  // JAM KERJA (MODE TESTING)
  // 13.00 – 19.00
  // ===============================
  static bool _isWorkingHour() {
    final now = DateTime.now();
    return now.hour >= 13 && now.hour < 19;
  }

  // ===============================
  // TYPE ABSENSI (MODE TESTING)
  // 13.00 – 15.59 → checkin
  // 16.00 – 19.00 → checkout
  // ===============================
  static String? _attendanceTypeByTime() {
    final hour = DateTime.now().hour;

    if (hour >= 13 && hour < 16) {
      return 'checkin';
    }

    if (hour >= 16 && hour < 19) {
      return 'checkout';
    }

    return null;
  }

  static Future<void> startTracking() async {
    if (_isRunning) return;

    _isRunning = true;

    await NotificationService.showGpsTrackingNotification();

    // Jalan langsung sekali
    await _trackOnce();

    // Tracking tiap 5 menit
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
    // Stop otomatis di luar jam testing
    if (!_isWorkingHour()) return;

    try {
      final Position position =
          await LocationService.getCurrentLocation();

      final bool isOnline =
          ConnectivityService.currentStatus;

      final String? type = _attendanceTypeByTime();
      if (type == null) return;

      if (isOnline) {
        await AttendanceOnlineService.submitAttendance(
          userId: 'test_user',
          latitude: position.latitude,
          longitude: position.longitude,
          type: type,
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

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

  /// JAM KERJA (08.00 - 17.00)
  static bool _isWorkingHour() {
    final now = DateTime.now();
    return now.hour >= 8 && now.hour < 17;
  }

  /// START TRACKING
  static Future<void> startTracking() async {
    // cegah double timer
    if (_timer != null) return;

    // tampilkan notifikasi GPS
    await NotificationService.showGpsTrackingNotification();

    // ambil lokasi langsung sekali
    await _trackOnce();

    // ulang tiap 5 menit
    _timer = Timer.periodic(
      const Duration(minutes: 5),
      (_) async {
        await _trackOnce();
      },
    );
  }

  /// STOP TRACKING
  static Future<void> stopTracking() async {
    _timer?.cancel();
    _timer = null;
    await NotificationService.cancelGpsNotification();
  }

  /// TRACK SEKALI (ONLINE / OFFLINE)
  static Future<void> _trackOnce() async {
    // stop otomatis di luar jam kerja
    if (!_isWorkingHour()) {
      await stopTracking();
      return;
    }

    try {
      final Position position =
          await LocationService.getCurrentLocation();

      final bool isOnline =
          ConnectivityService.currentStatus;

      if (isOnline) {
        // ================= ONLINE → FIREBASE
        await AttendanceOnlineService.submitCheckIn(
          userId: 'test_user', // nanti dari auth
          latitude: position.latitude,
          longitude: position.longitude,
        );
      } else {
        // ================= OFFLINE → TRACKING BUFFER (HIDDEN)
        await TrackingBufferService.add(
          LocationTracking(
            latitude: position.latitude,
            longitude: position.longitude,
            time: DateTime.now(),
          ),
        );
      }
    } catch (_) {
      // sengaja diabaikan agar app tetap stabil
    }
  }
}

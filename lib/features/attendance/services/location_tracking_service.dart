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

  /// ===============================
  /// JAM KERJA (08.00 - 17.00)
  /// ===============================
  /// NOTE:
  /// - Jangan MEMATIKAN tracking di sini
  /// - Cukup skip kirim data jika di luar jam kerja
  static bool _isWorkingHour() {
    final now = DateTime.now();
    return now.hour >= 8 && now.hour < 17;
  }

  /// ===============================
  /// START TRACKING
  /// ===============================
  static Future<void> startTracking() async {
    if (_isRunning) {
      // tracking sudah jalan
      return;
    }

    _isRunning = true;

    // tampilkan notifikasi GPS
    await NotificationService.showGpsTrackingNotification();

    // tracking pertama (langsung)
    await _trackOnce();

    // ulang tiap 5 menit
    _timer = Timer.periodic(
      const Duration(minutes: 5),
      (_) async {
        await _trackOnce();
      },
    );
  }

  /// ===============================
  /// STOP TRACKING
  /// ===============================
  static Future<void> stopTracking() async {
    _timer?.cancel();
    _timer = null;
    _isRunning = false;

    await NotificationService.cancelGpsNotification();
  }

  /// ===============================
  /// TRACK SEKALI (ONLINE / OFFLINE)
  /// ===============================
  static Future<void> _trackOnce() async {
    // ⛔ DI LUAR JAM KERJA → JANGAN KIRIM DATA
    if (!_isWorkingHour()) {
      return; // ❗ JANGAN stopTracking()
    }

    try {
      // ambil lokasi
      final Position position =
          await LocationService.getCurrentLocation();

      final bool isOnline =
          ConnectivityService.currentStatus;

      if (isOnline) {
        // ================= ONLINE → FIRESTORE (TRACKING)
        await AttendanceOnlineService.submitTracking(
          userId: 'test_user', // nanti dari auth
          latitude: position.latitude,
          longitude: position.longitude,
        );
      } else {
        // ================= OFFLINE → BUFFER (HIVE)
        await TrackingBufferService.add(
          LocationTracking(
            latitude: position.latitude,
            longitude: position.longitude,
            time: DateTime.now(),
          ),
        );
      }
    } catch (e) {
      // jangan sampai app crash
      // log boleh ditambah saat debugging
    }
  }
}

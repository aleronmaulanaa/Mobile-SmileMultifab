import 'package:cloud_firestore/cloud_firestore.dart';

class AttendanceOnlineService {
  static final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  // ======================================================
  // ===================== ATTENDANCE =====================
  // ======================================================
  /// DIGUNAKAN HANYA SAAT USER TEKAN "KIRIM ABSENSI"
  /// type: 'checkin' | 'checkout'
  static Future<void> submitAttendance({
    required String userId,
    required double latitude,
    required double longitude,
    required String type,
  }) async {
    await _firestore.collection('attendance').add({
      'userId': userId,
      'type': type,
      'status': 'online',
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  // ======================================================
  // ====================== TRACKING ======================
  // ======================================================
  /// DIGUNAKAN OLEH BACKGROUND SERVICE
  /// TIDAK BOLEH CHECKIN / CHECKOUT
  static Future<void> submitTracking({
    required String userId,
    required double latitude,
    required double longitude,
  }) async {
    await _firestore.collection('tracking').add({
      'userId': userId,
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class AttendanceOnlineService {
  static Future<void> submitCheckIn({
    required String userId,
    required double latitude,
    required double longitude,
  }) async {
    await FirebaseFirestore.instance
        .collection('attendance')
        .add({
      'userId': userId,
      'type': 'checkin',
      'status': 'online',
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}

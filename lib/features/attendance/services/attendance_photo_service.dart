import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AttendancePhotoService {
  static final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;
  static final FirebaseStorage _storage =
      FirebaseStorage.instance;

  static Future<void> uploadAttendancePhoto({
    required String attendanceId,
    required String imagePath,
    required String userId,
  }) async {
    print('🔥 [PHOTO] uploadAttendancePhoto DIPANGGIL');
    print('🔥 [PHOTO] attendanceId = $attendanceId');
    print('🔥 [PHOTO] imagePath = $imagePath');

    try {
      final file = File(imagePath);
      print('📸 [PHOTO] file exists = ${file.existsSync()}');

      final storageRef = _storage
          .ref()
          .child('attendance_photos')
          .child(userId)
          .child('$attendanceId.jpg');

      print('⬆️ [PHOTO] mulai upload ke Firebase Storage');
      await storageRef.putFile(file);
      print('✅ [PHOTO] upload selesai');

      final downloadUrl = await storageRef.getDownloadURL();
      print('🔗 [PHOTO] downloadUrl = $downloadUrl');

      await _firestore
          .collection('attendance')
          .doc(attendanceId)
          .update({
        'photoUrl': downloadUrl,
        'photoStatus': 'uploaded',
      });

      print('✅ [PHOTO] Firestore di-update: uploaded');
    } catch (e, s) {
      print('❌ [PHOTO] ERROR upload foto');
      print(e);
      print(s);

      await _firestore
          .collection('attendance')
          .doc(attendanceId)
          .update({
        'photoStatus': 'failed',
      });

      print('⚠️ [PHOTO] Firestore di-update: failed');
    }
  }
}

import 'package:hive/hive.dart';
import '../../features/profile/models/user_profile.dart';

class UserSession {


  static const String userBoxName = 'user_profile';
  static const String attendanceBoxName = 'attendance_state';

  static String? getUserId() {
    final box = Hive.box<UserProfile>(userBoxName);
    final profile = box.get('current');
    return profile?.badgeNumber;
  }

  static UserProfile? getProfile() {
    final box = Hive.box<UserProfile>(userBoxName);
    return box.get('current');
  }

  static Future<void> clear() async {
    final box = Hive.box<UserProfile>(userBoxName);
    await box.delete('current');

      final attendanceBox = Hive.box(attendanceBoxName);
  await attendanceBox.clear();
  }

  static Future<void> saveAttendanceState({
    required String type,
    required DateTime time,
  }) async {
    final box = Hive.box(attendanceBoxName);

    final todayKey = _todayKey(time);

    final Map<String, dynamic> data =
        Map<String, dynamic>.from(box.get(todayKey) ?? {});

    if (type == 'checkin') {
      data['checkInTime'] = time.toIso8601String();
    }

    if (type == 'checkout') {
      data['checkOutTime'] = time.toIso8601String();
    }

    data['date'] = todayKey;

    await box.put(todayKey, data);
  }

static Map<String, dynamic>? getTodayAttendance() {
  final box = Hive.box(attendanceBoxName);
  final todayKey = _todayKey(DateTime.now());

  final raw = box.get(todayKey);
  if (raw == null) return null;

  // 🔴 FIX UTAMA: force convert Map<dynamic,dynamic> → Map<String,dynamic>
  return Map<String, dynamic>.from(raw as Map);
}


  
  static Future<void> clearTodayAttendance() async {
    final box = Hive.box(attendanceBoxName);
    final todayKey = _todayKey(DateTime.now());
    await box.delete(todayKey);
  }

  
  static String _todayKey(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}

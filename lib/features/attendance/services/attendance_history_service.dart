import 'package:hive/hive.dart';
import '../models/attendance_history.dart';

class AttendanceHistoryService {
  static const String boxName = 'attendance_history';

  static Future<void> addHistory(AttendanceHistory history) async {
    final box = Hive.box<AttendanceHistory>(boxName);
    await box.add(history);
  }

  static List<AttendanceHistory> getAllHistory() {
    final box = Hive.box<AttendanceHistory>(boxName);
    return box.values.toList().reversed.toList();
  }

  static Future<void> clearHistory() async {
  final box = Hive.box<AttendanceHistory>(boxName);
  await box.clear();
}

}

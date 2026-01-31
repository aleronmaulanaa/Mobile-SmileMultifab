import 'package:hive/hive.dart';
import '../models/attendance_daily_summary.dart';

class AttendanceDailySummaryService {
  static const boxName = 'attendance_daily_summary';

  static Box<AttendanceDailySummary> get _box =>
      Hive.box<AttendanceDailySummary>(boxName);

  static AttendanceDailySummary getToday() {
    final today = DateTime.now();
    final key = _key(today);

    if (_box.containsKey(key)) {
      return _box.get(key)!;
    }

    final summary = AttendanceDailySummary(date: today);
    _box.put(key, summary);
    return summary;
  }

  static Future<void> saveCheckIn(DateTime time) async {
    final summary = getToday();
    if (summary.checkIn == null) {
      summary.checkIn = time;
      await summary.save();
    }
  }

  static Future<void> saveCheckOut(DateTime time) async {
    final summary = getToday();
    if (summary.checkIn != null && summary.checkOut == null) {
      summary.checkOut = time;
      await summary.save();
    }
  }

  static String _key(DateTime d) =>
      '${d.year}-${d.month}-${d.day}';
}

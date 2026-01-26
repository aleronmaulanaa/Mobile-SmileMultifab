import 'package:hive/hive.dart';

part 'attendance_daily_summary.g.dart';

@HiveType(typeId: 2)
class AttendanceDailySummary extends HiveObject {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  DateTime? checkIn;

  @HiveField(2)
  DateTime? checkOut;

  AttendanceDailySummary({
    required this.date,
    this.checkIn,
    this.checkOut,
  });
}
  
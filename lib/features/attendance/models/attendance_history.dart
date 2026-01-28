import 'package:hive/hive.dart';

part 'attendance_history.g.dart';

@HiveType(typeId: 1)
class AttendanceHistory extends HiveObject {
  @HiveField(0)
  final String imagePath;

  @HiveField(1)
  final DateTime checkInTime;

  @HiveField(2)
  final double latitude;

  @HiveField(3)
  final double longitude;

  @HiveField(4)
  final bool isOnline;

  @HiveField(5)
  final String photoStatus;

  AttendanceHistory({
    required this.imagePath,
    required this.checkInTime,
    required this.latitude,
    required this.longitude,
    required this.isOnline,
    required this.photoStatus,
  });
}

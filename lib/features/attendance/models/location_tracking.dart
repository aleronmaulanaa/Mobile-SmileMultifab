import 'package:hive/hive.dart';

part 'location_tracking.g.dart';

@HiveType(typeId: 3)
class LocationTracking extends HiveObject {
  @HiveField(0)
  final double latitude;

  @HiveField(1)
  final double longitude;

  @HiveField(2)
  final DateTime time;

  LocationTracking({
    required this.latitude,
    required this.longitude,
    required this.time,
  });
}

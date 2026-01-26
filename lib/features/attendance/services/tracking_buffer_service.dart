import 'package:hive_flutter/hive_flutter.dart';
import '../models/location_tracking.dart';

class TrackingBufferService {
  static const String _boxName = 'tracking_buffer';

  static Future<void> add(LocationTracking data) async {
    final box =
        Hive.box<LocationTracking>(_boxName);
    await box.add(data);
  }

  static List<LocationTracking> getAll() {
    final box =
        Hive.box<LocationTracking>(_boxName);
    return box.values.toList();
  }

  static Future<void> clear() async {
    final box =
        Hive.box<LocationTracking>(_boxName);
    await box.clear();
  }
}

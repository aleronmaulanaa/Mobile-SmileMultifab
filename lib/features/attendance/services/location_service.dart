import 'package:geolocator/geolocator.dart';

class LocationService {
  /// =============================
  /// CEK & MINTA IZIN LOKASI
  /// =============================
  static Future<bool> handlePermission() async {
    // GPS aktif?
    final serviceEnabled =
        await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    LocationPermission permission =
        await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  /// =============================
  /// AMBIL LOKASI TERAKHIR (STABIL)
  /// =============================
  static Future<Position?> getLastKnownLocation() async {
    return await Geolocator.getLastKnownPosition();
  }

  /// =============================
  /// AMBIL LOKASI SEKARANG (FRESH)
  /// =============================
  static Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation,
    );
  }

  /// =============================
  /// STREAM LOKASI REALTIME
  /// (DI-FILTER AKURASI)
  /// =============================
  static Stream<Position> getPositionStream() {
    return Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 5, // update tiap 5 meter
      ),
    ).where(
      (position) =>
          position.accuracy <= 25, // 🔥 FILTER PENTING
    );
  }
}

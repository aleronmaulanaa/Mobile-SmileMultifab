import 'package:geolocator/geolocator.dart';

class LocationService {

  static Future<bool> handlePermission() async {
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


  static Future<Position?> getLastKnownLocation() async {
    return await Geolocator.getLastKnownPosition();
  }


  static Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation,
    );
  }


  static Stream<Position> getPositionStream() {
    return Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 5, 
      ),
    ).where(
      (position) =>
          position.accuracy <= 25, 
    );
  }
}

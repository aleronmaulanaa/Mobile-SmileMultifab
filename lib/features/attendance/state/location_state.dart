import 'package:geolocator/geolocator.dart';

class LocationState {
  static Position? currentPosition;

  static void setPosition(Position position) {
    currentPosition = position;
  }

  static void clear() {
    currentPosition = null;
  }
}

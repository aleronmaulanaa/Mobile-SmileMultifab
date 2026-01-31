import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

import '../services/location_service.dart';

class AttendanceMap extends StatefulWidget {
  const AttendanceMap({super.key});

  @override
  State<AttendanceMap> createState() => _AttendanceMapState();
}

class _AttendanceMapState extends State<AttendanceMap> {
  static const LatLng _officeLocation = LatLng(
    -6.286633302601647,
    106.81804195921436,
  );

  static const double _radiusMeter = 75;

  LatLng? _userLocation;
  bool _isInsideRadius = false;

  double _heading = 0;

  final Distance _distance = const Distance();
  final MapController _mapController = MapController();

  StreamSubscription<Position>? _positionSubscription;
  StreamSubscription<CompassEvent>? _compassSubscription;

  @override
  void initState() {
    super.initState();
    _initLocation();
    _initCompass();
  }

  void _initCompass() {
    _compassSubscription =
        FlutterCompass.events?.listen((event) {
      if (!mounted || event.heading == null) return;
      setState(() {
        _heading = event.heading!;
      });
    });
  }

  Future<void> _initLocation() async {
    final hasPermission =
        await LocationService.handlePermission();
    if (!hasPermission) return;

    final lastPosition =
        await LocationService.getLastKnownLocation();
    if (lastPosition != null) {
      _updateUser(lastPosition);
    }

    final currentPosition =
        await LocationService.getCurrentLocation();
    _updateUser(currentPosition);

    _positionSubscription =
        LocationService.getPositionStream()
            .listen(_updateUser);
  }

  void _updateUser(Position position) {
    if (!mounted) return;

    final userLatLng = LatLng(
      position.latitude,
      position.longitude,
    );

    final distanceToOffice =
        _distance(userLatLng, _officeLocation);

    setState(() {
      _userLocation = userLatLng;
      _isInsideRadius = distanceToOffice <= _radiusMeter;
    });

    _mapController.move(
      userLatLng,
      _mapController.camera.zoom,
    );
  }

  @override
  void dispose() {
    _positionSubscription?.cancel();
    _compassSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: _officeLocation,
        initialZoom: 18,
        minZoom: 3,
        maxZoom: 19,
        interactionOptions: const InteractionOptions(
          flags: InteractiveFlag.all,
        ),
      ),
      children: [
        TileLayer(
          urlTemplate:
              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName:
              'com.example.mobile_smile_multifab',
        ),

        CircleLayer(
          circles: [
            CircleMarker(
              point: _officeLocation,
              radius: _radiusMeter,
              useRadiusInMeter: true,
              color: (_isInsideRadius
                      ? Colors.green
                      : Colors.red)
                  .withOpacity(0.25),
              borderColor:
                  _isInsideRadius ? Colors.green : Colors.red,
              borderStrokeWidth: 2,
            ),
          ],
        ),

        MarkerLayer(
          markers: [
            Marker(
              point: _officeLocation,
              width: 40,
              height: 40,
              child: const Icon(
                Icons.location_pin,
                color: Colors.red,
                size: 40,
              ),
            ),

            if (_userLocation != null)
              Marker(
                point: _userLocation!,
                width: 72,
                height: 72,
                child: Transform.rotate(
                  angle: _heading * pi / 180,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                      ),
                      ClipPath(
                        clipper: _ConeClipper(),
                        child: Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            gradient: RadialGradient(
                              colors: [
                                const Color(0xFF1A73E8)
                                    .withOpacity(0.35),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A73E8),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.4),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _ConeClipper extends CustomClipper<ui.Path> {
  @override
  ui.Path getClip(Size size) {
    final path = ui.Path();
    path.moveTo(size.width / 2, size.height / 2);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<ui.Path> oldClipper) =>
      false;
}

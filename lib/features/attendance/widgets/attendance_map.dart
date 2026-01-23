import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
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

  final Distance _distance = const Distance();
  final MapController _mapController = MapController();

  StreamSubscription<Position>? _positionSubscription;

  @override
  void initState() {
    super.initState();
    _initLocation();
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
              width: 40,
              height: 40,
              child: Image.asset(
                'assets/images/attendance/img_people.png',
                width: 36,
                height: 36,
                fit: BoxFit.contain,
              ),
            ),

          ],
        ),
      ],
    );
  }
}

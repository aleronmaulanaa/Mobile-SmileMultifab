import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import '../state/location_state.dart';
import '../services/connectivity_service.dart';
import '../services/attendance_history_service.dart';
import '../models/attendance_history.dart';

class InformationCard extends StatefulWidget {
  const InformationCard({super.key});

  @override
  State<InformationCard> createState() =>
      _InformationCardState();
}

class _InformationCardState extends State<InformationCard> {
  static const String _userName = 'M. Richie Sugestiana';
  static const String _userId = '83493';

  late String _date;
  bool _isOnline = false;
  String _checkInTime = '--.--';
  String _checkOutTime = '--.--';

  Timer? _timer;
  StreamSubscription<bool>? _connectionSub;

  @override
  void initState() {
    super.initState();

    _isOnline = ConnectivityService.currentStatus;

    _updateDate();
    _loadAttendanceTimes();
    _loadLocation();

    _timer = Timer.periodic(
      const Duration(minutes: 1),
      (_) => _updateDate(),
    );

    _connectionSub =
        ConnectivityService.onlineStatusStream.listen(
      (status) async {
        if (!mounted) return;

        setState(() => _isOnline = status);

        await _loadLocation();
        _loadAttendanceTimes();
      },
    );
  }

  void _updateDate() {
    if (!mounted) return;
    setState(() {
      _date = DateFormat(
        'EEEE, d MMMM yyyy',
        'id_ID',
      ).format(DateTime.now());
    });
  }

  Future<void> _loadLocation() async {
    try {
      Position? pos;

      if (_isOnline) {
        pos = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
      } else {
        pos = await Geolocator.getLastKnownPosition();
      }

      if (pos != null) {
        LocationState.setPosition(pos);
        if (mounted) setState(() {});
      }
    } catch (_) {
      // ignore
    }
  }

                              Future<void> _loadAttendanceTimes() async {
                                final today = DateTime.now();
                                final startOfDay = DateTime(
                                  today.year,
                                  today.month,
                                  today.day,
                                );

                                final snapshot = await FirebaseFirestore.instance
                                    .collection('attendance')
                                    .where('userId', isEqualTo: _userId) // pakai userId kamu
                                    .where(
                                      'timestamp',
                                      isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay),
                                    )
                                    .orderBy('timestamp')
                                    .get();

                                if (!mounted) return;

                                // DEFAULT — BELUM ABSEN
                                if (snapshot.docs.isEmpty) {
                                  setState(() {
                                    _checkInTime = '--.--';
                                    _checkOutTime = '--.--';
                                    _isOnline = false;
                                  });
                                  return;
                                }

                                DateTime? checkInTime;
                                DateTime? checkOutTime;

                                for (final doc in snapshot.docs) {
                                  final data = doc.data();
                                  final time =
                                      (data['timestamp'] as Timestamp).toDate();

                                  if (data['type'] == 'checkin' && checkInTime == null) {
                                    checkInTime = time;
                                  }

                                  if (data['type'] == 'checkout') {
                                    checkOutTime = time;
                                  }
                                }

  setState(() {
    _checkInTime = checkInTime != null
        ? DateFormat('HH.mm').format(checkInTime!)
        : '--.--';

    _checkOutTime = checkOutTime != null
        ? DateFormat('HH.mm').format(checkOutTime!)
        : '--.--';

    _isOnline = checkInTime != null && checkOutTime == null;
  });
}



  String _latLongText() {
    final pos = LocationState.currentPosition;
    if (pos == null) {
      return "-";
    }
    return '${pos.latitude.toStringAsFixed(5)}   '
           '${pos.longitude.toStringAsFixed(5)}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    _connectionSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: const [
              Icon(
                Icons.person,
                size: 16,
                color: Colors.black54,
              ),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  'M. Richie Sugestiana',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                'ID: 83493',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              Text(
                _latLongText(),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  CircleAvatar(
                    radius: 4,
                    backgroundColor:
                        _isOnline ? Colors.green : Colors.red,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    _isOnline ? "Online" : "Offline",
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          _isOnline ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 10),

          
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Information",
                      style: TextStyle(
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _date,
                      style:
                          const TextStyle(fontSize: 12),
                    ),
                    const Text(
                      "Shift : Normal (07.00 - 17.00)",
                      style:
                          TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF1E6),
                  borderRadius:
                      BorderRadius.circular(10),
                ),
                child: Text(
                  '$_checkInTime  |  $_checkOutTime',
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

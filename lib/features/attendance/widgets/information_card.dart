import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../state/location_state.dart';
import '../services/connectivity_service.dart';

class InformationCard extends StatefulWidget {
  const InformationCard({super.key});

  @override
  State<InformationCard> createState() => _InformationCardState();
}

class _InformationCardState extends State<InformationCard> {
  late String _date;
  bool _isOnline = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _updateDate();

    // update tanggal (tidak mengubah layout)
    _timer = Timer.periodic(
      const Duration(minutes: 1),
      (_) => _updateDate(),
    );

    // status online
    ConnectivityService.onlineStatusStream.listen((status) {
      if (mounted) {
        setState(() => _isOnline = status);
      }
    });
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

  String _latLongText() {
    final pos = LocationState.currentPosition;
    if (pos == null) {
      // ⛑️ fallback dummy TANPA ubah layout
      return "-6.1754   106.8272";
    }
    return '${pos.latitude.toStringAsFixed(5)}   '
           '${pos.longitude.toStringAsFixed(5)}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ⚠️ STRUKTUR UI DI BAWAH INI PERSIS SEPERTI DESIGN AWAL
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
            children: [
              // 🔥 SATU-SATUNYA YANG BERUBAH: ISI TEXT
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Information",
                      style:
                          TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _date,
                      style: const TextStyle(fontSize: 12),
                    ),
                    const Text(
                      "Shift : Normal (07.00 - 17.00)",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF1E6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "07.35  |  09.00",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

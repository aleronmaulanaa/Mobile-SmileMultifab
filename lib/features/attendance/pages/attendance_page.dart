import 'package:flutter/material.dart';

import '../widgets/attendance_map.dart';
import '../widgets/back_button_map.dart';
import '../widgets/time_status.dart';
import '../widgets/information_card.dart';
import '../widgets/action_buttons.dart';
import '../services/location_tracking_service.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  static const double timeLineBottom = 270;

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      LocationTrackingService.startTracking();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AttendanceMap(),

          const Positioned(
            left: 16,
            bottom: AttendancePage.timeLineBottom - 10,
            child: BackButtonMap(),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: TimeStatus(),
                ),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // ❗ TIDAK DIUBAH
                      InformationCard(),

                     const SizedBox(height: 14),

                      // ❗ TIDAK DIUBAH
                     const ActionButtons(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../widgets/attendance_map.dart';
import '../widgets/back_button_map.dart';
import '../widgets/time_status.dart';
import '../widgets/information_card.dart';
import '../widgets/action_buttons.dart';
import '../services/location_tracking_service.dart';


class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  static const double timeLineBottom = 270;

  @override
  Widget build(BuildContext context) {
     WidgetsBinding.instance.addPostFrameCallback((_) {
      LocationTrackingService.startTracking();
    });
    return Scaffold(
      body: Stack(
        children: [
          
          const AttendanceMap(),

         
          const Positioned(
            left: 16,
            bottom: timeLineBottom - 10,
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
                    children: const [
                      
                      InformationCard(),

                      SizedBox(height: 14),

                      
                      ActionButtons(),
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

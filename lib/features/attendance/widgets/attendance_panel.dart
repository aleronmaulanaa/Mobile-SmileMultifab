import 'package:flutter/material.dart';
import 'time_status.dart';
import 'information_card.dart';
import 'action_buttons.dart';

class AttendancePanel extends StatelessWidget {
  const AttendancePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TimeStatus(),
            SizedBox(height: 12),
            InformationCard(),
            SizedBox(height: 16),
            ActionButtons(),
          ],
        ),
      ),
    );
  }
}

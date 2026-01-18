import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../pages/record_time_page.dart';
import '../pages/attendance_history_page.dart'; 

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ===== RECORD TIME
        Expanded(
          child: _ShadowButton(
            color: Colors.red,
            icon: SvgPicture.asset(
              'assets/icons/ic_jam.svg',
              width: 18,
              height: 18,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            label: 'Record Time',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const RecordTimePage(),
                ),
              );
            },
          ),
        ),

        const SizedBox(width: 12),

        // ===== HISTORY
        Expanded(
          child: _ShadowButton(
            color: Colors.green,
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
              size: 18,
            ),
            label: 'History',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AttendanceHistoryPage(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

/// =======================================
/// CUSTOM BUTTON DENGAN SHADOW HITAM
/// =======================================
class _ShadowButton extends StatelessWidget {
  final Color color;
  final Widget icon;
  final String label;
  final VoidCallback onTap;

  const _ShadowButton({
    required this.color,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(23),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 6),
            blurRadius: 12,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(23),
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class ScanOverlay extends StatelessWidget {
  const ScanOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Image.asset(
        'assets/images/scan/img_scan.png',
        fit: BoxFit.contain,
      ),
    );
  }
}

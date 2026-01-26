import 'package:flutter/material.dart';

class ScanSuccessPopup extends StatelessWidget {
  const ScanSuccessPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 326,
        height: 229,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(21.3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/scan/check_scan.png',
              width: 98,
              height: 98,
            ),
            const SizedBox(height: 16),
            const Text(
              'Success',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                color: Color(0xFF65D340),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

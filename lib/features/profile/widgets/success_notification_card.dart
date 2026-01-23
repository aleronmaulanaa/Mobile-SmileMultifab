import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessNotificationCard extends StatelessWidget {
  const SuccessNotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, -3),
            blurRadius: 4,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gambar Gembok
            Image.asset(
              'assets/images/profile/popup_lock.png', // Pastikan path benar
              width: 73,
              height: 73,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 16),

            // Text Password updated
            const Text(
              'Password updated',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Colors.black,
                height: 1.0,
              ),
            ),

            // Row: successfully + Checklist Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'successfully',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Colors.black,
                    height: 1.0,
                  ),
                ),
                const SizedBox(width: 7),
                SvgPicture.asset(
                  'assets/icons/checklist_popup.svg', // Pastikan path benar
                  width: 36,
                  height: 36,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

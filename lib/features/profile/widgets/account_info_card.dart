import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountInfoCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String value;
  final bool showCopyIcon;
  final VoidCallback? onCopyTap;

  const AccountInfoCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.value,
    this.showCopyIcon = false,
    this.onCopyTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 384,
      height: 78,
      margin: const EdgeInsets.only(bottom: 16), // Jarak antar kartu
      padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 3),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ===========================
          // 1. ICON BULAT KIRI
          // ===========================
          Container(
            width: 44,
            height: 44,
            padding: const EdgeInsets.all(10), // Padding dalam 10
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22), // Radius 22 (Lingkaran)
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(0, 3),
                  blurRadius: 4,
                ),
              ],
            ),
            child: SvgPicture.asset(
              iconPath,
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(width: 13), // Jarak icon ke text

          // ===========================
          // 2. TEXT SECTION
          // ===========================
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500, // Medium
                    fontSize: 13,
                    color: Color(0xFF575757),
                  ),
                ),
                const SizedBox(height: 4), // Jarak antar text
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500, // Medium
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          // ===========================
          // 3. COPY ICON (KANAN)
          // ===========================
          if (showCopyIcon)
            GestureDetector(
              onTap: onCopyTap,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SvgPicture.asset(
                  'assets/icons/ic_copy.svg', // Pastikan icon ini ada
                  width: 24,
                  height: 23,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // WAJIB IMPORT INI

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        // ===========================
        // BAGIAN 1: BACKGROUND MERAH & MENU SAMPING
        // ===========================
        Container(
          width: double.infinity,
          height: 88,
          color: const Color(0xFF991B1C),
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // --- TOMBOL HOME ---
              _buildNavIcon(
                label: "HOME",
                iconPath: "assets/icons/ic_home.svg",
                onTap: () {},
              ),

              // Spacer kosong
              const SizedBox(width: 60),

              // --- TOMBOL PROFILE ---
              _buildNavIcon(
                label: "PROFILE",
                iconPath: "assets/icons/ic_profile.svg",
                onTap: () {},
              ),
            ],
          ),
        ),

        // ===========================
        // BAGIAN 2: TOMBOL SCAN (TENGAH)
        // ===========================
        Positioned(
          bottom: 25,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Lingkaran 1
              Container(
                width: 85,
                height: 85,
                decoration: const BoxDecoration(
                  color: Color(0xFFF3F4F6),
                  shape: BoxShape.circle,
                ),
              ),
              // Lingkaran 2
              Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  color: Color(0xFF991B1C),
                  shape: BoxShape.circle,
                ),
              ),
              // Lingkaran 3
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  // PERBAIKAN: Ganti Image.asset jadi SvgPicture.asset
                  child: SvgPicture.asset(
                    "assets/icons/ic_scan.svg",
                    width: 39,
                    height: 39,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),

        // ===========================
        // BAGIAN 3: TOMBOL ULANG TAHUN
        // ===========================
        Positioned(
          left: 24,
          bottom: 70,
          child: Container(
            width: 49,
            height: 49,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFFFDD00).withOpacity(0.29),
                width: 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFFDD00).withOpacity(0.29),
                  offset: const Offset(0, 0),
                  blurRadius: 29,
                ),
              ],
            ),
            child: Center(
              // PERBAIKAN: Ganti Image.asset jadi SvgPicture.asset
              child: SvgPicture.asset(
                "assets/icons/ic_birthday.svg",
                width: 33,
                height: 33,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // =========================================
  // HELPER WIDGET
  // =========================================
  Widget _buildNavIcon({
    required String label,
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // PERBAIKAN UTAMA DISINI:
          // Menggunakan SvgPicture.asset dengan ColorFilter untuk mewarnai putih
          SvgPicture.asset(
            iconPath,
            width: 39,
            height: 39,
            // Cara mewarnai SVG menjadi putih:
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),

          const SizedBox(height: 4),

          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

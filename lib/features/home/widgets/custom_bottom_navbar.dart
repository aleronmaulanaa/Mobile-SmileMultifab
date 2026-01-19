import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final VoidCallback? onScanTap;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    this.onScanTap,
  });

  @override
  Widget build(BuildContext context) {
    const double navHeight = 78.0;
    // Area sentuh disesuaikan karena birthday button sudah hilang
    // Cukup setinggi tombol Scan yang menonjol
    const double touchAreaHeight = 120.0; 

    const double scanOuterSize = 85.0;
    const double scanMidSize = 70.0;
    const double scanInnerSize = 60.0;
    const double scanIconSize = 34.0;

    // Posisi tombol scan (Center Horizontal handled by Stack Alignment)
    const double scanBottomPos = navHeight - (scanOuterSize / 2);

    return SizedBox(
      height: touchAreaHeight,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          // ===========================
          // 1. NAV BAR BACKGROUND (MERAH)
          // ===========================
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: navHeight,
              padding: const EdgeInsets.symmetric(horizontal: 45),
              decoration: const BoxDecoration(
                color: Color(0xFF991B1C),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // --- ICON HOME (Index 0) ---
                  _buildNavIcon(
                    label: "HOME",
                    iconPath: "assets/icons/ic_home.svg",
                    // Jika index 0, dia aktif (Putih penuh), jika tidak transparan
                    isActive: selectedIndex == 0,
                    onTap: () => onItemTapped(0),
                  ),

                  // --- ICON PROFILE (Index 1) ---
                  _buildNavIcon(
                    label: "PROFILE",
                    iconPath: "assets/icons/ic_profile.svg",
                    // Jika index 1, dia aktif (Putih penuh)
                    isActive: selectedIndex == 1,
                    onTap: () => onItemTapped(1),
                  ),
                ],
              ),
            ),
          ),

          // ===========================
          // 2. CENTER SCAN BUTTON
          // ===========================
          Positioned(
            bottom: scanBottomPos,
            child: GestureDetector(
              onTap: onScanTap,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Outer Ring (Abu-abu)
                  Container(
                    width: scanOuterSize,
                    height: scanOuterSize,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF3F4F6),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2))
                      ],
                    ),
                  ),
                  // Mid Ring (Merah)
                  Container(
                    width: scanMidSize,
                    height: scanMidSize,
                    decoration: const BoxDecoration(
                      color: Color(0xFF991B1C),
                      shape: BoxShape.circle,
                    ),
                  ),
                  // Inner Circle (Putih + Icon)
                  Container(
                    width: scanInnerSize,
                    height: scanInnerSize,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/icons/ic_scan.svg",
                        width: scanIconSize,
                        height: scanIconSize,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavIcon({
    required String label,
    required String iconPath,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 32,
            height: 32,
            // LOGIKA WARNA:
            // Aktif = Putih Solid (100%)
            // Tidak Aktif = Putih Transparan (50%) agar terlihat "stroke/redup"
            colorFilter: ColorFilter.mode(
              isActive ? Colors.white : Colors.white.withOpacity(0.5), 
              BlendMode.srcIn
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
              // Teks juga diredupkan jika tidak aktif
              color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_smile_multifab/features/home/widgets/birthday_popup.dart';

class CustomBottomNavBar extends StatelessWidget {
  // 1. Parameter Wajib
  final int selectedIndex;
  final Function(int) onItemTapped;
  
  // 2. Parameter untuk menyembunyikan Birthday Button
  final bool showBirthday;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    this.showBirthday = true, // Default-nya muncul (true)
  });

  @override
  Widget build(BuildContext context) {
    const double navHeight = 78.0;
    const double touchAreaHeight = 160.0;

    const double scanOuterSize = 85.0;
    const double scanMidSize = 70.0;
    const double scanInnerSize = 60.0;
    const double scanIconSize = 34.0;

    const double bdaySize = 58.0;
    const double bdayIconSize = 34.0;

    const double scanBottomPos = navHeight - (scanOuterSize / 2);

    const double bdayBottomPos = (navHeight + (scanOuterSize / 2)) - 15.0;

    return SizedBox(
      height: touchAreaHeight,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          // ==============================
          // 1. BACKGROUND BAR & MENU ICONS
          // ==============================
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
                  // --- HOME BUTTON (Index 0) ---
                  _buildNavIcon(
                    label: "HOME",
                    // Logika: Jika index 0, pakai icon aktif (putih full/isi)
                    iconPath: selectedIndex == 0
                        ? "assets/icons/ic_home-aktif.svg"
                        : "assets/icons/ic_home.svg",
                    iconSize: 32,
                    isActive: selectedIndex == 0, // Cek status aktif
                    onTap: () => onItemTapped(0),
                  ),

                  // --- PROFILE BUTTON (Index 1) ---
                  _buildNavIcon(
                    label: "PROFILE",
                    // Logika: Jika index 1, pakai icon aktif (putih full/isi)
                    iconPath: selectedIndex == 1
                        ? "assets/icons/ic_profile-aktif.svg"
                        : "assets/icons/ic_profile.svg",
                    iconSize: 32,
                    isActive: selectedIndex == 1, // Cek status aktif
                    onTap: () => onItemTapped(1),
                  ),
                ],
              ),
            ),
          ),

          // ==============================
          // 2. SCAN BUTTON (Tengah)
          // ==============================
          Positioned(
            bottom: scanBottomPos,
            child: Stack(
              alignment: Alignment.center,
              children: [
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
                Container(
                  width: scanMidSize,
                  height: scanMidSize,
                  decoration: const BoxDecoration(
                    color: Color(0xFF991B1C),
                    shape: BoxShape.circle,
                  ),
                ),
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

          // ==============================
          // 3. BIRTHDAY BUTTON (Kondisional)
          // ==============================
          // Logika: Hanya tampilkan jika showBirthday == true
          if (showBirthday)
            Positioned(
              left: 24,
              bottom: bdayBottomPos,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    barrierColor: const Color(0x59000000),
                    builder: (BuildContext context) {
                      return const BirthdayPopup();
                    },
                  );
                },
                child: Container(
                  width: bdaySize,
                  height: bdaySize,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFFFDD00).withOpacity(0.5),
                      width: 1.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFFDD00).withOpacity(0.3),
                        offset: const Offset(0, 4),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/icons/ic_birthday.svg",
                      width: bdayIconSize,
                      height: bdayIconSize,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // ==============================
  // HELPER WIDGET
  // ==============================
  Widget _buildNavIcon({
    required String label,
    required String iconPath,
    required double iconSize,
    required bool isActive, // Parameter baru untuk cek status
    required VoidCallback onTap,
  }) {
    // Tentukan warna: Putih terang jika aktif, Putih 50% jika tidak aktif
    final Color itemColor = isActive ? Colors.white : Colors.white.withOpacity(0.5);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: iconSize,
            height: iconSize,
            // Terapkan warna dinamis ke icon
            colorFilter: ColorFilter.mode(itemColor, BlendMode.srcIn),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: itemColor, // Terapkan warna dinamis ke text
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_smile_multifab/features/home/widgets/birthday_popup.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final bool showBirthday;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    this.showBirthday = true,
  });

  @override
  Widget build(BuildContext context) {
    const double navHeight = 78.0;
    final double touchAreaHeight = showBirthday ? 160.0 : 120.0;

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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: navHeight,
              padding: const EdgeInsets.symmetric(horizontal: 45),
              decoration: const BoxDecoration(
                color: Color(0xFF991B1C),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNavIcon(
                    label: "HOME",
                    iconPath: selectedIndex == 0
                        ? "assets/icons/ic_home-aktif.svg"
                        : "assets/icons/ic_home.svg",
                    iconSize: 32,
                    isActive: selectedIndex == 0,
                    onTap: () => onItemTapped(0),
                  ),
                  _buildNavIcon(
                    label: "PROFILE",
                    iconPath: selectedIndex == 1
                        ? "assets/icons/ic_profile-aktif.svg"
                        : "assets/icons/ic_profile.svg",
                    iconSize: 32,
                    isActive: selectedIndex == 1,
                    onTap: () => onItemTapped(1),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: scanBottomPos,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/scan');
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: scanOuterSize,
                    height: scanOuterSize,
                    decoration: const BoxDecoration(
                      color: Color(
                          0xFFF3F4F6),
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
          ),
          
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

  Widget _buildNavIcon({
    required String label,
    required String iconPath,
    required double iconSize,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    final Color itemColor =
        isActive ? Colors.white : Colors.white.withOpacity(0.5);

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
            colorFilter: ColorFilter.mode(itemColor, BlendMode.srcIn),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: itemColor,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

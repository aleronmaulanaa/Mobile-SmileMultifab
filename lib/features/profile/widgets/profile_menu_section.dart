import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_smile_multifab/features/profile/screens/account_screen.dart';
import 'package:mobile_smile_multifab/features/profile/screens/information_profile_screen.dart';

class ProfileMenuSection extends StatelessWidget {
  final VoidCallback onChangePassword;

  const ProfileMenuSection({
    super.key,
    required this.onChangePassword,
  });

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        reverseTransitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOutQuart;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
        child: SingleChildScrollView(

          physics: const AlwaysScrollableScrollPhysics(),

          padding:
              const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 30),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Account',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 12),

              _buildMenuButton(
                iconPath: 'assets/images/profile/account.png',
                label: 'Account',
                iconSize: 32,
                onTap: () {
                  _navigateTo(context, const AccountScreen());
                },
              ),

              const SizedBox(height: 12),

              _buildMenuButton(
                iconPath: 'assets/images/profile/informasi_profile.png',
                label: 'Information Profile',
                iconSize: 24,
                leftPadding: 23,
                onTap: () {
                  _navigateTo(context, const InformationProfileScreen());
                },
              ),

              const SizedBox(height: 37),
              const Text(
                'Security',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 12),

              _buildMenuButton(
                iconPath: 'assets/images/profile/change_password.png',
                label: 'Change Password',
                iconSize: 24,
                leftPadding: 23,
                onTap: onChangePassword,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton({
    required String iconPath,
    required String label,
    required double iconSize,
    required VoidCallback onTap,
    double leftPadding = 17,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 39,
        padding: EdgeInsets.only(
          left: leftPadding,
          right: 17,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 32,
              child: iconPath.endsWith('.svg')
                  ? SvgPicture.asset(iconPath)
                  : Image.asset(iconPath),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
            SvgPicture.asset(
              'assets/icons/ic_arrow-back-right.svg',
              width: 27,
              height: 27,
            ),
          ],
        ),
      ),
    );
  }
}

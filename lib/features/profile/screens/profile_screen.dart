// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// // Import Navbar
// import 'package:mobile_smile_multifab/features/home/widgets/custom_bottom_navbar.dart';

// // Import Home Screen
// import 'package:mobile_smile_multifab/screens/home_screen.dart'; // Perbaiki path import jika perlu

// // Import Widgets Profile
// import 'package:mobile_smile_multifab/features/profile/widgets/profile_card.dart';
// import 'package:mobile_smile_multifab/features/profile/widgets/profile_menu_section.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   final bool _isOnline = true;

//   @override
//   Widget build(BuildContext context) {
//     // Setup warna status
//     final String statusText = _isOnline ? "Online" : "Offline";
//     final Color statusCircleColor =
//         _isOnline ? const Color(0xFF74FF46) : const Color(0xFFFF4646);
//     final Color statusTextColor =
//         _isOnline ? const Color(0xFF65D340) : const Color(0xFFD34040);

//     // Konfigurasi Posisi
//     const double headerCardTop = 180.0;

//     // REVISI: Diubah dari 200.0 menjadi 220.0
//     // Semakin besar angka ini, section putih semakin turun (terlihat lebih pendek)
//     const double menuSectionTop = 430.0;

//     return Scaffold(
//       backgroundColor: const Color(0xFFF3F4F6),
//       body: SizedBox.expand(
//         child: Stack(
//           children: [
//             // ===========================
//             // 1. BACKGROUND HEADER (GRADIENT)
//             // ===========================
//             ClipPath(
//               clipper: HeaderCurveClipper(),
//               child: Container(
//                 width: double.infinity,
//                 height: MediaQuery.of(context).size.height * 0.45,
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Color(0xFFFAFAFA),
//                       Color(0xFFFDE5E3),
//                       Color(0xFFFDCBC9),
//                     ],
//                     stops: [0.31, 0.55, 1.0],
//                   ),
//                 ),
//               ),
//             ),

//             // ===========================
//             // 2. PROFILE MENU SECTION (BAGIAN 2 - PUTIH)
//             // ===========================
//             Positioned(
//               top: menuSectionTop, // 220.0
//               left: 0,
//               right: 0,
//               bottom: 0,
//               child: const ProfileMenuSection(),
//             ),

//             // ===========================
//             // 3. PROFILE HEADER CARD (BAGIAN 1 - MERAH)
//             // ===========================
//             const Positioned(
//               top: headerCardTop,
//               left: 24,
//               right: 24,
//               child: ProfileHeaderCard(),
//             ),

//             // ===========================
//             // 4. TOP HEADER (LOGO & NOTIF)
//             // ===========================
//             Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                 color: const Color(0xFFFAFAFA),
//                 child: SafeArea(
//                   bottom: false,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 24.0, vertical: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Image.asset(
//                           'assets/images/common/logo_smile_v2.png',
//                           height: 58,
//                           fit: BoxFit.contain,
//                         ),
//                         Row(
//                           children: [
//                             Stack(
//                               clipBehavior: Clip.none,
//                               children: [
//                                 SvgPicture.asset(
//                                   'assets/icons/ic_notification.svg',
//                                   width: 24,
//                                   height: 24,
//                                 ),
//                                 Positioned(
//                                   right: 1,
//                                   top: 0,
//                                   child: Container(
//                                     width: 10,
//                                     height: 10,
//                                     decoration: const BoxDecoration(
//                                       color: Color(0xFFF04241),
//                                       shape: BoxShape.circle,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             const SizedBox(width: 16),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 8.0),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Container(
//                                     width: 18,
//                                     height: 18,
//                                     decoration: BoxDecoration(
//                                       color: statusCircleColor,
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                         color: const Color(0xFFDBDBDB),
//                                         width: 2,
//                                       ),
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: Colors.black.withOpacity(0.1),
//                                           blurRadius: 4,
//                                           offset: const Offset(0, 2),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(height: 2),
//                                   Text(
//                                     statusText,
//                                     style: TextStyle(
//                                       color: statusTextColor,
//                                       fontSize: 10,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             // ===========================
//             // 5. BOTTOM NAVIGATION BAR
//             // ===========================
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: CustomBottomNavBar(
//                 selectedIndex: 1,
//                 onItemTapped: (index) {
//                   if (index == 0) {
//                     // Navigasi ke Home (Nonaktif sementara)
//                   }
//                 },
//                 onScanTap: () {},
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Clipper Header
// class HeaderCurveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height - 60);
//     path.quadraticBezierTo(
//       size.width / 2,
//       size.height + 40,
//       size.width,
//       size.height - 60,
//     );
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Import Navbar
import 'package:mobile_smile_multifab/features/home/widgets/custom_bottom_navbar.dart';

// Import Home Screen
// import 'package:mobile_smile_multifab/screens/home_screen.dart';

// Import Widgets Profile
import 'package:mobile_smile_multifab/features/profile/widgets/profile_card.dart';
import 'package:mobile_smile_multifab/features/profile/widgets/profile_menu_section.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final bool _isOnline = true;

  @override
  Widget build(BuildContext context) {
    // 1. Ambil Tinggi Layar HP Pengguna
    final double screenHeight = MediaQuery.of(context).size.height;

    // 2. Hitung Faktor Skala (Scale Factor)
    // Angka 844.0 adalah tinggi standar referensi desain (misal iPhone 12/13)
    // Jika HP user lebih kecil, scale < 1. Jika lebih besar, scale > 1.
    final double scale = screenHeight / 844.0;

    // 3. Terapkan Nilai Manual Anda dengan Skala Responsif
    // Posisi ini akan terkunci secara proporsional di semua HP.
    final double headerCardTop = 170.0 * scale;
    final double menuSectionTop = 380.0 * scale;

    // Setup warna status
    final String statusText = _isOnline ? "Online" : "Offline";
    final Color statusCircleColor =
        _isOnline ? const Color(0xFF74FF46) : const Color(0xFFFF4646);
    final Color statusTextColor =
        _isOnline ? const Color(0xFF65D340) : const Color(0xFFD34040);

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: SizedBox.expand(
        child: Stack(
          children: [
            // ===========================
            // 1. BACKGROUND HEADER (GRADIENT)
            // ===========================
            ClipPath(
              clipper: HeaderCurveClipper(),
              child: Container(
                width: double.infinity,
                // Tinggi background juga diskalakan agar proporsional
                height: screenHeight * 0.45,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFAFAFA),
                      Color(0xFFFDE5E3),
                      Color(0xFFFDCBC9),
                    ],
                    stops: [0.31, 0.55, 1.0],
                  ),
                ),
              ),
            ),

            // ===========================
            // 2. PROFILE MENU SECTION (BAGIAN 2 - PUTIH)
            // ===========================
            Positioned(
              top: menuSectionTop, // Hasil: 380.0 * scale (Sesuai Request)
              left: 0,
              right: 0,
              bottom: 0,
              child: const ProfileMenuSection(),
            ),

            // ===========================
            // 3. PROFILE HEADER CARD (BAGIAN 1 - MERAH)
            // ===========================
            Positioned(
              top: headerCardTop, // Hasil: 170.0 * scale (Sesuai Request)
              left: 24,
              right: 24,
              child: const ProfileHeaderCard(),
            ),

            // ===========================
            // 4. TOP HEADER (LOGO & NOTIF)
            // ===========================
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: const Color(0xFFFAFAFA),
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/common/logo_smile_v2.png',
                          height: 58,
                          fit: BoxFit.contain,
                        ),
                        Row(
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/ic_notification.svg',
                                  width: 24,
                                  height: 24,
                                ),
                                Positioned(
                                  right: 1,
                                  top: 0,
                                  child: Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFF04241),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(width: 16),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 18,
                                    height: 18,
                                    decoration: BoxDecoration(
                                      color: statusCircleColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: const Color(0xFFDBDBDB),
                                        width: 2,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    statusText,
                                    style: TextStyle(
                                      color: statusTextColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // ===========================
            // 5. BOTTOM NAVIGATION BAR
            // ===========================
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomBottomNavBar(
                selectedIndex: 1,
                onItemTapped: (index) {
                  // Logic Navigasi
                },
                onScanTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Clipper Header
class HeaderCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 40,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

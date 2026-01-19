// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// // Import Navbar
// import 'package:mobile_smile_multifab/features/home/widgets/custom_bottom_navbar.dart';

// // Import Home Screen (Tidak digunakan untuk navigasi sementara, tapi tetap di-import jika needed)
// import 'package:mobile_smile_multifab/screens/home_screen.dart';

// import 'package:mobile_smile_multifab/features/profile/widgets/profile_card.dart'; // <--- Tambahkan Import ini

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   // Status online dummy (statis)
//   final bool _isOnline = true;

//   @override
//   Widget build(BuildContext context) {
//     // Setup warna status (sama seperti Home)
//     final String statusText = _isOnline ? "Online" : "Offline";
//     final Color statusCircleColor =
//         _isOnline ? const Color(0xFF74FF46) : const Color(0xFFFF4646);
//     final Color statusTextColor =
//         _isOnline ? const Color(0xFF65D340) : const Color(0xFFD34040);

//     return Scaffold(
//       backgroundColor: const Color(0xFFF3F4F6),
//       // Gunakan SizedBox.expand agar Stack memenuhi seluruh layar
//       body: SizedBox.expand(
//         child: Stack(
//           children: [
//             // ===========================
//             // 1. BACKGROUND HEADER (GRADIENT & CURVE)
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
//             // 2. MAIN CONTENT (BODY)
//             // ===========================
//             SingleChildScrollView(
//               padding: const EdgeInsets.only(top: 115, bottom: 125),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 20),
//                     // --- PLACEHOLDER KONTEN PROFILE ---

//                     const ProfileHeaderCard(),

//                     const SizedBox(height: 20),

//                     Container(
//                       width: double.infinity,
//                       height: 400, // Tinggi sementara visualisasi
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.05),
//                             blurRadius: 10,
//                             offset: const Offset(0, 4),
//                           ),
//                         ],
//                       ),
//                       child: Center(
//                         child: Text(
//                           "Konten Profile Disini",
//                           style: TextStyle(
//                             color: Colors.grey[400],
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             // ===========================
//             // 3. TOP HEADER (LOGO & NOTIFICATION)
//             // ===========================
//             Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                 color: const Color(0xFFFAFAFA), // Background status bar
//                 child: SafeArea(
//                   bottom: false,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 24.0, vertical: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         // LOGO
//                         Image.asset(
//                           'assets/images/common/logo_smile_v2.png',
//                           height: 58,
//                           fit: BoxFit.contain,
//                         ),

//                         // NOTIFICATION & STATUS
//                         Row(
//                           children: [
//                             // Notification Icon
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

//                             // Online Status
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
//             // 4. BOTTOM NAVIGATION BAR
//             // ===========================
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: CustomBottomNavBar(
//                 // Index 1 = Profile (Agar icon Profile menyala)
//                 selectedIndex: 1,

//                 onItemTapped: (index) {
//                   // ▼▼▼ LOGIKA NAVIGASI DINONAKTIFKAN SEMENTARA ▼▼▼
//                   if (index == 0) {
//                     debugPrint("Tombol Home ditekan (Navigasi Nonaktif)");
//                     // Logika pindah halaman di-comment agar tetap di Profile
//                     /*
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const HomeScreen()),
//                     );
//                     */
//                   }
//                   // ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
//                 },
//                 onScanTap: () {
//                   debugPrint("Scan Button Tapped on Profile");
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Class Clipper untuk Header Lengkung
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

// Import Home Screen (Untuk navigasi balik)
import 'package:mobile_smile_multifab/screens/home_screen.dart';

// Import Profile Card
import 'package:mobile_smile_multifab/features/profile/widgets/profile_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final bool _isOnline = true;

  @override
  Widget build(BuildContext context) {
    // Setup warna status
    final String statusText = _isOnline ? "Online" : "Offline";
    final Color statusCircleColor =
        _isOnline ? const Color(0xFF74FF46) : const Color(0xFFFF4646);
    final Color statusTextColor =
        _isOnline ? const Color(0xFF65D340) : const Color(0xFFD34040);

    // Konfigurasi Ukuran & Posisi
    // Anda bisa mengubah angka ini untuk mengatur jarak
    const double headerTopPosition = 200.0; // Jarak Card dari atas layar
    const double cardHeight = 115.0; // Tinggi Card
    // Padding untuk konten scroll di bawah (Jarak Card + Tinggi Card + Spasi)
    const double contentTopPadding = headerTopPosition + cardHeight + 20.0;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: SizedBox.expand(
        child: Stack(
          children: [
            // ===========================
            // 1. BACKGROUND HEADER (GRADIENT & CURVE)
            // ===========================
            // Posisi: Paling Belakang (Layer 0)
            ClipPath(
              clipper: HeaderCurveClipper(),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.45,
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
            // 2. SCROLLABLE CONTENT (BAGIAN BAWAH)
            // ===========================
            // Posisi: Layer 1 (Di bawah card header)
            // SingleChildScrollView(
            //   // Padding atas dibuat besar agar konten mulai DI BAWAH card statis
            //   padding: const EdgeInsets.only(
            //       top: contentTopPadding, bottom: 130, left: 24, right: 24),
            //   child: Column(
            //     children: [
            //       // --- PLACEHOLDER KONTEN BAWAH (NANTINYA BAGIAN 2) ---
            //       Container(
            //         width: double.infinity,
            //         height: 500, // Tinggi diperbesar untuk simulasi scroll
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.circular(20),
            //           boxShadow: [
            //             BoxShadow(
            //               color: Colors.black.withOpacity(0.05),
            //               blurRadius: 10,
            //               offset: const Offset(0, 4),
            //             ),
            //           ],
            //         ),
            //         child: Center(
            //           child: Text(
            //             "Area Scrollable (Bagian 2)\nCard di atas tetap diam.",
            //             textAlign: TextAlign.center,
            //             style: TextStyle(
            //               color: Colors.grey[400],
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            // ===========================
            // 3. PROFILE HEADER CARD (STATIS)
            // ===========================
            // Posisi: Layer 2 (Fixed Position)
            Positioned(
              top:
                  headerTopPosition, // Jarak dari atas (diatur di variabel atas)
              left: 24,
              right: 24,
              child: const ProfileHeaderCard(),
            ),

            // ===========================
            // 4. TOP HEADER (LOGO & NOTIFICATION)
            // ===========================
            // Posisi: Layer 3 (Paling Atas)
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
                        // LOGO
                        Image.asset(
                          'assets/images/common/logo_smile_v2.png',
                          height: 58,
                          fit: BoxFit.contain,
                        ),

                        // NOTIFICATION & STATUS
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
                  // Logika Navigasi Sementara Nonaktif
                  if (index == 0) {
                    // Navigator.pushReplacement(...)
                  }
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

// Class Clipper
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

// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:mobile_smile_multifab/features/home/widgets/custom_bottom_navbar.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {

//   bool _isOnline = true;
//   late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

//   final int testSpLevel = 3;
//   final bool testSyncIcon = true;

//   @override
//   void initState() {
//     super.initState();

//     _initConnectivity();

//     _connectivitySubscription = Connectivity()
//         .onConnectivityChanged
//         .listen((List<ConnectivityResult> results) {
//       _updateConnectionStatus(results);
//     });
//   }

//   @override
//   void dispose() {
//     _connectivitySubscription.cancel();
//     super.dispose();
//   }

//   Future<void> _initConnectivity() async {
//     late List<ConnectivityResult> results;
//     try {
//       results = await Connectivity().checkConnectivity();
//     } catch (e) {
//       return;
//     }
//     if (!mounted) return;
//     _updateConnectionStatus(results);
//   }

//   void _updateConnectionStatus(List<ConnectivityResult> results) {
//     if (results.contains(ConnectivityResult.none)) {
//       setState(() {
//         _isOnline = false;
//       });
//     } else {
//       setState(() {
//         _isOnline = true;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {

//     final String statusText = _isOnline ? "Online" : "Offline";

//     final Color statusCircleColor =
//         _isOnline ? const Color(0xFF74FF46) : const Color(0xFFFF4646);

//     final Color statusTextColor =
//         _isOnline ? const Color(0xFF65D340) : const Color(0xFFD34040);

//     return Scaffold(
//       backgroundColor: const Color(0xFFF3F4F6),
//       body: Stack(
//         children: [
//           ClipPath(
//             clipper: HeaderCurveClipper(),
//             child: Container(
//               width: double.infinity,
//               height: MediaQuery.of(context).size.height * 0.45,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Color(0xFFFAFAFA),
//                     Color(0xFFFDE5E3),
//                     Color(0xFFFDCBC9),
//                   ],
//                   stops: [0.31, 0.55, 1.0],
//                 ),
//               ),
//             ),
//           ),

//           SingleChildScrollView(
//             padding: const EdgeInsets.only(top: 115, bottom: 125),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 20),
//                   EmployeeCard(
//                     spLevel: testSpLevel,
//                     showSyncIcon: testSyncIcon,
//                   ),
//                   const SizedBox(height: 20),
//                   const BannerCarousel(),
//                   const SizedBox(height: 24),
//                   const HomeMenu(),
//                   const SizedBox(height: 24),
//                   const NewsSection(),
//                 ],
//               ),
//             ),
//           ),

//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               color: const Color(0xFFFAFAFA),
//               child: SafeArea(
//                 bottom: false,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 24.0, vertical: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Image.asset(
//                         'assets/images/common/logo_smile_v2.png',
//                         height: 58,
//                         fit: BoxFit.contain,
//                         errorBuilder: (context, error, stackTrace) {
//                           return const Text("Smile V2",
//                               style: TextStyle(
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.red));
//                         },
//                       ),

//                       Row(
//                         children: [
//                           Stack(
//                             clipBehavior: Clip.none,
//                             children: [
//                               SvgPicture.asset(
//                                 'assets/icons/ic_notification.svg',
//                                 width: 24,
//                                 height: 24,
//                               ),
//                               Positioned(
//                                 right: 1,
//                                 top: 0,
//                                 child: Container(
//                                   width: 10,
//                                   height: 10,
//                                   decoration: const BoxDecoration(
//                                     color: Color(0xFFF04241),
//                                     shape: BoxShape.circle,
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),

//                           const SizedBox(width: 16),

//                           Padding(
//                             padding: const EdgeInsets.only(top: 8.0),
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Container(
//                                   width: 18,
//                                   height: 18,
//                                   decoration: BoxDecoration(
//                                     color:
//                                         statusCircleColor,
//                                     shape: BoxShape.circle,
//                                     border: Border.all(
//                                       color: const Color(0xFFDBDBDB),
//                                       width: 2,
//                                     ),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.black.withOpacity(0.1),
//                                         blurRadius: 4,
//                                         offset: const Offset(0, 2),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 const SizedBox(height: 2),
//                                 Text(
//                                   statusText,
//                                   style: TextStyle(
//                                     color:
//                                         statusTextColor,
//                                     fontSize: 10,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           const Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: CustomBottomNavBar(),
//           ),
//         ],
//       ),
//     );
//   }
// }

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


import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// --- WIDGET HOME SEMENTARA DINONAKTIFKAN ---
// import 'package:mobile_smile_multifab/features/home/widgets/employee_card.dart';
// import 'package:mobile_smile_multifab/features/home/widgets/banner_carousel.dart';
// import 'package:mobile_smile_multifab/features/home/widgets/home_menu.dart';
// import 'package:mobile_smile_multifab/features/home/widgets/news_section.dart';

// Import Navbar (Tetap dibutuhkan untuk navigasi)
import 'package:mobile_smile_multifab/features/home/widgets/custom_bottom_navbar.dart';

// Import Halaman Profile untuk Navigasi
import 'package:mobile_smile_multifab/features/profile/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isOnline = true;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  // Variabel ini sementara tidak dipakai karena EmployeeCard dimatikan
  // final int testSpLevel = 3;
  // final bool testSyncIcon = true;

  @override
  void initState() {
    super.initState();
    _initConnectivity();
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      _updateConnectionStatus(results);
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> _initConnectivity() async {
    late List<ConnectivityResult> results;
    try {
      results = await Connectivity().checkConnectivity();
    } catch (e) {
      return;
    }
    if (!mounted) return;
    _updateConnectionStatus(results);
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    if (results.contains(ConnectivityResult.none)) {
      setState(() {
        _isOnline = false;
      });
    } else {
      setState(() {
        _isOnline = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final String statusText = _isOnline ? "Online" : "Offline";
    final Color statusCircleColor =
        _isOnline ? const Color(0xFF74FF46) : const Color(0xFFFF4646);
    final Color statusTextColor =
        _isOnline ? const Color(0xFF65D340) : const Color(0xFFD34040);

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: Stack(
        children: [
          // ===========================
          // 1. BACKGROUND HEADER (CURVE)
          // ===========================
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
          // 2. MAIN CONTENT (BODY - SEMENTARA KOSONG)
          // ===========================
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 115, bottom: 125),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  
                  // PLACEHOLDER TEXT
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Column(
                      children: [
                        Icon(Icons.construction, size: 40, color: Colors.grey),
                        SizedBox(height: 10),
                        Text(
                          "Home Widgets Disabled",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "(Focusing on Profile Feature)",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),

                  // WIDGETS DI BAWAH INI SEMENTARA DI-COMMENT
                  /*
                  const SizedBox(height: 20),
                  EmployeeCard(
                    spLevel: testSpLevel,
                    showSyncIcon: testSyncIcon,
                  ),
                  const SizedBox(height: 20),
                  const BannerCarousel(),
                  const SizedBox(height: 24),
                  const HomeMenu(),
                  const SizedBox(height: 24),
                  const NewsSection(),
                  */
                ],
              ),
            ),
          ),

          // ===========================
          // 3. HEADER (LOGO & NOTIF)
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
                        errorBuilder: (context, error, stackTrace) {
                          return const Text("Smile V2",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red));
                        },
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
          // 4. BOTTOM NAVIGATION BAR
          // ===========================
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavBar(
              selectedIndex: 0, // 0 = Home
              onItemTapped: (index) {
                if (index == 1) {
                  // Navigasi ke Profile Screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()),
                  );
                }
              },
              onScanTap: () {
                debugPrint("Scan Button Tapped");
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Class Clipper untuk Header Lengkung
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
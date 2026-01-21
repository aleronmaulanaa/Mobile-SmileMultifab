// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:mobile_smile_multifab/features/home/widgets/employee_card.dart';
// // import 'package:mobile_smile_multifab/features/home/widgets/banner_carousel.dart';
// // import 'package:mobile_smile_multifab/features/home/widgets/home_menu.dart';
// // import 'package:mobile_smile_multifab/features/home/widgets/news_section.dart';

// // HAPUS IMPORT NAVBAR KARENA SUDAH DI-HANDLE MAIN_WRAPPER
// // import 'package:mobile_smile_multifab/features/home/widgets/custom_bottom_navbar.dart';

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

//     // GANTI SCAFFOLD DENGAN SIZEDBOX.EXPAND AGAR MENGISI RUANG YANG TERSEDIA
//     return SizedBox.expand(
//       child: Stack(
//         children: [
//           // 1. HEADER CURVE BACKGROUND
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

//           // 2. KONTEN UTAMA (SCROLLABLE)
//           SingleChildScrollView(
//             // Padding bottom dikurangi jadi 30 karena Navbar sudah di luar body
//             padding: const EdgeInsets.only(top: 115, bottom: 30),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               // child: Column( // <-- nonaktifkan COLUMN SEMENTARA SUPAYA TIDAK ADA MASALAH
//               //   children: [
//               //     const SizedBox(height: 20),
//               //     EmployeeCard(
//               //       spLevel: testSpLevel,
//               //       showSyncIcon: testSyncIcon,
//               //     ),
//               //     const SizedBox(height: 20),
//               //     const BannerCarousel(),
//               //     const SizedBox(height: 24),
//               //     const HomeMenu(),
//               //     const SizedBox(height: 24),
//               //     const NewsSection(),
//               //   ],
//               // ),
//             ),
//           ),

//           // 3. HEADER ATAS (LOGO, NOTIF, STATUS)
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               // Background transparan/putih tipis jika diperlukan,
//               // atau biarkan stack menumpuk di atas gradient.
//               // Di sini saya biarkan sesuai kode asli tapi tanpa background color solid
//               // agar menyatu dengan gradient header curve jika di-scroll,
//               // TAPI kode asli pakai color: Color(0xFFFAFAFA), kita pertahankan.
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
//                                     color: statusCircleColor,
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
//                                     color: statusTextColor,
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

//           // HAPUS POSISI NAVBAR DI SINI
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

// 1. Import Shared Widget (Base Scaffold)
import 'package:mobile_smile_multifab/shared/widgets/base_background_scaffold.dart';

// Import Widgets Home
// import 'package:mobile_smile_multifab/features/home/widgets/employee_card.dart';
// import 'package:mobile_smile_multifab/features/home/widgets/banner_carousel.dart';
// import 'package:mobile_smile_multifab/features/home/widgets/home_menu.dart';
// import 'package:mobile_smile_multifab/features/home/widgets/news_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ==========================================
  // LOGIKA CONNECTIVITY
  // ==========================================
  bool _isOnline = true;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  // Data Dummy untuk testing
  final int testSpLevel = 3;
  final bool testSyncIcon = true;

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

  // ==========================================
  // UI BUILD
  // ==========================================
  @override
  Widget build(BuildContext context) {
    // Gunakan BaseBackgroundScaffold
    return BaseBackgroundScaffold(
      // Kirim status online untuk update indikator di header
      isOnline: _isOnline,

      // Konten Utama (Scrollable)
      // Konten ini akan otomatis berada di atas background tapi di bawah Header Logo
      child: SingleChildScrollView(
        // Padding Top 115: Memberi jarak agar konten mulai di bawah area header curve
        // Padding Bottom 30: Memberi jarak dari bawah agar tidak terlalu mepet
        padding: const EdgeInsets.only(top: 115, bottom: 30),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          // child: Column(
          //   children: [
          //     const SizedBox(height: 20),
          //     EmployeeCard(
          //       spLevel: testSpLevel,
          //       showSyncIcon: testSyncIcon,
          //     ),
          //     const SizedBox(height: 20),
          //     const BannerCarousel(),
          //     const SizedBox(height: 24),
          //     const HomeMenu(),
          //     const SizedBox(height: 24),
          //     const NewsSection(),
          //   ],
          // ),
        ),
      ),
    );
  }
}

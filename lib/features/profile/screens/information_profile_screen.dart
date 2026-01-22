// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class InformationProfileScreen extends StatefulWidget {
//   const InformationProfileScreen({super.key});

//   @override
//   State<InformationProfileScreen> createState() =>
//       _InformationProfileScreenState();
// }

// class _InformationProfileScreenState extends State<InformationProfileScreen> {
//   // ==========================================
//   // STATE KONEKSI (Untuk Foto Profile)
//   // ==========================================
//   bool _isOnline = true;
//   late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

//   // URL Foto Dummy
//   final String _photoUrl =
//       "https://scontent-cgk2-1.cdninstagram.com/v/t51.2885-19/583200018_18367273294084132_5580250522120237473_n.jpg?efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4xMDgwLmMyIn0&_nc_ht=scontent-cgk2-1.cdninstagram.com&_nc_cat=104&_nc_oc=Q6cZ2QFUHV5MIMHQpwgpukY2oKbL4xJSdljTuioWaEMmkbDlefuKfo3TT1WJutYLmDiDUYA&_nc_ohc=doa6If38FpoQ7kNvwGbQ-30&_nc_gid=IffLnhmnXQE7k1TC0oEEwA&edm=AP4sbd4BAAAA&ccb=7-5&oh=00_Afo-q0wEwJnbQeErrNBpjefyIJ0asVmsjQsMjIrcQc86ew&oe=69761B8F&_nc_sid=7a9f4b";

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
//     // Dimensi Header
//     const double headerHeight = 126.0;
//     const double stripHeight = 47.0;
//     const double profileSize = 73.0;
//     const double profileRadius = profileSize / 2;

//     // Total tinggi area fixed (Header + Strip)
//     const double totalFixedArea = headerHeight + stripHeight;

//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: const SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//         statusBarIconBrightness: Brightness.light, // Icon status bar putih
//         statusBarBrightness: Brightness.dark,
//       ),
//       child: Scaffold(
//         backgroundColor: const Color(0xFFF9FAFB), // Background Body
//         body: Stack(
//           children: [
//             // ===============================================
//             // LAYER 1: SCROLLABLE CONTENT (BODY)
//             // ===============================================
//             // Kita beri padding atas agar konten tidak tertutup header fixed
//             ListView(
//               padding: const EdgeInsets.only(top: totalFixedArea + 20),
//               physics: const BouncingScrollPhysics(),
//               children: [
//                 // TEMPAT UNTUK KONTEN UTAMA NANTINYA
//                 // (Dikosongkan dulu sesuai permintaan)
//                 const SizedBox(height: 500), // Dummy height agar bisa discroll
//               ],
//             ),

//             // ===============================================
//             // LAYER 2: FIXED HEADER COMPLEX
//             // ===============================================
//             Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               height: totalFixedArea + (profileRadius), // Extra space untuk shadow/overlap jika perlu
//               child: Stack(
//                 clipBehavior: Clip.none,
//                 children: [
//                   // A. BAGIAN MERAH (HEADER ATAS)
//                   Positioned(
//                     top: 0,
//                     left: 0,
//                     right: 0,
//                     height: headerHeight,
//                     child: Container(
//                       color: const Color(0xFF991B1C),
//                       padding: const EdgeInsets.symmetric(horizontal: 24),
//                       child: SafeArea(
//                         bottom: false,
//                         child: Column(
//                           children: [
//                             const SizedBox(height: 10), // Spasi dari status bar
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 // ICON BACK
//                                 GestureDetector(
//                                   onTap: () => Navigator.pop(context),
//                                   child: SvgPicture.asset(
//                                     'assets/icons/ic_arrow_left_white.svg',
//                                     width: 27,
//                                     height: 27,
//                                     colorFilter: const ColorFilter.mode(
//                                         Colors.white, BlendMode.srcIn),
//                                   ),
//                                 ),

//                                 const SizedBox(width: 15),

//                                 // TEXT INFORMATION PROFILE
//                                 const Text(
//                                   'Information Profile',
//                                   style: TextStyle(
//                                     fontFamily: 'Poppins',
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),

//                   // B. BAGIAN ABU-ABU (STRIP BAWAH)
//                   // Diletakkan tepat di bawah header merah
//                   Positioned(
//                     top: headerHeight,
//                     left: 0,
//                     right: 0,
//                     height: stripHeight,
//                     child: Container(
//                       color: const Color(0xFFF3F4F6), // Warna F3F4F6
//                       padding: const EdgeInsets.symmetric(horizontal: 24),
//                       alignment: Alignment.centerRight, // Text dikanan
//                       child: GestureDetector(
//                         onTap: () {
//                           // TODO: Implement Change Photo Logic
//                         },
//                         child: const Text(
//                           'Change photo',
//                           style: TextStyle(
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.w600, // Semibold
//                             fontSize: 13,
//                             color: Color(0xFF991B1C),
//                             decoration: TextDecoration.underline, // Garis bawah
//                             decorationColor: Color(0xFF991B1C),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),

//                   // C. FOTO PROFILE (OVERLAPPING)
//                   // Logika: Center foto ada di garis perbatasan (headerHeight)
//                   // Top = headerHeight - setengah ukuran foto
//                   Positioned(
//                     top: headerHeight - profileRadius,
//                     left: 24, // Sejajar dengan margin kiri (dibawah icon back)
//                     child: Container(
//                       width: profileSize,
//                       height: profileSize,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.grey, // Warna loading placeholder
//                         border: Border.all(
//                           color: const Color(0xFFF3F4F6), // Border biar nyatu sama strip bawah (opsional)
//                           width: 3.0, // Ketebalan border putih/abu
//                           strokeAlign: BorderSide.strokeAlignOutside,
//                         ),
//                       ),
//                       child: ClipOval(
//                         child: _buildProfileImage(_photoUrl),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Helper Build Image (Sama seperti Account/Profile Card)
//   Widget _buildProfileImage(String imageUrl) {
//     if (!_isOnline) {
//       return Image.asset(
//         'assets/images/common/default-user.jpg',
//         fit: BoxFit.cover,
//       );
//     }
//     final String cleanUrl = imageUrl.replaceAll(RegExp(r'(?<!:)/{2,}'), '/');
//     return Image.network(
//       cleanUrl,
//       fit: BoxFit.cover,
//       frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
//         if (wasSynchronouslyLoaded) return child;
//         return AnimatedOpacity(
//           opacity: frame == null ? 0 : 1,
//           duration: const Duration(milliseconds: 500),
//           curve: Curves.easeOut,
//           child: child,
//         );
//       },
//       errorBuilder: (context, error, stackTrace) {
//         return Image.asset(
//           'assets/images/common/default-user.jpg',
//           fit: BoxFit.cover,
//         );
//       },
//     );
//   }
// }

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InformationProfileScreen extends StatefulWidget {
  const InformationProfileScreen({super.key});

  @override
  State<InformationProfileScreen> createState() =>
      _InformationProfileScreenState();
}

class _InformationProfileScreenState extends State<InformationProfileScreen> {
  // ==========================================
  // STATE KONEKSI (Untuk Foto Profile)
  // ==========================================
  bool _isOnline = true;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  // URL Foto Dummy
  final String _photoUrl =
      "https://scontent-cgk2-1.cdninstagram.com/v/t51.2885-19/583200018_18367273294084132_5580250522120237473_n.jpg?efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4xMDgwLmMyIn0&_nc_ht=scontent-cgk2-1.cdninstagram.com&_nc_cat=104&_nc_oc=Q6cZ2QFUHV5MIMHQpwgpukY2oKbL4xJSdljTuioWaEMmkbDlefuKfo3TT1WJutYLmDiDUYA&_nc_ohc=doa6If38FpoQ7kNvwGbQ-30&_nc_gid=IffLnhmnXQE7k1TC0oEEwA&edm=AP4sbd4BAAAA&ccb=7-5&oh=00_Afo-q0wEwJnbQeErrNBpjefyIJ0asVmsjQsMjIrcQc86ew&oe=69761B8F&_nc_sid=7a9f4b";

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
    // ==========================================
    // PENGATURAN UKURAN (BAGIAN INI YANG DIUBAH)
    // ==========================================

    // REVISI 1: Header dipanjangin sedikit (126 -> 140)
    // Ubah angka ini jika masih kurang panjang atau kepanjangan
    const double headerHeight = 150.0;

    const double stripHeight = 47.0;

    // REVISI 2: Ukuran Profile benar-benar 73
    const double profileSize = 73.0;
    const double profileRadius = profileSize / 2;

    // Total tinggi area fixed (Header + Strip)
    const double totalFixedArea = headerHeight + stripHeight;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F4F6),
        body: Stack(
          children: [
            // ===============================================
            // LAYER 1: SCROLLABLE CONTENT (BODY)
            // ===============================================
            ListView(
              padding: const EdgeInsets.only(top: totalFixedArea + 20),
              physics: const BouncingScrollPhysics(),
              children: [
                // DUMMY CONTENT
                const SizedBox(height: 500),
              ],
            ),

            // ===============================================
            // LAYER 2: FIXED HEADER COMPLEX
            // ===============================================
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              // Height ditambah radius profile agar tidak terpotong (overflow visual)
              height: totalFixedArea + profileRadius,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // A. BAGIAN MERAH (HEADER ATAS)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: headerHeight,
                    child: Container(
                      color: const Color(0xFF991B1C),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SafeArea(
                        bottom: false,
                        child: Column(
                          children: [
                            const SizedBox(height: 20), // Spasi dari status bar

                            // REVISI 3: LOGIKA HEADER CENTER
                            // Menggunakan Stack agar Title benar-benar ditengah
                            // meskipun ada icon back di kiri.
                            SizedBox(
                              height: 40, // Tinggi area navbar
                              child: Stack(
                                alignment:
                                    Alignment.center, // Pusatkan isi stack
                                children: [
                                  // 1. Icon Back (Kiri)
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: SvgPicture.asset(
                                        'assets/icons/ic_arrow_left_white.svg',
                                        width: 27,
                                        height: 27,
                                        colorFilter: const ColorFilter.mode(
                                            Colors.white, BlendMode.srcIn),
                                      ),
                                    ),
                                  ),

                                  // 2. Judul (Tengah Absolute)
                                  const Text(
                                    'Information Profile',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // B. BAGIAN ABU-ABU (STRIP BAWAH)
                  Positioned(
                    top: headerHeight,
                    left: 0,
                    right: 0,
                    height: stripHeight,
                    child: Container(
                      color: const Color(0xFFF3F4F6),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          // TODO: Implement Change Photo Logic
                        },
                        child: const Text(
                          'Change photo',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: Color(0xFF991B1C),
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFF991B1C),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // C. FOTO PROFILE (OVERLAPPING)
                  // REVISI 4: Posisikan tepat dibawah tombol Back
                  Positioned(
                    top: headerHeight - profileRadius,
                    left: 24, // Margin kiri sama dengan icon back
                    child: Container(
                      width: profileSize, // W=73
                      height: profileSize, // H=73
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                        // REVISI 5: Border dihapus agar ukuran foto full 73x73
                        // Jika ingin ada border putih pemisah, uncomment dibawah:
                        /*
                        border: Border.all(
                          color: Color(0xFFF3F4F6), 
                          width: 3.0, 
                        ),
                        */
                      ),
                      child: ClipOval(
                        child: _buildProfileImage(_photoUrl),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage(String imageUrl) {
    if (!_isOnline) {
      return Image.asset(
        'assets/images/common/default-user.jpg',
        fit: BoxFit.cover,
      );
    }
    final String cleanUrl = imageUrl.replaceAll(RegExp(r'(?<!:)/{2,}'), '/');
    return Image.network(
      cleanUrl,
      fit: BoxFit.cover,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) return child;
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
          child: child,
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          'assets/images/common/default-user.jpg',
          fit: BoxFit.cover,
        );
      },
    );
  }
}

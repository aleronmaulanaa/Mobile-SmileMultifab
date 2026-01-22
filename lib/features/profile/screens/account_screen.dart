// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart'; // Import untuk Clipboard
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:mobile_smile_multifab/features/profile/widgets/account_info_card.dart';

// class AccountScreen extends StatelessWidget {
//   // Kita terima status online dari parent agar sinkron
//   // Jika tidak dipassing, defaultnya true (anggap online)
//   final bool isOnline;

//   const AccountScreen({
//     super.key,
//     this.isOnline = true,
//   });

//   // ==========================================
//   // LOGIKA COPY TEXT
//   // ==========================================
//   void _copyToClipboard(BuildContext context, String text) {
//     Clipboard.setData(ClipboardData(text: text));
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text("Berhasil menyalin: $text"),
//         duration: const Duration(seconds: 1),
//         behavior: SnackBarBehavior.floating,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // URL Dummy
//     final String photoUrl =
//         "https://scontent-cgk2-1.cdninstagram.com/v/t51.2885-19/583200018_18367273294084132_5580250522120237473_n.jpg?efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4xMDgwLmMyIn0&_nc_ht=scontent-cgk2-1.cdninstagram.com&_nc_cat=104&_nc_oc=Q6cZ2QFUHV5MIMHQpwgpukY2oKbL4xJSdljTuioWaEMmkbDlefuKfo3TT1WJutYLmDiDUYA&_nc_ohc=doa6If38FpoQ7kNvwGbQ-30&_nc_gid=IffLnhmnXQE7k1TC0oEEwA&edm=AP4sbd4BAAAA&ccb=7-5&oh=00_Afo-q0wEwJnbQeErrNBpjefyIJ0asVmsjQsMjIrcQc86ew&oe=69761B8F&_nc_sid=7a9f4b";

//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: const SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//         statusBarIconBrightness: Brightness.light,
//         statusBarBrightness: Brightness.dark,
//       ),
//       child: Scaffold(
//         backgroundColor: const Color(0xFFF9FAFB),
//         body: Column(
//           children: [
//             // ===========================
//             // 1. HEADER MERAH
//             // ===========================
//             Container(
//               width: double.infinity,
//               height: 126,
//               color: const Color(0xFF991B1C),
//               padding: const EdgeInsets.only(bottom: 17, left: 24, right: 24),
//               alignment: Alignment.bottomCenter,
//               child: Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: SvgPicture.asset(
//                       'assets/icons/ic_arrow_left_white.svg',
//                       width: 27,
//                       height: 27,
//                       colorFilter:
//                           const ColorFilter.mode(Colors.white, BlendMode.srcIn),
//                     ),
//                   ),
//                   Expanded(
//                     child: Text(
//                       'Your Profile',
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 27),
//                 ],
//               ),
//             ),

//             // ===========================
//             // 2. BODY SCROLLABLE
//             // ===========================
//             Expanded(
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 37),

//                     // --- CARD PROFILE UTAMA ---
//                     Container(
//                       width: 384,
//                       height: 249,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(21),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.25),
//                             offset: const Offset(0, 7),
//                             blurRadius: 7,
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           // Foto Profile
//                           Container(
//                             width: 78,
//                             height: 78,
//                             decoration: const BoxDecoration(
//                               shape: BoxShape.circle,
//                               // REVISI 3: Warna loading disamakan dengan profile_card
//                               color: Colors.grey,
//                             ),
//                             child: ClipOval(
//                               // REVISI 3: Menggunakan logic profile image yang canggih
//                               child: _buildProfileImage(photoUrl),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           const Text(
//                             'M. Richie Sugestiana.',
//                             style: TextStyle(
//                               fontFamily: 'Poppins',
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                               color: Colors.black,
//                             ),
//                           ),
//                           const SizedBox(height: 11),
//                           const Text(
//                             '83493',
//                             style: TextStyle(
//                               fontFamily: 'Poppins',
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                               color: Color(0xFFFA0007),
//                             ),
//                           ),
//                           const SizedBox(height: 9),
//                           const Text(
//                             'IT Network & Infrastruktur',
//                             style: TextStyle(
//                               fontFamily: 'Poppins',
//                               fontWeight: FontWeight.w600,
//                               fontSize: 14,
//                               color: Color(0xFF991B1C),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(height: 37),

//                     // --- JUDUL SECTION ---
//                     const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 24),
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           'Account Information',
//                           style: TextStyle(
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.w800,
//                             fontSize: 16,
//                             color: Color(0xFF991B1C),
//                           ),
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 21),

//                     // --- LIST INFORMASI ---

//                     // 1. NUMBER ID
//                     AccountInfoCard(
//                       iconPath: 'assets/icons/ic_card_id.svg',
//                       title: 'Number ID',
//                       value: '83493',
//                       showCopyIcon: true,
//                       // LOGIKA COPY:
//                       onCopyTap: () => _copyToClipboard(context, '83493'),
//                     ),

//                     // 2. FULL NAME (IC USER CUSTOM SIZE)
//                     const AccountInfoCard(
//                       iconPath: 'assets/icons/ic_user.svg',
//                       title: 'Full Name',
//                       value: 'M. Richie Sugestiana.',
//                       showCopyIcon: false,
//                       // REVISI 2: Ukuran Custom User W=23.18 H=26.67
//                       iconWidth: 23.18,
//                       iconHeight: 26.67,
//                     ),

//                     // 3. POSITION (IC BRIEFCASE CUSTOM SIZE)
//                     const AccountInfoCard(
//                       iconPath: 'assets/icons/ic_briefcase.svg',
//                       title: 'Position',
//                       value: 'IT Network & Infrastruktur',
//                       showCopyIcon: false,
//                       // REVISI 2: Ukuran Custom Briefcase W=40 H=40
//                       iconWidth: 40,
//                       iconHeight: 40,
//                     ),

//                     // 4. EMAIL
//                     AccountInfoCard(
//                       iconPath: 'assets/icons/ic_email.svg',
//                       title: 'Email',
//                       value: 'richie@multifab.co.id',
//                       showCopyIcon: true,
//                       // LOGIKA COPY:
//                       onCopyTap: () =>
//                           _copyToClipboard(context, 'richie@multifab.co.id'),
//                     ),

//                     const SizedBox(height: 50),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ==========================================
//   // REVISI 3: FUNGSI BUILD IMAGE SEPERTI PROFILE CARD
//   // ==========================================
//   Widget _buildProfileImage(String imageUrl) {
//     // 1. Jika Offline -> Pakai Asset Langsung
//     if (!isOnline) {
//       return Image.asset(
//         'assets/images/common/default-user.jpg',
//         fit: BoxFit.cover,
//       );
//     }

//     // 2. Jika Online -> Pakai Network Image dengan frameBuilder & AnimatedOpacity
//     final String cleanUrl = imageUrl.replaceAll(RegExp(r'(?<!:)/{2,}'), '/');

//     return Image.network(
//       cleanUrl,
//       fit: BoxFit.cover,
//       // Animasi transisi agar warna abu-abu (loading) terlihat sebelum gambar muncul
//       frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
//         if (wasSynchronouslyLoaded) return child;
//         return AnimatedOpacity(
//           opacity: frame == null ? 0 : 1,
//           duration: const Duration(milliseconds: 500),
//           curve: Curves.easeOut,
//           child: child,
//         );
//       },
//       // Error Builder: Jika gagal load, tampilkan default user
//       errorBuilder: (context, error, stackTrace) {
//         return Image.asset(
//           'assets/images/common/default-user.jpg',
//           fit: BoxFit.cover,
//         );
//       },
//     );
//   }
// }

import 'dart:async'; // Tambahan untuk StreamSubscription
import 'package:connectivity_plus/connectivity_plus.dart'; // Tambahan Connectivity
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_smile_multifab/features/profile/widgets/account_info_card.dart';

// UBAH JADI STATEFUL WIDGET AGAR BISA UPDATE REALTIME
class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  // ==========================================
  // STATE MANAGEMENT KONEKSI
  // ==========================================
  bool _isOnline = true; // Default true, akan diupdate saat init
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _initConnectivity();
    // Mendengarkan perubahan koneksi secara realtime
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
  // LOGIKA COPY TEXT
  // ==========================================
  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Berhasil menyalin: $text"),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String photoUrl =
        "https://scontent-cgk2-1.cdninstagram.com/v/t51.2885-19/583200018_18367273294084132_5580250522120237473_n.jpg?efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4xMDgwLmMyIn0&_nc_ht=scontent-cgk2-1.cdninstagram.com&_nc_cat=104&_nc_oc=Q6cZ2QFUHV5MIMHQpwgpukY2oKbL4xJSdljTuioWaEMmkbDlefuKfo3TT1WJutYLmDiDUYA&_nc_ohc=doa6If38FpoQ7kNvwGbQ-30&_nc_gid=IffLnhmnXQE7k1TC0oEEwA&edm=AP4sbd4BAAAA&ccb=7-5&oh=00_Afo-q0wEwJnbQeErrNBpjefyIJ0asVmsjQsMjIrcQc86ew&oe=69761B8F&_nc_sid=7a9f4b";

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        body: Column(
          children: [
            // HEADER MERAH
            Container(
              width: double.infinity,
              height: 126,
              color: const Color(0xFF991B1C),
              padding: const EdgeInsets.only(bottom: 17, left: 24, right: 24),
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(
                      'assets/icons/ic_arrow_left_white.svg',
                      width: 27,
                      height: 27,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Your Profile',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 27),
                ],
              ),
            ),

            // BODY SCROLLABLE
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 37),

                    // CARD PROFILE UTAMA
                    Container(
                      width: 384,
                      height: 249,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(21),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: const Offset(0, 7),
                            blurRadius: 7,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Foto Profile
                          Container(
                            width: 78,
                            height: 78,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: ClipOval(
                              // Memanggil fungsi build image
                              child: _buildProfileImage(photoUrl),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'M. Richie Sugestiana.',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 11),
                          const Text(
                            '83493',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xFFFA0007),
                            ),
                          ),
                          const SizedBox(height: 9),
                          const Text(
                            'IT Network & Infrastruktur',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xFF991B1C),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 37),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Account Information',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: Color(0xFF991B1C),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 21),

                    // LIST INFORMASI
                    AccountInfoCard(
                      iconPath: 'assets/icons/ic_card_id.svg',
                      title: 'Number ID',
                      value: '83493',
                      showCopyIcon: true,
                      onCopyTap: () => _copyToClipboard(context, '83493'),
                    ),

                    // FULL NAME (Custom Size 23.18 x 26.67)
                    const AccountInfoCard(
                      iconPath: 'assets/icons/ic_user.svg',
                      title: 'Full Name',
                      value: 'M. Richie Sugestiana.',
                      showCopyIcon: false,
                      iconWidth: 26.08,
                      iconHeight: 30,
                    ),

                    // POSITION (Custom Size 40 x 40)
                    // Disini icon akan terlihat besar karena kita sudah memperbaiki Card-nya
                    const AccountInfoCard(
                      iconPath: 'assets/icons/ic_briefcase.svg',
                      title: 'Position',
                      value: 'IT Network & Infrastruktur',
                      showCopyIcon: false,
                      iconWidth: 35,
                      iconHeight: 35,
                    ),

                    AccountInfoCard(
                      iconPath: 'assets/icons/ic_email.svg',
                      title: 'Email',
                      value: 'richie@multifab.co.id',
                      showCopyIcon: true,
                      onCopyTap: () =>
                          _copyToClipboard(context, 'richie@multifab.co.id'),
                    ),

                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================
  // LOGIKA IMAGE (Sama persis dengan Profile Card)
  // ==========================================
  Widget _buildProfileImage(String imageUrl) {
    // 1. Jika Offline (State _isOnline false) -> Pakai Asset Default
    if (!_isOnline) {
      return Image.asset(
        'assets/images/common/default-user.jpg',
        fit: BoxFit.cover,
      );
    }

    // 2. Jika Online -> Pakai Network Image dengan Animasi
    final String cleanUrl = imageUrl.replaceAll(RegExp(r'(?<!:)/{2,}'), '/');

    return Image.network(
      cleanUrl,
      fit: BoxFit.cover,
      // FrameBuilder untuk animasi transisi
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) return child;
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
          child: child,
        );
      },
      // ErrorBuilder untuk handling jika URL gagal load
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          'assets/images/common/default-user.jpg',
          fit: BoxFit.cover,
        );
      },
    );
  }
}

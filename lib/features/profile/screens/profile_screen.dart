// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';

// // Import Shared Widget
// import 'package:mobile_smile_multifab/shared/widgets/base_background_scaffold.dart';

// // Import Widgets Profile
// import 'package:mobile_smile_multifab/features/profile/widgets/profile_card.dart';
// import 'package:mobile_smile_multifab/features/profile/widgets/profile_menu_section.dart';
// import 'package:mobile_smile_multifab/features/profile/widgets/change_password_section.dart';
// import 'package:mobile_smile_multifab/features/profile/widgets/qr_code_bottom_sheet.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   // ==========================================
//   // LOGIKA CONNECTIVITY
//   // ==========================================
//   bool _isOnline = true;
//   late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

//   // Overlay Change Password
//   bool _showChangePassword = false;

//   // URL Dummy
//   final String _profileImageUrl =
//       "https://scontent-cgk2-1.cdninstagram.com/v/t51.2885-19/583200018_18367273294084132_5580250522120237473_n.jpg?efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4xMDgwLmMyIn0&_nc_ht=scontent-cgk2-1.cdninstagram.com&_nc_cat=104&_nc_oc=Q6cZ2QH_StjD6RoNLsmif92M8IDCvWDL1NbIIu5u_1LkwLeqRqAhSsvB5EPUysGa4FWJEAY&_nc_ohc=BFSq9vY9zXYQ7kNvwG9LaaB&_nc_gid=7uOW328noKvLAHfgky-zLg&edm=ALGbJPMBAAAA&ccb=7-5&oh=00_AfrLLe2DYfmI4M2SEVGnYPMO227KLgww5m2x3Fatv2gmzw&oe=697CB30F&_nc_sid=7d3ac5";

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

//   // ==========================================
//   // FUNGSI MEMUNCULKAN QR CODE
//   // ==========================================
//   void _showQrCodeModal() {
//     showGeneralDialog(
//       context: context,
//       barrierDismissible: true,
//       barrierLabel: 'Close',
//       barrierColor: Colors.black.withOpacity(0.35),
//       transitionDuration: const Duration(milliseconds: 600),
//       transitionBuilder: (context, animation, secondaryAnimation, child) {
//         final curvedAnimation = CurvedAnimation(
//           parent: animation,
//           curve: Curves.easeOutQuart,
//           reverseCurve: Curves.easeInQuart,
//         );

//         return SlideTransition(
//           position: Tween<Offset>(
//             begin: const Offset(0, 1),
//             end: Offset.zero,
//           ).animate(curvedAnimation),
//           child: child,
//         );
//       },
//       pageBuilder: (context, animation, secondaryAnimation) {
//         return const QrCodeBottomSheet();
//       },
//     );
//   }

//   // ==========================================
//   // FUNGSI KEMBALI DAN SUKSES
//   // ==========================================
//   void _goToMenu() {
//     setState(() {
//       _showChangePassword = false;
//     });
//   }

//   void _goToSuccess() {
//     setState(() {
//       _showChangePassword = false;
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Password berhasil diubah!')),
//     );
//   }

//   // ==========================================
//   // UI BUILD
//   // ==========================================
//   @override
//   Widget build(BuildContext context) {
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double scale = screenHeight / 844.0;

//     final double headerCardTop = 170.0 * scale;
//     final double menuSectionTop = 380.0 * scale;

//     // return BaseBackgroundScaffold(
//     //   isOnline: _isOnline,
//     //   child: Stack(
//     //     clipBehavior: Clip.none,
//     //     children: [
//     //       // ===== MENU UTAMA =====
//     //       // Positioned(
//     //       //   top: menuSectionTop,
//     //       //   left: 0,
//     //       //   right: 0,
//     //       //   bottom: -100,
//     //       //   child: ProfileMenuSection(
//     //       //     onChangePassword: () {
//     //       //       setState(() {
//     //       //         _showChangePassword = true;
//     //       //       });
//     //       //     },
//     //       //   ),
//     //       // ),

//     //       // ===== CHANGE PASSWORD OVERLAY =====
//     //       if (_showChangePassword)
//     //         // Positioned.fill(
//     //         //   child: ChangePasswordSection(
//     //         //     onBack: () {
//     //         //       setState(() {
//     //         //         _showChangePassword = false;
//     //         //       });
//     //         //     },
//     //         //     onSuccess: () {
//     //         //       setState(() {
//     //         //         _showChangePassword = false;
//     //         //       });
//     //         //     },
//     //         //   ),
//     //         // ),
//     //         Positioned(
//     //           bottom: 0,
//     //           left: 0,
//     //           right: 0,
//     //           child: ChangePasswordSection(
//     //             height: MediaQuery.of(context).size.height * 0.7, // 70% layar
//     //             onBack: _goToMenu,
//     //             onSuccess: _goToSuccess,
//     //           ),
//     //         ),

//     //       // ===== HEADER CARD =====
//     //       Positioned(
//     //         top: headerCardTop,
//     //         left: 24,
//     //         right: 24,
//     //         child: ProfileHeaderCard(
//     //           isOnline: _isOnline,
//     //           imageUrl: _profileImageUrl,
//     //           onQrTap: _showQrCodeModal,
//     //         ),
//     //       ),
//     //     ],
//     //   ),
//     // );

//     return BaseBackgroundScaffold(
//       isOnline: _isOnline,
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           // ===== MENU UTAMA =====
//           Positioned(
//             top: menuSectionTop,
//             left: 0,
//             right: 0,
//             bottom: -100,
//             child: ProfileMenuSection(
//               onChangePassword: () {
//                 setState(() {
//                   _showChangePassword = true;
//                 });
//               },
//             ),
//           ),

//           // ===== HEADER CARD =====
//           Positioned(
//             top: headerCardTop,
//             left: 24,
//             right: 24,
//             child: ProfileHeaderCard(
//               isOnline: _isOnline,
//               imageUrl: _profileImageUrl,
//               onQrTap: _showQrCodeModal,
//             ),
//           ),

//           // ===== CHANGE PASSWORD OVERLAY =====
//           if (_showChangePassword)
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: ChangePasswordSection(
//                 height: MediaQuery.of(context).size.height * 0.423,
//                 onBack: _goToMenu,
//                 onSuccess: _goToSuccess,
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';

// // Import Shared Widget
// import 'package:mobile_smile_multifab/shared/widgets/base_background_scaffold.dart';

// // Import Widgets Profile
// import 'package:mobile_smile_multifab/features/profile/widgets/profile_card.dart';
// import 'package:mobile_smile_multifab/features/profile/widgets/profile_menu_section.dart';
// import 'package:mobile_smile_multifab/features/profile/widgets/change_password_section.dart';
// import 'package:mobile_smile_multifab/features/profile/widgets/success_notification_card.dart'; // Pastikan import ini ada
// import 'package:mobile_smile_multifab/features/profile/widgets/qr_code_bottom_sheet.dart';

// // Enum untuk melacak status tampilan (Menu -> Password -> Success)
// enum ProfileView { menu, password, success }

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   // ==========================================
//   // LOGIKA CONNECTIVITY
//   // ==========================================
//   bool _isOnline = true;
//   late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

//   // State untuk Mengatur View (Menu / Password / Success)
//   ProfileView _currentView = ProfileView.menu;

//   // URL Dummy
//   final String _profileImageUrl =
//       "https://scontent-cgk2-1.cdninstagram.com/v/t51.2885-19/583200018_18367273294084132_5580250522120237473_n.jpg?efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4xMDgwLmMyIn0&_nc_ht=scontent-cgk2-1.cdninstagram.com&_nc_cat=104&_nc_oc=Q6cZ2QH_StjD6RoNLsmif92M8IDCvWDL1NbIIu5u_1LkwLeqRqAhSsvB5EPUysGa4FWJEAY&_nc_ohc=BFSq9vY9zXYQ7kNvwG9LaaB&_nc_gid=7uOW328noKvLAHfgky-zLg&edm=ALGbJPMBAAAA&ccb=7-5&oh=00_AfrLLe2DYfmI4M2SEVGnYPMO227KLgww5m2x3Fatv2gmzw&oe=697CB30F&_nc_sid=7d3ac5";

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

//   // ==========================================
//   // FUNGSI TRANSISI HALAMAN (LOGIKA LAMA DIKEMBALIKAN)
//   // ==========================================

//   // 1. Kembali ke Menu Utama
//   void _goToMenu() {
//     setState(() {
//       _currentView = ProfileView.menu;
//     });
//     // Menutup keyboard jika masih terbuka
//     FocusManager.instance.primaryFocus?.unfocus();
//   }

//   // 2. Masuk ke Mode Ganti Password
//   void _goToPassword() {
//     setState(() {
//       _currentView = ProfileView.password;
//     });
//   }

//   // 3. Masuk ke Mode Sukses + Timer Kembali ke Menu
//   void _goToSuccess() {
//     setState(() {
//       _currentView = ProfileView.success;
//     });

//     // Timer 4 Detik lalu otomatis kembali ke Menu
//     Timer(const Duration(seconds: 4), () {
//       if (mounted) {
//         _goToMenu();
//       }
//     });
//   }

//   // ==========================================
//   // FUNGSI MEMUNCULKAN QR CODE
//   // ==========================================
//   void _showQrCodeModal() {
//     showGeneralDialog(
//       context: context,
//       barrierDismissible: true,
//       barrierLabel: 'Close',
//       barrierColor: Colors.black.withOpacity(0.35),
//       transitionDuration: const Duration(milliseconds: 600),
//       transitionBuilder: (context, animation, secondaryAnimation, child) {
//         final curvedAnimation = CurvedAnimation(
//           parent: animation,
//           curve: Curves.easeOutQuart,
//           reverseCurve: Curves.easeInQuart,
//         );

//         return SlideTransition(
//           position: Tween<Offset>(
//             begin: const Offset(0, 1),
//             end: Offset.zero,
//           ).animate(curvedAnimation),
//           child: child,
//         );
//       },
//       pageBuilder: (context, animation, secondaryAnimation) {
//         return const QrCodeBottomSheet();
//       },
//     );
//   }

//   // ==========================================
//   // UI BUILD
//   // ==========================================
//   @override
//   Widget build(BuildContext context) {
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double scale = screenHeight / 844.0;

//     final double headerCardTop = 170.0 * scale;
//     final double menuSectionTop = 380.0 * scale;

//     return BaseBackgroundScaffold(
//       isOnline: _isOnline,
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           // ==============================
//           // LAYER 1: MENU UTAMA (STATIS)
//           // ==============================
//           Positioned(
//             top: menuSectionTop,
//             left: 0,
//             right: 0,
//             bottom: -100, // Memberikan ruang lebih ke bawah
//             child: ProfileMenuSection(
//               onChangePassword: _goToPassword, // Trigger perubahan state
//             ),
//           ),

//           // ==============================
//           // LAYER 2: HEADER CARD (STATIS)
//           // ==============================
//           Positioned(
//             top: headerCardTop,
//             left: 24,
//             right: 24,
//             child: ProfileHeaderCard(
//               isOnline: _isOnline,
//               imageUrl: _profileImageUrl,
//               onQrTap: _showQrCodeModal,
//             ),
//           ),

//           // ==============================
//           // LAYER 3: CHANGE PASSWORD FORM
//           // ==============================
//           // Menggunakan AnimatedSlide agar mulus seperti kode lama
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             // Penting: Height disesuaikan agar menutupi navbar
//             height: MediaQuery.of(context).viewInsets.bottom > 0
//                 ? double.infinity // Jika keyboard aktif, full screen
//                 : screenHeight *
//                     0.5, // Sedikit lebih tinggi dari 0.423 untuk cover touchArea

//             child: IgnorePointer(
//               // Hanya bisa disentuh jika status adalah Password
//               ignoring: _currentView != ProfileView.password,
//               child: AnimatedSlide(
//                 offset: _currentView == ProfileView.menu
//                     ? const Offset(0, 1) // Turun ke bawah jika Menu
//                     : const Offset(
//                         0, 0), // Naik ke posisi jika Password/Success
//                 duration: const Duration(milliseconds: 600),
//                 curve: Curves.easeInOutQuart,
//                 child: ChangePasswordSection(
//                   // Override height logic di dalam widget jika perlu,
//                   // tapi height dari Positioned di atas sudah menghandle layout luar.
//                   height: double.infinity,
//                   onBack: _goToMenu,
//                   onSuccess: _goToSuccess,
//                 ),
//               ),
//             ),
//           ),

//           // ==============================
//           // LAYER 4: SUCCESS NOTIFICATION
//           // ==============================
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             height: screenHeight * 0.5, // Samakan tinggi dengan form password
//             child: IgnorePointer(
//               ignoring: _currentView != ProfileView.success,
//               child: AnimatedSlide(
//                 // Logic: Jika Success -> Posisi 0. Jika Menu/Password -> Geser Kanan/Bawah
//                 offset: _currentView == ProfileView.success
//                     ? Offset.zero
//                     : const Offset(1.0, 0.0), // Geser ke kanan saat tidak aktif
//                 duration: const Duration(milliseconds: 600),
//                 curve: Curves.easeInOutQuart,
//                 child: const SuccessNotificationCard(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'package:mobile_smile_multifab/shared/widgets/base_background_scaffold.dart';
import 'package:mobile_smile_multifab/features/profile/widgets/profile_card.dart';
import 'package:mobile_smile_multifab/features/profile/widgets/profile_menu_section.dart';
import 'package:mobile_smile_multifab/features/profile/widgets/change_password_section.dart';
import 'package:mobile_smile_multifab/features/profile/widgets/success_notification_card.dart';
import 'package:mobile_smile_multifab/features/profile/widgets/qr_code_bottom_sheet.dart';

enum ProfileView { menu, password, success }

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // ... (Bagian Logic Connectivity dan InitState SAMA SEPERTI SEBELUMNYA, tidak perlu diubah) ...

  bool _isOnline = true;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  ProfileView _currentView = ProfileView.menu;
  final String _profileImageUrl =
      "https://scontent-cgk2-1.cdninstagram.com/v/t51.2885-19/583200018_18367273294084132_5580250522120237473_n.jpg?efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4xMDgwLmMyIn0&_nc_ht=scontent-cgk2-1.cdninstagram.com&_nc_cat=104&_nc_oc=Q6cZ2QH_StjD6RoNLsmif92M8IDCvWDL1NbIIu5u_1LkwLeqRqAhSsvB5EPUysGa4FWJEAY&_nc_ohc=BFSq9vY9zXYQ7kNvwG9LaaB&_nc_gid=7uOW328noKvLAHfgky-zLg&edm=ALGbJPMBAAAA&ccb=7-5&oh=00_AfrLLe2DYfmI4M2SEVGnYPMO227KLgww5m2x3Fatv2gmzw&oe=697CB30F&_nc_sid=7d3ac5";

  @override
  void initState() {
    super.initState();
    _initConnectivity();
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> _initConnectivity() async {
    // ... (SAMA SEPERTI SEBELUMNYA) ...
    try {
      final result = await Connectivity().checkConnectivity();
      _updateConnectionStatus(result);
    } catch (_) {}
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    setState(() => _isOnline = !results.contains(ConnectivityResult.none));
  }

  // --- LOGIKA NAVIGASI ---

  void _goToMenu() {
    setState(() => _currentView = ProfileView.menu);
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void _goToPassword() {
    setState(() => _currentView = ProfileView.password);
  }

  void _goToSuccess() {
    setState(() => _currentView = ProfileView.success);
    // Timer 4 detik kembali ke menu
    Timer(const Duration(seconds: 4), () {
      if (mounted) _goToMenu();
    });
  }

  void _showQrCodeModal() {
    // ... (SAMA SEPERTI SEBELUMNYA) ...
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Close',
      barrierColor: Colors.black.withOpacity(0.35),
      transitionDuration: const Duration(milliseconds: 600),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
              .animate(CurvedAnimation(
                  parent: animation, curve: Curves.easeOutQuart)),
          child: child,
        );
      },
      pageBuilder: (_, __, ___) => const QrCodeBottomSheet(),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   final double screenHeight = MediaQuery.of(context).size.height;
  //   final double scale = screenHeight / 844.0;
  //   final double headerCardTop = 170.0 * scale;
  //   final double menuSectionTop = 380.0 * scale;

  //   // Deteksi Keyboard untuk mengatur tinggi card password
  //   final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

  //   return BaseBackgroundScaffold(
  //     isOnline: _isOnline,
  //     // Gunakan ClipRect agar widget yang digeser keluar layar benar-benar terpotong (hilang)
  //     child: ClipRect(
  //       child: Stack(
  //         clipBehavior: Clip.none,
  //         children: [
  //           // ==============================
  //           // LAYER 1: MENU UTAMA
  //           // ==============================
  //           Positioned(
  //             top: menuSectionTop,
  //             left: 0,
  //             right: 0,
  //             bottom: -100,
  //             child: ProfileMenuSection(
  //               onChangePassword: _goToPassword,
  //             ),
  //           ),

  //           // ==============================
  //           // LAYER 2: HEADER CARD
  //           // ==============================
  //           Positioned(
  //             top: headerCardTop,
  //             left: 24,
  //             right: 24,
  //             child: ProfileHeaderCard(
  //               isOnline: _isOnline,
  //               imageUrl: _profileImageUrl,
  //               onQrTap: _showQrCodeModal,
  //             ),
  //           ),

  //           // ==============================
  //           // LAYER 3: CHANGE PASSWORD FORM (REVISI DISINI)
  //           // ==============================
  //           Positioned(
  //             bottom: 0,
  //             left: 0,
  //             right: 0,
  //             // Tinggi menyesuaikan keyboard: Full jika keyboard buka, 50% jika tutup
  //             height: isKeyboardOpen ? double.infinity : screenHeight * 0.5,

  //             child: IgnorePointer(
  //               // Hanya bisa diklik jika view == password
  //               ignoring: _currentView != ProfileView.password,
  //               child: AnimatedSlide(
  //                 // REVISI LOGIKA OFFSET:
  //                 // Jika Menu: Lempar ke KANAN (1.0, 0.0) -> Hilang Total
  //                 // Jika Password / Success: Di TENGAH (0.0, 0.0) -> Muncul
  //                 offset: _currentView == ProfileView.menu
  //                     ? const Offset(1.0, 0.0)
  //                     : Offset.zero,

  //                 duration: const Duration(milliseconds: 600),
  //                 curve: Curves.easeInOutQuart,
  //                 child: ChangePasswordSection(
  //                   height: double.infinity, // Mengikuti tinggi Positioned
  //                   onBack: _goToMenu,
  //                   onSuccess: _goToSuccess,
  //                 ),
  //               ),
  //             ),
  //           ),

  //           // ==============================
  //           // LAYER 4: SUCCESS NOTIFICATION
  //           // ==============================
  //           Positioned(
  //             bottom: 0,
  //             left: 0,
  //             right: 0,
  //             height: screenHeight * 0.5,
  //             child: IgnorePointer(
  //               ignoring: _currentView != ProfileView.success,
  //               child: AnimatedSlide(
  //                 // Logika: Hanya muncul (0,0) jika status Success.
  //                 // Selain itu lempar ke KANAN (1.0, 0.0).
  //                 offset: _currentView == ProfileView.success
  //                     ? Offset.zero
  //                     : const Offset(1.0, 0.0),

  //                 duration: const Duration(milliseconds: 600),
  //                 curve: Curves.easeInOutQuart,
  //                 child: const SuccessNotificationCard(),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double scale = screenHeight / 844.0;
    final double headerCardTop = 170.0 * scale;
    final double menuSectionTop = 380.0 * scale;

    // Deteksi Keyboard
    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    // Jarak untuk menutupi area transparan navbar (120 - 78 = 42, kita bulatkan 45 aman)
    final double bottomNavbarGap = 45.0;

    return BaseBackgroundScaffold(
      isOnline: _isOnline,
      // ❌ HAPUS ClipRect DI SINI.
      // ClipRect memotong bagian card yang kita geser ke bawah (-bottomNavbarGap),
      // sehingga gap putih tetap terlihat. Kita butuh Clip.none dari Stack.
      child: Stack(
        clipBehavior: Clip.none, // ✅ Pastikan ini tetap ada
        children: [
          // ==============================
          // LAYER 1: MENU UTAMA
          // ==============================
          Positioned(
            top: menuSectionTop,
            left: 0,
            right: 0,
            // Card ini memanjang -100px ke bawah.
            // Tanpa ClipRect, ini akan menutupi gap di atas navbar merah.
            bottom: -100,
            child: ProfileMenuSection(
              onChangePassword: _goToPassword,
            ),
          ),

          // ==============================
          // LAYER 2: HEADER CARD
          // ==============================
          Positioned(
            top: headerCardTop,
            left: 24,
            right: 24,
            child: ProfileHeaderCard(
              isOnline: _isOnline,
              imageUrl: _profileImageUrl,
              onQrTap: _showQrCodeModal,
            ),
          ),

          // ==============================
          // LAYER 3: CHANGE PASSWORD FORM
          // ==============================
          Positioned(
            // Jika keyboard tutup, tarik ke bawah (-45) biar nempel bar merah
            bottom: isKeyboardOpen ? 0 : -bottomNavbarGap,
            left: 0,
            right: 0,
            // Tambah tinggi card agar konten atas tidak ikut turun drastis
            height: isKeyboardOpen
                ? double.infinity
                : (screenHeight * 0.423) + bottomNavbarGap,

            child: IgnorePointer(
              ignoring: _currentView != ProfileView.password,
              child: AnimatedSlide(
                // Logika Slide:
                // Menu (Geser Kanan) -> Password (Tengah)
                offset: _currentView == ProfileView.menu
                    ? const Offset(1.0, 0.0)
                    : Offset.zero,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOutQuart,
                child: ChangePasswordSection(
                  height: double.infinity,
                  onBack: _goToMenu,
                  onSuccess: _goToSuccess,
                ),
              ),
            ),
          ),

          // ==============================
          // LAYER 4: SUCCESS NOTIFICATION
          // ==============================
          Positioned(
            bottom: isKeyboardOpen ? 0 : -bottomNavbarGap,
            left: 0,
            right: 0,
            height: (screenHeight * 0.423) + bottomNavbarGap,
            child: IgnorePointer(
              ignoring: _currentView != ProfileView.success,
              child: AnimatedSlide(
                offset: _currentView == ProfileView.success
                    ? Offset.zero
                    : const Offset(1.0, 0.0),
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOutQuart,
                child: const SuccessNotificationCard(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

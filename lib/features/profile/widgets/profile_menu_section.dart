// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:mobile_smile_multifab/features/profile/screens/account_screen.dart';
// import 'package:mobile_smile_multifab/features/profile/screens/information_profile_screen.dart';

// class ProfileMenuSection extends StatelessWidget {
//   const ProfileMenuSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MediaQuery(
//       data: MediaQuery.of(context)
//           .copyWith(textScaler: const TextScaler.linear(1.0)),
//       child: Container(
//         width: double.infinity,
//         // Tetap menggunakan double.infinity agar background putih memanjang ke bawah
//         height: double.infinity,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(40),
//             topRight: Radius.circular(40),
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.25),
//               offset: const Offset(0, -3),
//               blurRadius: 4,
//             ),
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(40),
//             topRight: Radius.circular(40),
//           ),
//           // PERUBAHAN DISINI:
//           // 1. SingleChildScrollView dihapus.
//           // 2. Diganti dengan Padding untuk memberi jarak tepi.
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Jarak agar konten tidak tertutup card merah
//                 const SizedBox(height: 35),

//                 // =========================
//                 // SECTION: ACCOUNT
//                 // =========================
//                 const Text(
//                   'Account',
//                   style: TextStyle(
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w600,
//                     fontSize: 14,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 12),

//                 _buildMenuButton(
//                   iconPath: 'assets/images/profile/account.png',
//                   label: 'Account',
//                   iconSize: 32,
//                   onTap: () {
//                     Navigator.of(context).push(
//                       PageRouteBuilder(
//                         pageBuilder: (context, animation, secondaryAnimation) =>
//                             const AccountScreen(),
//                         transitionsBuilder:
//                             (context, animation, secondaryAnimation, child) {
//                           // Animasi Slide dari Kanan ke Kiri
//                           const begin = Offset(1.0, 0.0);
//                           const end = Offset.zero;
//                           const curve = Curves.easeOut;

//                           var tween = Tween(begin: begin, end: end)
//                               .chain(CurveTween(curve: curve));

//                           return SlideTransition(
//                             position: animation.drive(tween),
//                             child: child,
//                           );
//                         },
//                       ),
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 12),

//                 _buildMenuButton(
//                   iconPath: 'assets/images/profile/informasi_profile.png',
//                   label: 'Information Profile',
//                   iconSize: 24,
//                   onTap: () {
//                     Navigator.of(context).push(
//                       PageRouteBuilder(
//                         pageBuilder: (context, animation, secondaryAnimation) =>
//                             const InformationProfileScreen(),
//                         transitionsBuilder:
//                             (context, animation, secondaryAnimation, child) {
//                           // Animasi Slide dari Kanan ke Kiri (Sama seperti Account)
//                           const begin = Offset(1.0, 0.0);
//                           const end = Offset.zero;
//                           const curve = Curves.easeOut;

//                           var tween = Tween(begin: begin, end: end)
//                               .chain(CurveTween(curve: curve));

//                           return SlideTransition(
//                             position: animation.drive(tween),
//                             child: child,
//                           );
//                         },
//                       ),
//                     );
//                   },
//                   leftPadding: 23,
//                 ),

//                 const SizedBox(height: 37),

//                 // =========================
//                 // SECTION: SECURITY
//                 // =========================
//                 const Text(
//                   'Security',
//                   style: TextStyle(
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w600,
//                     fontSize: 14,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 12),

//                 _buildMenuButton(
//                   iconPath: 'assets/images/profile/change_password.png',
//                   label: 'Change Password',
//                   iconSize: 24,
//                   onTap: () {},
//                   leftPadding: 23,
//                 ),

//                 // PERUBAHAN:
//                 // SizedBox besar di bawah (height: 100/180) dihapus
//                 // karena halaman statis tidak perlu ruang scroll.
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildMenuButton({
//     required String iconPath,
//     required String label,
//     required double iconSize,
//     required VoidCallback onTap,
//     double leftPadding = 17.0,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: double.infinity,
//         height: 39,
//         padding: EdgeInsets.only(
//           left: leftPadding,
//           right: 17.0,
//           top: 3.0,
//           bottom: 3.0,
//         ),
//         decoration: BoxDecoration(
//           color: const Color(0xFFF3F4F6),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Row(
//           children: [
//             SizedBox(
//               width: 32,
//               child: Center(
//                 child: iconPath.toLowerCase().endsWith('.svg')
//                     ? SvgPicture.asset(
//                         iconPath,
//                         width: iconSize,
//                         height: iconSize,
//                       )
//                     : Image.asset(
//                         iconPath,
//                         width: iconSize,
//                         height: iconSize,
//                         fit: BoxFit.contain,
//                       ),
//               ),
//             ),
//             const SizedBox(width: 15),
//             Expanded(
//               child: Text(
//                 label,
//                 style: const TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                   fontSize: 12,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             SvgPicture.asset(
//               'assets/icons/ic_arrow-back-right.svg',
//               width: 27,
//               height: 27,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:mobile_smile_multifab/features/profile/screens/account_screen.dart';
// import 'package:mobile_smile_multifab/features/profile/screens/information_profile_screen.dart';
// // IMPORT FILE BARU DISINI
// import 'package:mobile_smile_multifab/features/profile/widgets/change_password_section.dart';

// class ProfileMenuSection extends StatefulWidget {
//   const ProfileMenuSection({super.key});

//   @override
//   State<ProfileMenuSection> createState() => _ProfileMenuSectionState();
// }

// class _ProfileMenuSectionState extends State<ProfileMenuSection> {
//   // false = Menu Utama, true = Form Change Password
//   bool _isChangePasswordMode = false;

//   @override
//   Widget build(BuildContext context) {
//     return MediaQuery(
//       data: MediaQuery.of(context)
//           .copyWith(textScaler: const TextScaler.linear(1.0)),
//       child: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(40),
//             topRight: Radius.circular(40),
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.25),
//               offset: const Offset(0, -3),
//               blurRadius: 4,
//             ),
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(40),
//             topRight: Radius.circular(40),
//           ),
//           // child: Padding(
//           //   padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//           //   // ANIMATED SWITCHER: Mengatur transisi halus antar tampilan
//           //   child: AnimatedSwitcher(
//           //     duration: const Duration(milliseconds: 400),
//           //     transitionBuilder: (Widget child, Animation<double> animation) {
//           //       return FadeTransition(opacity: animation, child: child);
//           //     },
//           //     // LOGIKA SWITCHING:
//           //     // Jika mode change pass aktif, tampilkan ChangePasswordSection
//           //     // Jika tidak, tampilkan _buildMainMenu
//           //     child: _isChangePasswordMode
//           //         ? ChangePasswordSection(
//           //             onBack: () {
//           //               setState(() {
//           //                 _isChangePasswordMode = false;
//           //               });
//           //             },
//           //           )
//           //         : _buildMainMenu(),
//           //   ),
//           // ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),

//             // ===============================================
//             // REVISI ANIMASI: FADE DIGANTI SLIDE
//             // ===============================================
//             child: AnimatedSwitcher(
//               duration: const Duration(milliseconds: 600), // Durasi 0.6 detik
//               // Curve agar gerakan lebih luwes (cepat di tengah)
//               switchInCurve: Curves.easeInOutQuart,
//               switchOutCurve: Curves.easeInOutQuart,

//               transitionBuilder: (Widget child, Animation<double> animation) {
//                 // TENTUKAN ARAH ANIMASI:
//                 // Offset(1.0, 0.0) = Masuk dari KANAN (Efek menimpa normal)
//                 // Offset(-1.0, 0.0) = Masuk dari KIRI (Jika Anda ingin kebalikannya)

//                 final offsetAnimation = Tween<Offset>(
//                   begin: const Offset(1.0, 0.0), // Mulai dari Kanan
//                   end: Offset.zero, // Berhenti di Tengah
//                 ).animate(animation);

//                 return SlideTransition(
//                   position: offsetAnimation,
//                   child: child,
//                 );
//               },

//               child: _isChangePasswordMode
//                   ? ChangePasswordSection(
//                       key: const ValueKey(
//                           'ChangePass'), // Key penting untuk identifikasi
//                       onBack: () {
//                         setState(() {
//                           _isChangePasswordMode = false;
//                         });
//                       },
//                     )
//                   : _buildMainMenu(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // --- TAMPILAN MENU UTAMA ---
//   Widget _buildMainMenu() {
//     return Column(
//       key: const ValueKey('MainMenu'),
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 20),
//         const Text(
//           'Account',
//           style: TextStyle(
//             fontFamily: 'Poppins',
//             fontWeight: FontWeight.w600,
//             fontSize: 14,
//             color: Colors.black,
//           ),
//         ),
//         const SizedBox(height: 12),
//         _buildMenuButton(
//           iconPath: 'assets/images/profile/account.png',
//           label: 'Account',
//           iconSize: 32,
//           onTap: () {
//             Navigator.of(context).push(
//               PageRouteBuilder(
//                 transitionDuration: const Duration(milliseconds: 600),
//                 reverseTransitionDuration: const Duration(milliseconds: 600),
//                 pageBuilder: (context, animation, secondaryAnimation) =>
//                     const AccountScreen(),
//                 transitionsBuilder:
//                     (context, animation, secondaryAnimation, child) {
//                   const begin = Offset(1.0, 0.0);
//                   const end = Offset.zero;
//                   const curve = Curves.easeInOutQuart;
//                   var tween = Tween(begin: begin, end: end)
//                       .chain(CurveTween(curve: curve));
//                   return SlideTransition(
//                       position: animation.drive(tween), child: child);
//                 },
//               ),
//             );
//           },
//         ),
//         const SizedBox(height: 12),
//         _buildMenuButton(
//           iconPath: 'assets/images/profile/informasi_profile.png',
//           label: 'Information Profile',
//           iconSize: 24,
//           leftPadding: 23,
//           onTap: () {
//             Navigator.of(context).push(
//               PageRouteBuilder(
//                 transitionDuration: const Duration(milliseconds: 600),
//                 reverseTransitionDuration: const Duration(milliseconds: 600),
//                 pageBuilder: (context, animation, secondaryAnimation) =>
//                     const InformationProfileScreen(),
//                 transitionsBuilder:
//                     (context, animation, secondaryAnimation, child) {
//                   const begin = Offset(1.0, 0.0);
//                   const end = Offset.zero;
//                   const curve = Curves.easeInOutQuart;
//                   var tween = Tween(begin: begin, end: end)
//                       .chain(CurveTween(curve: curve));
//                   return SlideTransition(
//                       position: animation.drive(tween), child: child);
//                 },
//               ),
//             );
//           },
//         ),
//         const SizedBox(height: 37),
//         const Text(
//           'Security',
//           style: TextStyle(
//             fontFamily: 'Poppins',
//             fontWeight: FontWeight.w600,
//             fontSize: 14,
//             color: Colors.black,
//           ),
//         ),
//         const SizedBox(height: 12),
//         _buildMenuButton(
//           iconPath: 'assets/images/profile/change_password.png',
//           label: 'Change Password',
//           iconSize: 24,
//           leftPadding: 23,
//           onTap: () {
//             // Aktifkan mode Change Password
//             setState(() {
//               _isChangePasswordMode = true;
//             });
//           },
//         ),
//       ],
//     );
//   }

//   Widget _buildMenuButton({
//     required String iconPath,
//     required String label,
//     required double iconSize,
//     required VoidCallback onTap,
//     double leftPadding = 17.0,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: double.infinity,
//         height: 39,
//         padding: EdgeInsets.only(
//           left: leftPadding,
//           right: 17.0,
//           top: 3.0,
//           bottom: 3.0,
//         ),
//         decoration: BoxDecoration(
//           color: const Color(0xFFF3F4F6),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Row(
//           children: [
//             SizedBox(
//               width: 32,
//               child: Center(
//                 child: iconPath.toLowerCase().endsWith('.svg')
//                     ? SvgPicture.asset(
//                         iconPath,
//                         width: iconSize,
//                         height: iconSize,
//                       )
//                     : Image.asset(
//                         iconPath,
//                         width: iconSize,
//                         height: iconSize,
//                         fit: BoxFit.contain,
//                       ),
//               ),
//             ),
//             const SizedBox(width: 15),
//             Expanded(
//               child: Text(
//                 label,
//                 style: const TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                   fontSize: 12,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             SvgPicture.asset(
//               'assets/icons/ic_arrow-back-right.svg',
//               width: 27,
//               height: 27,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:mobile_smile_multifab/features/profile/screens/account_screen.dart';
// import 'package:mobile_smile_multifab/features/profile/screens/information_profile_screen.dart';
// import 'package:mobile_smile_multifab/features/profile/widgets/change_password_section.dart';

// class ProfileMenuSection extends StatefulWidget {
//   const ProfileMenuSection({super.key});

//   @override
//   State<ProfileMenuSection> createState() => _ProfileMenuSectionState();
// }

// class _ProfileMenuSectionState extends State<ProfileMenuSection> {
//   // false = Mode Menu, true = Mode Change Password
//   bool _isChangePasswordMode = false;

//   @override
//   Widget build(BuildContext context) {
//     return MediaQuery(
//       data: MediaQuery.of(context)
//           .copyWith(textScaler: const TextScaler.linear(1.0)),
//       // Container utama TRANSPARAN agar shadow tidak dobel
//       child: Container(
//         width: double.infinity,
//         height: double.infinity,
//         color: Colors.transparent,

//         // MENGGUNAKAN STACK UNTUK LAYER STATIS & OVERLAY
//         child: Stack(
//           children: [
//             // ===============================================
//             // LAYER 1: MENU UTAMA (STATIS / DIAM)
//             // ===============================================
//             _buildMainMenuCard(),

//             // ===============================================
//             // LAYER 2: CHANGE PASSWORD (SLIDE OVERLAY)
//             // ===============================================
//             // IgnorePointer agar saat hidden tidak menghalangi klik ke menu
//             IgnorePointer(
//               ignoring: !_isChangePasswordMode,
//               child: AnimatedSlide(
//                 // LOGIKA POSISI:
//                 // Jika Mode Password Aktif: Offset(0,0) -> Muncul pas ditengah
//                 // Jika Tidak: Offset(1.0, 0) -> Sembunyi di sebelah KANAN layar
//                 // (Ganti 1.0 menjadi -1.0 jika ingin sembunyi di KIRI)
//                 offset: _isChangePasswordMode
//                     ? Offset.zero
//                     : const Offset(1.0, 0.0),

//                 duration: const Duration(milliseconds: 600),
//                 curve: Curves.easeInOutQuart, // Curve halus

//                 child: ChangePasswordSection(
//                   onBack: () {
//                     setState(() {
//                       _isChangePasswordMode = false;
//                     });
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // --- WIDGET CARD MENU UTAMA ---
//   Widget _buildMainMenuCard() {
//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       // DEKORASI CARD PUTIH
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(40),
//           topRight: Radius.circular(40),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.25),
//             offset: const Offset(0, -3),
//             blurRadius: 4,
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(40),
//           topRight: Radius.circular(40),
//         ),
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 20), // Jarak atas

//               const Text(
//                 'Account',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                   fontSize: 14,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 12),

//               _buildMenuButton(
//                 iconPath: 'assets/images/profile/account.png',
//                 label: 'Account',
//                 iconSize: 32,
//                 onTap: () {
//                   Navigator.of(context).push(
//                     PageRouteBuilder(
//                       transitionDuration: const Duration(milliseconds: 600),
//                       reverseTransitionDuration:
//                           const Duration(milliseconds: 600),
//                       pageBuilder: (context, animation, secondaryAnimation) =>
//                           const AccountScreen(),
//                       transitionsBuilder:
//                           (context, animation, secondaryAnimation, child) {
//                         const begin = Offset(1.0, 0.0);
//                         const end = Offset.zero;
//                         const curve = Curves.easeInOutQuart;
//                         var tween = Tween(begin: begin, end: end)
//                             .chain(CurveTween(curve: curve));
//                         return SlideTransition(
//                             position: animation.drive(tween), child: child);
//                       },
//                     ),
//                   );
//                 },
//               ),
//               const SizedBox(height: 12),

//               _buildMenuButton(
//                 iconPath: 'assets/images/profile/informasi_profile.png',
//                 label: 'Information Profile',
//                 iconSize: 24,
//                 leftPadding: 23,
//                 onTap: () {
//                   Navigator.of(context).push(
//                     PageRouteBuilder(
//                       transitionDuration: const Duration(milliseconds: 600),
//                       reverseTransitionDuration:
//                           const Duration(milliseconds: 600),
//                       pageBuilder: (context, animation, secondaryAnimation) =>
//                           const InformationProfileScreen(),
//                       transitionsBuilder:
//                           (context, animation, secondaryAnimation, child) {
//                         const begin = Offset(1.0, 0.0);
//                         const end = Offset.zero;
//                         const curve = Curves.easeInOutQuart;
//                         var tween = Tween(begin: begin, end: end)
//                             .chain(CurveTween(curve: curve));
//                         return SlideTransition(
//                             position: animation.drive(tween), child: child);
//                       },
//                     ),
//                   );
//                 },
//               ),

//               const SizedBox(height: 37),

//               const Text(
//                 'Security',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                   fontSize: 14,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 12),

//               _buildMenuButton(
//                 iconPath: 'assets/images/profile/change_password.png',
//                 label: 'Change Password',
//                 iconSize: 24,
//                 leftPadding: 23,
//                 onTap: () {
//                   setState(() {
//                     _isChangePasswordMode = true; // Trigger animasi masuk
//                   });
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildMenuButton({
//     required String iconPath,
//     required String label,
//     required double iconSize,
//     required VoidCallback onTap,
//     double leftPadding = 17.0,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: double.infinity,
//         height: 39,
//         padding: EdgeInsets.only(
//           left: leftPadding,
//           right: 17.0,
//           top: 3.0,
//           bottom: 3.0,
//         ),
//         decoration: BoxDecoration(
//           color: const Color(0xFFF3F4F6),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Row(
//           children: [
//             SizedBox(
//               width: 32,
//               child: Center(
//                 child: iconPath.toLowerCase().endsWith('.svg')
//                     ? SvgPicture.asset(
//                         iconPath,
//                         width: iconSize,
//                         height: iconSize,
//                       )
//                     : Image.asset(
//                         iconPath,
//                         width: iconSize,
//                         height: iconSize,
//                         fit: BoxFit.contain,
//                       ),
//               ),
//             ),
//             const SizedBox(width: 15),
//             Expanded(
//               child: Text(
//                 label,
//                 style: const TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                   fontSize: 12,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             SvgPicture.asset(
//               'assets/icons/ic_arrow-back-right.svg',
//               width: 27,
//               height: 27,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }






// import 'dart:async'; // Untuk Timer
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:mobile_smile_multifab/features/profile/screens/account_screen.dart';
// import 'package:mobile_smile_multifab/features/profile/screens/information_profile_screen.dart';
// // Import Widget Kita
// import 'package:mobile_smile_multifab/features/profile/widgets/change_password_section.dart';
// import 'package:mobile_smile_multifab/features/profile/widgets/success_notification_card.dart';

// // Enum untuk melacak status tampilan
// enum ProfileView { menu, password, success }

// class ProfileMenuSection extends StatefulWidget {
//   const ProfileMenuSection({super.key});

//   @override
//   State<ProfileMenuSection> createState() => _ProfileMenuSectionState();
// }

// class _ProfileMenuSectionState extends State<ProfileMenuSection> {
//   // Default tampilan adalah Menu Utama
//   ProfileView _currentView = ProfileView.menu;

//   // Fungsi Transisi ke Menu (Reset)
//   void _goToMenu() {
//     setState(() {
//       _currentView = ProfileView.menu;
//     });
//   }

//   // Fungsi Transisi ke Form Password
//   void _goToPassword() {
//     setState(() {
//       _currentView = ProfileView.password;
//     });
//   }

//   // Fungsi Transisi ke Sukses + Timer
//   void _goToSuccess() {
//     setState(() {
//       _currentView = ProfileView.success;
//     });

//     // Timer 4 Detik lalu kembali ke Menu
//     Timer(const Duration(seconds: 4), () {
//       if (mounted) {
//         _goToMenu();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MediaQuery(
//       data: MediaQuery.of(context)
//           .copyWith(textScaler: const TextScaler.linear(1.0)),
//       child: Container(
//         width: double.infinity,
//         height: double.infinity,
//         color: Colors.transparent,

//         // STACK 3 LAYER (MENU -> PASSWORD -> SUCCESS)
//         child: Stack(
//           children: [
//             // LAYER 1: MENU UTAMA (Selalu di bawah, Statis)
//             _buildMainMenuCard(),

//             // LAYER 2: CHANGE PASSWORD CARD
//             // Muncul jika view == password ATAU success (karena saat sukses, pass ada dibawahnya)
//             IgnorePointer(
//               // Hanya bisa diklik jika sedang aktif di mode password
//               ignoring: _currentView != ProfileView.password,
//               child: AnimatedSlide(
//                 // Jika Menu: Geser ke Kanan (1.0)
//                 // Jika Pass/Success: Geser ke Tengah (0.0)
//                 offset: _currentView == ProfileView.menu
//                     ? const Offset(1.0, 0.0)
//                     : Offset.zero,
//                 duration: const Duration(milliseconds: 600),
//                 curve: Curves.easeInOutQuart,
//                 child: ChangePasswordSection(
//                   onBack: _goToMenu, // Klik Back -> Ke Menu
//                   onSuccess: _goToSuccess, // Klik Save -> Ke Sukses
//                 ),
//               ),
//             ),

//             // LAYER 3: SUCCESS NOTIFICATION CARD
//             // Hanya muncul jika view == success
//             IgnorePointer(
//               ignoring: _currentView != ProfileView.success,
//               child: AnimatedSlide(
//                 // Jika Success: Tengah (0.0)
//                 // Jika Menu/Pass: Kanan (1.0)
//                 offset: _currentView == ProfileView.success
//                     ? Offset.zero
//                     : const Offset(1.0, 0.0),
//                 duration: const Duration(milliseconds: 600),
//                 curve: Curves.easeInOutQuart,
//                 child: const SuccessNotificationCard(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // --- WIDGET MENU UTAMA ---
//   Widget _buildMainMenuCard() {
//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(40),
//           topRight: Radius.circular(40),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.25),
//             offset: const Offset(0, -3),
//             blurRadius: 4,
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(40),
//           topRight: Radius.circular(40),
//         ),
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 20),
//               const Text(
//                 'Account',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                   fontSize: 14,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 12),
//               _buildMenuButton(
//                 iconPath: 'assets/images/profile/account.png',
//                 label: 'Account',
//                 iconSize: 32,
//                 onTap: () {
//                   Navigator.of(context).push(
//                     PageRouteBuilder(
//                       transitionDuration: const Duration(milliseconds: 600),
//                       reverseTransitionDuration:
//                           const Duration(milliseconds: 600),
//                       pageBuilder: (context, animation, secondaryAnimation) =>
//                           const AccountScreen(),
//                       transitionsBuilder:
//                           (context, animation, secondaryAnimation, child) {
//                         const begin = Offset(1.0, 0.0);
//                         const end = Offset.zero;
//                         const curve = Curves.easeInOutQuart;
//                         var tween = Tween(begin: begin, end: end)
//                             .chain(CurveTween(curve: curve));
//                         return SlideTransition(
//                             position: animation.drive(tween), child: child);
//                       },
//                     ),
//                   );
//                 },
//               ),
//               const SizedBox(height: 12),
//               _buildMenuButton(
//                 iconPath: 'assets/images/profile/informasi_profile.png',
//                 label: 'Information Profile',
//                 iconSize: 24,
//                 leftPadding: 23,
//                 onTap: () {
//                   Navigator.of(context).push(
//                     PageRouteBuilder(
//                       transitionDuration: const Duration(milliseconds: 600),
//                       reverseTransitionDuration:
//                           const Duration(milliseconds: 600),
//                       pageBuilder: (context, animation, secondaryAnimation) =>
//                           const InformationProfileScreen(),
//                       transitionsBuilder:
//                           (context, animation, secondaryAnimation, child) {
//                         const begin = Offset(1.0, 0.0);
//                         const end = Offset.zero;
//                         const curve = Curves.easeInOutQuart;
//                         var tween = Tween(begin: begin, end: end)
//                             .chain(CurveTween(curve: curve));
//                         return SlideTransition(
//                             position: animation.drive(tween), child: child);
//                       },
//                     ),
//                   );
//                 },
//               ),
//               const SizedBox(height: 37),
//               const Text(
//                 'Security',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                   fontSize: 14,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 12),
//               _buildMenuButton(
//                 iconPath: 'assets/images/profile/change_password.png',
//                 label: 'Change Password',
//                 iconSize: 24,
//                 leftPadding: 23,
//                 onTap: () {
//                   // Panggil fungsi untuk membuka password form
//                   _goToPassword();
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildMenuButton({
//     required String iconPath,
//     required String label,
//     required double iconSize,
//     required VoidCallback onTap,
//     double leftPadding = 17.0,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: double.infinity,
//         height: 39,
//         padding: EdgeInsets.only(
//           left: leftPadding,
//           right: 17.0,
//           top: 3.0,
//           bottom: 3.0,
//         ),
//         decoration: BoxDecoration(
//           color: const Color(0xFFF3F4F6),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Row(
//           children: [
//             SizedBox(
//               width: 32,
//               child: Center(
//                 child: iconPath.toLowerCase().endsWith('.svg')
//                     ? SvgPicture.asset(
//                         iconPath,
//                         width: iconSize,
//                         height: iconSize,
//                       )
//                     : Image.asset(
//                         iconPath,
//                         width: iconSize,
//                         height: iconSize,
//                         fit: BoxFit.contain,
//                       ),
//               ),
//             ),
//             const SizedBox(width: 15),
//             Expanded(
//               child: Text(
//                 label,
//                 style: const TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                   fontSize: 12,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             SvgPicture.asset(
//               'assets/icons/ic_arrow-back-right.svg',
//               width: 27,
//               height: 27,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





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
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const AccountScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              _buildMenuButton(
                iconPath: 'assets/images/profile/informasi_profile.png',
                label: 'Information Profile',
                iconSize: 24,
                leftPadding: 23,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const InformationProfileScreen(),
                    ),
                  );
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
                onTap: onChangePassword, // 🔥 trigger overlay
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

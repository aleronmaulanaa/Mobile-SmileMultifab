// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'login_page.dart';

// class ResetPasswordPage extends StatefulWidget {
//   const ResetPasswordPage({super.key});

//   @override
//   State<ResetPasswordPage> createState() => _ResetPasswordPageState();
// }

// class _ResetPasswordPageState extends State<ResetPasswordPage> {
//   // Controller status hide/show password
//   bool _obscureNew = true;
//   bool _obscureConfirm = true;

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;

//     // 1. Gesture Detector untuk menutup keyboard
//     return GestureDetector(
//       onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: SingleChildScrollView(
//           child: SizedBox(
//             height: screenHeight,
//             child: Stack(
//               children: [
//                 // ===========================
//                 // 1. BACKGROUND (SAMA DENGAN VERIFY OTP)
//                 // ===========================
//                 Positioned.fill(
//                   child: Image.asset(
//                     'assets/images/login/bg_login_page.JPEG',
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) =>
//                         Container(color: Colors.white),
//                   ),
//                 ),

//                 // ===========================
//                 // 2. TOMBOL BACK (KONSISTEN: TOP 78)
//                 // ===========================
//                 Positioned(
//                   top: 78,
//                   left: 0,
//                   right: 0,
//                   child: Center(
//                     child: SizedBox(
//                       width: 347,
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: GestureDetector(
//                           onTap: () => Navigator.pop(context),
//                           child: Container(
//                             width: 40,
//                             height: 40,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                 color: Colors.black.withOpacity(0.20),
//                                 width: 1,
//                               ),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black.withOpacity(0.25),
//                                   blurRadius: 5,
//                                   offset: const Offset(0, 0),
//                                 ),
//                               ],
//                             ),
//                             child: const Center(
//                               child: Icon(
//                                 Icons.arrow_back,
//                                 size: 24,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 // ===========================
//                 // 3. KONTEN UTAMA (KONSISTEN: TOP 188)
//                 // ===========================
//                 Positioned(
//                   top: 188,
//                   left: 0,
//                   right: 0,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       // --- IMAGE (W=114 H=114) ---
//                       Image.asset(
//                         'assets/images/login/reset_password.png',
//                         width: 114,
//                         height: 114,
//                         fit: BoxFit.contain,
//                         errorBuilder: (context, error, stackTrace) {
//                           return const Icon(Icons.broken_image,
//                               size: 114, color: Colors.grey);
//                         },
//                       ),

//                       const SizedBox(height: 24), // Jarak Gambar ke Text = 24

//                       // --- WRAPPER TEXT (Agar Rata Kiri Sejajar Card) ---
//                       SizedBox(
//                         width: 347,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: const [
//                             Text(
//                               'Reset Password',
//                               style: TextStyle(
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 24,
//                                 color: Color(0xFFFA0209),
//                               ),
//                             ),
//                             SizedBox(height: 9), // Jarak antar text = 9
//                             Text(
//                               'Please enter your new password,\nthen confirm it to make sure there are no mistakes',
//                               style: TextStyle(
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 13,
//                                 color: Color(0xFF991B1C),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),

//                       const SizedBox(
//                           height: 21), // Jarak Text ke Card (Standard)

//                       // --- CARD FORM ---
//                       _buildResetCard(context),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildResetCard(BuildContext context) {
//     return Container(
//       width: 347, // W=347
//       // REVISI: HAPUS 'height: 311' agar card otomatis memanjang mengikuti isinya
//       // height: 311, <--- Baris ini dihapus

//       // Padding tetap sesuai permintaan: Kiri Kanan 16, Atas 34, Bawah 51
//       padding: const EdgeInsets.fromLTRB(16, 34, 16, 51),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(21),
//         border: Border.all(
//           color: Colors.black.withOpacity(0.25),
//           width: 1,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.25),
//             offset: const Offset(0, 7),
//             blurRadius: 9,
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // === FORM 1: NEW PASSWORD ===
//           const Text(
//             'New Password',
//             style: TextStyle(
//               fontFamily: 'Poppins',
//               fontWeight: FontWeight.w600,
//               fontSize: 12,
//               color: Color(0xFF991B1C),
//             ),
//           ),
//           const SizedBox(height: 3), // Jarak 3
//           const Text(
//             'Password must be at least 8 characters.',
//             style: TextStyle(
//               fontFamily: 'Poppins',
//               fontWeight: FontWeight.w600,
//               fontSize: 12,
//               color: Color(0xFF991B1C),
//             ),
//           ),
//           const SizedBox(height: 8), // Jarak 8

//           // Input Field 1 (TANPA Icon Mata)
//           _buildInputField(
//             hintText: 'Enter your new password',
//             iconPath: 'assets/icons/ic_password.svg',
//             isPassword: true,
//             showEyeIcon: false,
//             obscureText: _obscureNew,
//             onToggle: () {},
//           ),

//           const SizedBox(height: 18), // Jarak antar form 18

//           // === FORM 2: CONFIRM PASSWORD ===
//           const Text(
//             'Confirm New Password',
//             style: TextStyle(
//               fontFamily: 'Poppins',
//               fontWeight: FontWeight.w600,
//               fontSize: 12,
//               color: Color(0xFF991B1C),
//             ),
//           ),
//           const SizedBox(height: 8), // Jarak 8

//           // Input Field 2 (DENGAN Icon Mata)
//           _buildInputField(
//             hintText: 'Confirm your password',
//             iconPath: 'assets/icons/ic_password.svg',
//             isPassword: true,
//             showEyeIcon: true,
//             obscureText: _obscureConfirm,
//             onToggle: () {
//               setState(() {
//                 _obscureConfirm = !_obscureConfirm;
//               });
//             },
//           ),

//           const SizedBox(height: 24), // Jarak ke Tombol = 24

//           // === TOMBOL CONFIRM ===
//           Center(
//             child: SizedBox(
//               width: 262,
//               height: 36,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFFFA0007),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(18),
//                   ),
//                   elevation: 0,
//                 ),
//                 onPressed: () {
//                   _showSuccessPopup(context);
//                 },
//                 child: const Text(
//                   'Confirm',
//                   style: TextStyle(
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w600,
//                     fontSize: 15,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // WIDGET INPUT FIELD (MODIFIKASI: Support Hide/Show Eye Icon)
//   Widget _buildInputField({
//     required String hintText,
//     required String iconPath,
//     required bool isPassword,
//     required bool showEyeIcon, // Parameter baru
//     required bool obscureText,
//     required VoidCallback onToggle,
//   }) {
//     return Container(
//       width: 314,
//       height: 42,
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF2F2F2),
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Icon Gembok (Kiri)
//           SvgPicture.asset(
//             iconPath,
//             width: 21,
//             height: 21,
//             fit: BoxFit.contain,
//           ),
//           const SizedBox(width: 5),

//           // Text Field
//           Expanded(
//             child: TextField(
//               obscureText: showEyeIcon ? obscureText : true, // Logic obscure
//               textAlignVertical: TextAlignVertical.center,
//               style: const TextStyle(
//                 fontFamily: 'Poppins',
//                 fontWeight: FontWeight.w600,
//                 fontSize: 10,
//                 color: Colors.black,
//               ),
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 hintText: hintText,
//                 hintStyle: const TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                   fontSize: 10,
//                   color: Color(0xFFA0A0A0),
//                 ),
//                 isDense: true,
//                 contentPadding: EdgeInsets.zero,
//               ),
//             ),
//           ),

//           // Icon Mata (Kanan) - Hanya muncul jika showEyeIcon = true
//           if (showEyeIcon)
//             GestureDetector(
//               onTap: onToggle,
//               child: SvgPicture.asset(
//                 obscureText
//                     ? 'assets/icons/ic_hide.svg'
//                     : 'assets/icons/ic_show.svg',
//                 width: 21,
//                 height: 21,
//                 colorFilter: const ColorFilter.mode(
//                   Color(0xFF979797),
//                   BlendMode.srcIn,
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   void _showSuccessPopup(BuildContext context) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (_) => AlertDialog(
//         backgroundColor: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//         ),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Image.asset(
//               'assets/images/login/popup_lock.png',
//               width: 73,
//               height: 73,
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'Password updated successfully',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontFamily: 'Poppins',
//                 fontWeight: FontWeight.w600,
//                 fontSize: 24,
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(height: 12),
//             Image.asset(
//               'assets/images/login/checklist_popup.png',
//               width: 36,
//               height: 36,
//             ),
//           ],
//         ),
//       ),
//     );

//     // Navigasi balik ke Login setelah 2 detik
//     Future.delayed(const Duration(seconds: 2), () {
//       Navigator.of(context).pop(); // Tutup dialog
//       Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(builder: (_) => const LoginPage()),
//         (route) => false,
//       );
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login_page.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  // Controller status hide/show password
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    // 1. Gesture Detector untuk menutup keyboard
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight,
            child: Stack(
              children: [
                // ===========================
                // 1. BACKGROUND
                // ===========================
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/login/bg_login_page.JPEG',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Container(color: Colors.white),
                  ),
                ),

                // ===========================
                // 2. TOMBOL BACK (KONSISTEN: TOP 78)
                // ===========================
                Positioned(
                  top: 78,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: SizedBox(
                      width: 347,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black.withOpacity(0.20),
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 5,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_back,
                                size: 24,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // ===========================
                // 3. KONTEN UTAMA (KONSISTEN: TOP 188)
                // ===========================
                Positioned(
                  top: 188,
                  left: 0,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // --- IMAGE ---
                      Image.asset(
                        'assets/images/login/reset_password.png',
                        width: 114,
                        height: 114,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.broken_image,
                              size: 114, color: Colors.grey);
                        },
                      ),

                      const SizedBox(height: 24), // Jarak Gambar ke Text = 24

                      // --- WRAPPER TEXT ---
                      SizedBox(
                        width: 347,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Reset Password',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: Color(0xFFFA0209),
                              ),
                            ),
                            SizedBox(height: 9), // Jarak antar text = 9
                            Text(
                              'Please enter your new password,\nthen confirm it to make sure there are no mistakes',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: Color(0xFF991B1C),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // JARAK TEXT KE CARD (21)
                      const SizedBox(height: 21),

                      // --- CARD FORM ---
                      _buildResetCard(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResetCard(BuildContext context) {
    return Container(
      width: 347,
      // height: 311, // Auto height
      padding: const EdgeInsets.fromLTRB(16, 34, 16, 51),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(21),
        border: Border.all(
          color: Colors.black.withOpacity(0.25),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 7),
            blurRadius: 9,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // === FORM 1: NEW PASSWORD ===
          const Text(
            'New Password',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color(0xFF991B1C),
            ),
          ),
          const SizedBox(height: 3), // Jarak 3
          const Text(
            'Password must be at least 8 characters.',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color(0xFF991B1C),
            ),
          ),
          const SizedBox(height: 8), // Jarak 8

          // Input Field 1
          _buildInputField(
            hintText: 'Enter your new password',
            iconPath: 'assets/icons/ic_password.svg',
            isPassword: true,
            showEyeIcon: false,
            obscureText: _obscureNew,
            onToggle: () {},
          ),

          const SizedBox(height: 18), // Jarak antar form 18

          // === FORM 2: CONFIRM PASSWORD ===
          const Text(
            'Confirm New Password',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color(0xFF991B1C),
            ),
          ),
          const SizedBox(height: 8), // Jarak 8

          // Input Field 2
          _buildInputField(
            hintText: 'Confirm your password',
            iconPath: 'assets/icons/ic_password.svg',
            isPassword: true,
            showEyeIcon: true,
            obscureText: _obscureConfirm,
            onToggle: () {
              setState(() {
                _obscureConfirm = !_obscureConfirm;
              });
            },
          ),

          const SizedBox(height: 24), // Jarak ke Tombol = 24

          // === TOMBOL CONFIRM ===
          Center(
            child: SizedBox(
              width: 262,
              height: 36,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFA0007),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  _showSuccessPopup(context);
                },
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // WIDGET INPUT FIELD
  Widget _buildInputField({
    required String hintText,
    required String iconPath,
    required bool isPassword,
    required bool showEyeIcon,
    required bool obscureText,
    required VoidCallback onToggle,
  }) {
    return Container(
      width: 314,
      height: 42,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 21,
            height: 21,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: TextField(
              obscureText: showEyeIcon ? obscureText : true,
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 10,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  color: Color(0xFFA0A0A0),
                ),
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          if (showEyeIcon)
            GestureDetector(
              onTap: onToggle,
              child: SvgPicture.asset(
                obscureText
                    ? 'assets/icons/ic_hide.svg'
                    : 'assets/icons/ic_show.svg',
                width: 21,
                height: 21,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF979797),
                  BlendMode.srcIn,
                ),
              ),
            ),
        ],
      ),
    );
  }

  // ========================================================
  // POPUP (DIALOG) YANG SUDAH DIPERBAIKI
  // ========================================================
  // void _showSuccessPopup(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     // Background belakang card hitam 35%
  //     barrierColor: Colors.black.withOpacity(0.35),
  //     builder: (_) => Dialog(
  //       // Menghilangkan inset bawaan agar ukuran bisa custom
  //       insetPadding: EdgeInsets.zero,
  //       backgroundColor: Colors.transparent, // Background transparan
  //       child: Container(
  //         width: 330, // W=330 (Tetap)
  //         // REVISI: HAPUS height agar memanjang otomatis (tidak overflow)
  //         // height: 211,

  //         // REVISI: Margin Kiri-Kanan dikurangi jadi 35 (sebelumnya 50)
  //         // Agar teks "Password updated" muat dalam 1 baris
  //         padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(9), // Radius 9
  //         ),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min, // Card menyesuaikan tinggi konten
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             // GAMBAR POPUP
  //             Image.asset(
  //               'assets/images/login/popup_lock.png',
  //               width: 73, // W=73
  //               height: 73, // H=73
  //             ),

  //             const SizedBox(height: 16), // Jarak Gambar ke Text = 16

  //             // TEXT: Password updated (Sekarang muat 1 baris)
  //             const Text(
  //               'Password updated',
  //               textAlign: TextAlign.center,
  //               style: TextStyle(
  //                 fontFamily: 'Poppins',
  //                 fontWeight: FontWeight.w600,
  //                 fontSize: 24,
  //                 color: Colors.black,
  //                 height: 1.0, // Rapat baris
  //               ),
  //             ),

  //             // Jarak Text ke Baris bawahnya = 0 (Langsung Row)
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 // TEXT: successfully
  //                 const Text(
  //                   'successfully',
  //                   style: TextStyle(
  //                     fontFamily: 'Poppins',
  //                     fontWeight: FontWeight.w600,
  //                     fontSize: 24,
  //                     color: Colors.black,
  //                     height: 1.0, // Rapat baris
  //                   ),
  //                 ),

  //                 const SizedBox(width: 7), // Jarak Text ke Icon = 7

  //                 // ICON CHECKLIST (SVG)
  //                 SvgPicture.asset(
  //                   'assets/icons/checklist_popup.svg',
  //                   width: 36, // W=36
  //                   height: 36, // H=36
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );

  //   // Logic Navigasi setelah 2 detik
  //   Future.delayed(const Duration(seconds: 2), () {
  //     Navigator.of(context).pop();
  //     Navigator.of(context).pushAndRemoveUntil(
  //       MaterialPageRoute(builder: (_) => const LoginPage()),
  //       (route) => false,
  //     );
  //   });
  // }

  void _showSuccessPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      // Background belakang card hitam 35%
      barrierColor: Colors.black.withOpacity(0.35),
      builder: (_) => Dialog(
        // Menghilangkan inset bawaan agar ukuran bisa custom
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent, // Background transparan
        child: Container(
          width: 330, // W=330 (Tetap)
          // HAPUS height agar memanjang otomatis mengikuti konten + padding

          // REVISI: Menggunakan .only untuk mengatur bottom padding lebih besar
          padding: const EdgeInsets.only(
            left: 35, // Margin Kiri (Tetap 35 agar teks muat 1 baris)
            right: 35, // Margin Kanan (Tetap 35)
            top: 25, // Margin Atas (Tetap 25)
            bottom: 30, // <--- DITAMBAH (Supaya card lebih panjang ke bawah)
          ),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9), // Radius 9
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Card menyesuaikan tinggi konten
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // GAMBAR POPUP
              Image.asset(
                'assets/images/login/popup_lock.png',
                width: 73, // W=73
                height: 73, // H=73
              ),

              const SizedBox(height: 16), // Jarak Gambar ke Text = 16

              // TEXT: Password updated
              const Text(
                'Password updated',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.black,
                  height: 1.0, // Rapat baris
                ),
              ),

              // Jarak Text ke Baris bawahnya = 0 (Langsung Row)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // TEXT: successfully
                  const Text(
                    'successfully',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.black,
                      height: 1.0, // Rapat baris
                    ),
                  ),

                  const SizedBox(width: 7), // Jarak Text ke Icon = 7

                  // ICON CHECKLIST (SVG)
                  SvgPicture.asset(
                    'assets/icons/checklist_popup.svg',
                    width: 36, // W=36
                    height: 36, // H=36
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    // Logic Navigasi setelah 2 detik
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginPage()),
        (route) => false,
      );
    });
  }
}

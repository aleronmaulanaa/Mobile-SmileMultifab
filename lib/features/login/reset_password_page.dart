// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'login_page.dart';

// class ResetPasswordPage extends StatefulWidget {
//   const ResetPasswordPage({super.key});

//   @override
//   State<ResetPasswordPage> createState() => _ResetPasswordPageState();
// }

// class _ResetPasswordPageState extends State<ResetPasswordPage> {
//   bool _obscureNew = true;
//   bool _obscureConfirm = true;

//   @override
//   Widget build(BuildContext context) {
//     // Ambil tinggi layar utuh untuk referensi posisi
//     final screenHeight = MediaQuery.of(context).size.height;

//     // [LAYER 1: BACKGROUND STATIS]
//     return Scaffold(
//       resizeToAvoidBottomInset: false, // Background diam
//       body: Stack(
//         children: [
//           // 1. BACKGROUND IMAGE
//           Positioned.fill(
//             child: Image.asset(
//               'assets/images/login/bg_login_page.JPEG',
//               fit: BoxFit.cover,
//               errorBuilder: (context, error, stackTrace) =>
//                   Container(color: Colors.white),
//             ),
//           ),

//           // [LAYER 2: KONTEN RESPONSIF]
//           Positioned.fill(
//             child: Scaffold(
//               backgroundColor: Colors.transparent,
//               resizeToAvoidBottomInset:
//                   true, // Form responsif (naik saat keyboard muncul)

//               // KUNCI PERBAIKAN: Gunakan Stack di sini untuk memisah Fixed vs Scrollable
//               body: Stack(
//                 children: [
//                   // ===============================================
//                   // 1. BAGIAN FORM (BISA DI-SCROLL)
//                   // ===============================================
//                   // Letakkan ini di lapisan bawah
//                   Positioned.fill(
//                     child: GestureDetector(
//                       onTap: () =>
//                           FocusManager.instance.primaryFocus?.unfocus(),
//                       child: SingleChildScrollView(
//                         child: SizedBox(
//                           // Kita tetapkan tingginya setinggi layar agar logika 'top: 188' tetap akurat
//                           height: screenHeight,
//                           child: Stack(
//                             children: [
//                               // FORM CONTENT (Posisi tetap sama)
//                               Positioned(
//                                 top: 188,
//                                 left: 0,
//                                 right: 0,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Image.asset(
//                                       'assets/images/login/reset_password.png',
//                                       width: 114,
//                                       height: 114,
//                                       fit: BoxFit.contain,
//                                       errorBuilder:
//                                           (context, error, stackTrace) {
//                                         return const Icon(Icons.broken_image,
//                                             size: 114, color: Colors.grey);
//                                       },
//                                     ),
//                                     const SizedBox(height: 24),
//                                     SizedBox(
//                                       width: 347,
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: const [
//                                           Text(
//                                             'Reset Password',
//                                             style: TextStyle(
//                                               fontFamily: 'Poppins',
//                                               fontWeight: FontWeight.w600,
//                                               fontSize: 24,
//                                               color: Color(0xFFFA0209),
//                                             ),
//                                           ),
//                                           SizedBox(height: 9),
//                                           Text(
//                                             'Please enter your new password,\nthen confirm it to make sure there are no mistakes',
//                                             style: TextStyle(
//                                               fontFamily: 'Poppins',
//                                               fontWeight: FontWeight.w600,
//                                               fontSize: 13,
//                                               color: Color(0xFF991B1C),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     const SizedBox(height: 21),
//                                     _buildResetCard(context),
//                                     // Tambahan padding bawah agar aman saat scroll mentok
//                                     const SizedBox(height: 100),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),

//                   // ===============================================
//                   // 2. BAGIAN TOMBOL BACK (FIXED / DIAM)
//                   // ===============================================
//                   // Diletakkan DI LUAR SingleChildScrollView dan paling bawah di Stack (Layer Paling Atas)
//                   Positioned(
//                     top: 78,
//                     left: 0,
//                     right: 0,
//                     child: Center(
//                       child: SizedBox(
//                         width: 347,
//                         child: Align(
//                           alignment: Alignment.centerLeft,
//                           child: GestureDetector(
//                             onTap: () => Navigator.pop(context),
//                             child: Container(
//                               width: 40,
//                               height: 40,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 shape: BoxShape.circle,
//                                 border: Border.all(
//                                   color: Colors.black.withOpacity(0.20),
//                                   width: 1,
//                                 ),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black.withOpacity(0.25),
//                                     blurRadius: 5,
//                                     offset: const Offset(0, 0),
//                                   ),
//                                 ],
//                               ),
//                               child: Center(
//                                 child: SvgPicture.asset(
//                                   'assets/icons/ic_arrow_black.svg',
//                                   width: 17,
//                                   height: 17,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ... (SISA KODE Widget _buildResetCard, _buildInputField, _showSuccessPopup SAMA SEPERTI SEBELUMNYA)
//   // ... (TIDAK PERLU DIUBAH, CUKUP COPY-PASTE BAGIAN BAWAH KODE SEBELUMNYA) ...

//   Widget _buildResetCard(BuildContext context) {
//     return Container(
//       width: 347,
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
//           const Text(
//             'New Password',
//             style: TextStyle(
//               fontFamily: 'Poppins',
//               fontWeight: FontWeight.w600,
//               fontSize: 12,
//               color: Color(0xFF991B1C),
//             ),
//           ),
//           const SizedBox(height: 3),
//           const Text(
//             'Password must be at least 8 characters.',
//             style: TextStyle(
//               fontFamily: 'Poppins',
//               fontWeight: FontWeight.w600,
//               fontSize: 12,
//               color: Color(0xFF991B1C),
//             ),
//           ),
//           const SizedBox(height: 8),
//           _buildInputField(
//             hintText: 'Enter your new password',
//             iconPath: 'assets/icons/ic_password.svg',
//             isPassword: true,
//             showEyeIcon: false,
//             obscureText: _obscureNew,
//             onToggle: () {},
//           ),
//           const SizedBox(height: 18),
//           const Text(
//             'Confirm New Password',
//             style: TextStyle(
//               fontFamily: 'Poppins',
//               fontWeight: FontWeight.w600,
//               fontSize: 12,
//               color: Color(0xFF991B1C),
//             ),
//           ),
//           const SizedBox(height: 8),
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
//           const SizedBox(height: 24),
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
//                 onPressed: () async {
//                   FocusManager.instance.primaryFocus?.unfocus();
//                   await Future.delayed(const Duration(milliseconds: 200));
//                   if (context.mounted) {
//                     _showSuccessPopup(context);
//                   }
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

//   Widget _buildInputField({
//     required String hintText,
//     required String iconPath,
//     required bool isPassword,
//     required bool showEyeIcon,
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
//           SvgPicture.asset(
//             iconPath,
//             width: 21,
//             height: 21,
//             fit: BoxFit.contain,
//           ),
//           const SizedBox(width: 5),
//           Expanded(
//             child: TextField(
//               obscureText: showEyeIcon ? obscureText : true,
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

//   void _showSuccessPopup(BuildContext context) async {
//     Future.delayed(const Duration(seconds: 2), () {
//       if (context.mounted) {
//         Navigator.of(context).pop();
//       }
//     });

//     await showGeneralDialog(
//       context: context,
//       barrierDismissible: false,
//       barrierLabel: "Success Popup",
//       barrierColor: Colors.black.withOpacity(0.35),
//       transitionDuration: const Duration(milliseconds: 400),
//       pageBuilder: (context, animation, secondaryAnimation) {
//         return Center(
//           child: Material(
//             color: Colors.transparent,
//             child: Container(
//               width: 330,
//               padding: const EdgeInsets.only(
//                   left: 35, right: 35, top: 25, bottom: 30),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(9),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset('assets/images/common/popup_lock.png',
//                       width: 73, height: 73),
//                   const SizedBox(height: 16),
//                   const Text('Password updated',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w600,
//                           fontSize: 24,
//                           color: Colors.black,
//                           height: 1.0)),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text('successfully',
//                           style: TextStyle(
//                               fontFamily: 'Poppins',
//                               fontWeight: FontWeight.w600,
//                               fontSize: 24,
//                               color: Colors.black,
//                               height: 1.0)),
//                       const SizedBox(width: 7),
//                       SvgPicture.asset('assets/icons/ic_checklist_popup.svg',
//                           width: 36, height: 36),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//       transitionBuilder: (context, animation, secondaryAnimation, child) {
//         var curve =
//             CurvedAnimation(parent: animation, curve: Curves.easeOutBack);
//         return ScaleTransition(
//             scale: curve,
//             child: FadeTransition(opacity: animation, child: child));
//       },
//     );

//     if (context.mounted) {
//       Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(builder: (_) => const LoginPage()),
//         (route) => false,
//       );
//     }
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
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    // Ambil tinggi layar utuh untuk referensi posisi
    final screenHeight = MediaQuery.of(context).size.height;

    // [LAYER 1: BACKGROUND STATIS]
    return Scaffold(
      resizeToAvoidBottomInset: false, // Background diam
      body: Stack(
        children: [
          // 1. BACKGROUND IMAGE
          Positioned.fill(
            child: Image.asset(
              'assets/images/login/bg_login_page.JPEG',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Container(color: Colors.white),
            ),
          ),

          // [LAYER 2: KONTEN RESPONSIF]
          Positioned.fill(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              resizeToAvoidBottomInset:
                  true, // Form responsif (naik saat keyboard muncul)

              // KUNCI PERBAIKAN: Gunakan Stack di sini untuk memisah Fixed vs Scrollable
              body: Stack(
                children: [
                  // ===============================================
                  // 1. BAGIAN FORM (BISA DI-SCROLL)
                  // ===============================================
                  // Letakkan ini di lapisan bawah
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      child: SingleChildScrollView(
                        child: SizedBox(
                          // Kita tetapkan tingginya setinggi layar agar logika 'top: 188' tetap akurat
                          height: screenHeight,
                          child: Stack(
                            children: [
                              // FORM CONTENT (Posisi tetap sama)
                              Positioned(
                                top: 188,
                                left: 0,
                                right: 0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/login/reset_password.png',
                                      width: 114,
                                      height: 114,
                                      fit: BoxFit.contain,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Icon(Icons.broken_image,
                                            size: 114, color: Colors.grey);
                                      },
                                    ),
                                    const SizedBox(height: 24),
                                    SizedBox(
                                      width: 347,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                          SizedBox(height: 9),
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
                                    const SizedBox(height: 21),
                                    _buildResetCard(context),
                                    // Tambahan padding bawah agar aman saat scroll mentok
                                    const SizedBox(height: 100),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // ===============================================
                  // 2. BAGIAN TOMBOL BACK (FIXED / DIAM)
                  // ===============================================
                  // Diletakkan DI LUAR SingleChildScrollView dan paling bawah di Stack (Layer Paling Atas)
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
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/icons/ic_arrow_black.svg',
                                  width: 17,
                                  height: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ... (SISA KODE Widget _buildResetCard, _buildInputField, _showSuccessPopup SAMA SEPERTI SEBELUMNYA)
  // ... (TIDAK PERLU DIUBAH, CUKUP COPY-PASTE BAGIAN BAWAH KODE SEBELUMNYA) ...

  Widget _buildResetCard(BuildContext context) {
    return Container(
      width: 347,
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
          const Text(
            'New Password',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color(0xFF991B1C),
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            'Password must be at least 8 characters.',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color(0xFF991B1C),
            ),
          ),
          const SizedBox(height: 8),
          _buildInputField(
            hintText: 'Enter your new password',
            iconPath: 'assets/icons/ic_password.svg',
            isPassword: true,
            showEyeIcon: false,
            obscureText: _obscureNew,
            onToggle: () {},
          ),
          const SizedBox(height: 18),
          const Text(
            'Confirm New Password',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color(0xFF991B1C),
            ),
          ),
          const SizedBox(height: 8),
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
          const SizedBox(height: 24),
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
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  await Future.delayed(const Duration(milliseconds: 200));
                  if (context.mounted) {
                    _showSuccessPopup(context);
                  }
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

  // void _showSuccessPopup(BuildContext context) async {
  //   Future.delayed(const Duration(seconds: 2), () {
  //     if (context.mounted) {
  //       Navigator.of(context).pop();
  //     }
  //   });

  //   await showGeneralDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     barrierLabel: "Success Popup",
  //     barrierColor: Colors.black.withOpacity(0.35),
  //     transitionDuration: const Duration(milliseconds: 400),
  //     pageBuilder: (context, animation, secondaryAnimation) {
  //       return Center(
  //         child: Material(
  //           color: Colors.transparent,
  //           child: Container(
  //             width: 330,
  //             padding: const EdgeInsets.only(
  //                 left: 35, right: 35, top: 25, bottom: 30),
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(9),
  //             ),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Image.asset('assets/images/common/popup_lock.png',
  //                     width: 73, height: 73),
  //                 const SizedBox(height: 16),
  //                 const Text('Password updated',
  //                     textAlign: TextAlign.center,
  //                     style: TextStyle(
  //                         fontFamily: 'Poppins',
  //                         fontWeight: FontWeight.w600,
  //                         fontSize: 24,
  //                         color: Colors.black,
  //                         height: 1.0)),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     const Text('successfully',
  //                         style: TextStyle(
  //                             fontFamily: 'Poppins',
  //                             fontWeight: FontWeight.w600,
  //                             fontSize: 24,
  //                             color: Colors.black,
  //                             height: 1.0)),
  //                     const SizedBox(width: 7),
  //                     SvgPicture.asset('assets/icons/ic_checklist_popup.svg',
  //                         width: 36, height: 36),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //     transitionBuilder: (context, animation, secondaryAnimation, child) {
  //       var curve =
  //           CurvedAnimation(parent: animation, curve: Curves.easeOutBack);
  //       return ScaleTransition(
  //           scale: curve,
  //           child: FadeTransition(opacity: animation, child: child));
  //     },
  //   );

  //   if (context.mounted) {
  //     Navigator.of(context).pushAndRemoveUntil(
  //       MaterialPageRoute(builder: (_) => const LoginPage()),
  //       (route) => false,
  //     );
  //   }
  // }
  void _showSuccessPopup(BuildContext context) async {
    // 1. Timer: Tutup popup setelah 2 detik
    Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) {
        // Ini memicu animasi reverse (keluar) pada dialog
        Navigator.of(context).pop();
      }
    });

    // 2. Tampilkan Dialog (Menunggu sampai dialog benar-benar tertutup/selesai animasi)
    await showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: "Success Popup",
      barrierColor: Colors.black.withOpacity(0.35),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 330,
              padding: const EdgeInsets.only(
                  left: 35, right: 35, top: 25, bottom: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/common/popup_lock.png',
                      width: 73, height: 73),
                  const SizedBox(height: 16),
                  const Text(
                    'Password updated',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Colors.black,
                        height: 1.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'successfully',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Colors.black,
                            height: 1.0),
                      ),
                      const SizedBox(width: 7),
                      SvgPicture.asset('assets/icons/ic_checklist_popup.svg',
                          width: 36, height: 36),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        // [PERBAIKAN 1] Menambahkan reverseCurve
        var curve = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack, // Masuk: Membal sedikit (Pop!)
          reverseCurve:
              Curves.easeInBack, // Keluar: Menyusut ke dalam (Swoosh!)
        );

        return ScaleTransition(
          scale: curve,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    );

    // 3. Pindah ke Halaman Login dengan Animasi Fade (Halus)
    if (context.mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        // [PERBAIKAN 2] Menggunakan PageRouteBuilder untuk Fade Transition
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LoginPage(),
          transitionDuration:
              const Duration(milliseconds: 600), // Durasi transisi halaman
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
        (route) => false,
      );
    }
  }
}

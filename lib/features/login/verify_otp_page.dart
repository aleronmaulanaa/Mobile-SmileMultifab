// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'reset_password_page.dart';

// class VerifyOtpPage extends StatefulWidget {
//   const VerifyOtpPage({super.key});

//   @override
//   State<VerifyOtpPage> createState() => _VerifyOtpPageState();
// }

// class _VerifyOtpPageState extends State<VerifyOtpPage> {
//   final List<TextEditingController> _controllers =
//       List.generate(5, (_) => TextEditingController());
//   final List<FocusNode> _focusNodes = List.generate(5, (_) => FocusNode());

//   @override
//   void dispose() {
//     for (final c in _controllers) c.dispose();
//     for (final f in _focusNodes) f.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;

//     return GestureDetector(
//       onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: SingleChildScrollView(
//           child: SizedBox(
//             height: screenHeight,
//             child: Stack(
//               children: [
//                 Positioned.fill(
//                   child: Image.asset(
//                     'assets/images/login/bg_login_page.JPEG',
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) =>
//                         Container(color: Colors.white),
//                   ),
//                 ),
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
//                             child: Center(
//                               child: SvgPicture.asset(
//                                 'assets/icons/ic_arrow_black.svg',
//                                 width: 17,
//                                 height: 17,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 184,
//                   left: 0,
//                   right: 0,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         'assets/images/login/verify_otp.png',
//                         width: 114,
//                         height: 114,
//                         fit: BoxFit.contain,
//                         errorBuilder: (context, error, stackTrace) {
//                           return const Icon(Icons.broken_image,
//                               size: 114, color: Colors.grey);
//                         },
//                       ),
//                       const SizedBox(height: 27),
//                       const Text(
//                         'Verify OTP Now',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w600,
//                           fontSize: 24,
//                           color: Color(0xFFFA0209),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       const Text(
//                         'Enter the 5-Digit Code Sent to You',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w600,
//                           fontSize: 14,
//                           color: Color(0xFF991B1C),
//                         ),
//                       ),
//                       const SizedBox(height: 38),
//                       SizedBox(
//                         width: 377,
//                         height: 69,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: List.generate(5, (index) {
//                             return Container(
//                               width: 69,
//                               height: 69,
//                               decoration: BoxDecoration(
//                                 color: const Color(0xFFF2F2F2),
//                                 borderRadius: BorderRadius.circular(13),
//                                 border: Border.all(
//                                   color: const Color(0xFFA0A0A0),
//                                   width: 1,
//                                 ),
//                               ),
//                               alignment: Alignment.center,
//                               child: TextField(
//                                 controller: _controllers[index],
//                                 focusNode: _focusNodes[index],
//                                 maxLength: 1,
//                                 textAlign: TextAlign.center,
//                                 keyboardType: TextInputType.number,
//                                 textAlignVertical: TextAlignVertical.center,
//                                 inputFormatters: [
//                                   FilteringTextInputFormatter.digitsOnly,
//                                 ],
//                                 style: const TextStyle(
//                                   fontFamily: 'Poppins',
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.black,
//                                 ),
//                                 decoration: const InputDecoration(
//                                   counterText: '',
//                                   border: InputBorder.none,
//                                   isDense: true,
//                                   contentPadding: EdgeInsets.zero,
//                                 ),
//                                 onChanged: (value) {
//                                   if (value.isNotEmpty && index < 4) {
//                                     _focusNodes[index + 1].requestFocus();
//                                   }
//                                   if (value.isEmpty && index > 0) {
//                                     _focusNodes[index - 1].requestFocus();
//                                   }
//                                 },
//                               ),
//                             );
//                           }),
//                         ),
//                       ),
//                       const SizedBox(height: 53),
//                       SizedBox(
//                         width: 262,
//                         height: 36,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFFFA0007),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(18),
//                             ),
//                             elevation: 0,
//                           ),
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               PageRouteBuilder(
//                                 pageBuilder:
//                                     (context, animation, secondaryAnimation) =>
//                                         const ResetPasswordPage(),
//                                 transitionsBuilder: (context, animation,
//                                     secondaryAnimation, child) {
//                                   const begin = Offset(1.0, 0.0);
//                                   const end = Offset.zero;
//                                   const curve = Curves.easeInOut;

//                                   var tween = Tween(begin: begin, end: end)
//                                       .chain(CurveTween(curve: curve));
//                                   var offsetAnimation = animation.drive(tween);

//                                   return SlideTransition(
//                                     position: offsetAnimation,
//                                     child: child,
//                                   );
//                                 },
//                                 transitionDuration:
//                                     const Duration(milliseconds: 500),
//                               ),
//                             );
//                           },
//                           child: const Text(
//                             'Verify',
//                             style: TextStyle(
//                               fontFamily: 'Poppins',
//                               fontWeight: FontWeight.w600,
//                               fontSize: 15,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
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
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'reset_password_page.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({super.key});

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  final List<TextEditingController> _controllers =
      List.generate(5, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(5, (_) => FocusNode());

  @override
  void dispose() {
    for (final c in _controllers) c.dispose();
    for (final f in _focusNodes) f.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    // [LAYER 1: BACKGROUND STATIS]
    // Scaffold Luar: resizeToAvoidBottomInset = FALSE (Background Diam)
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          // Scaffold Dalam: resizeToAvoidBottomInset = TRUE (Form Naik)
          Positioned.fill(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              resizeToAvoidBottomInset: true,

              // Gunakan Stack untuk memisahkan Fixed Header vs Scrollable Form
              body: Stack(
                children: [
                  // ===============================================
                  // 1. BAGIAN FORM (BISA DI-SCROLL)
                  // ===============================================
                  // Letakkan di lapisan paling bawah
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      child: SingleChildScrollView(
                        child: SizedBox(
                          height: screenHeight,
                          child: Stack(
                            children: [
                              // KONTEN UTAMA (Image, Text, OTP Input, Button)
                              Positioned(
                                top: 184, // Posisi sesuai kode asli Anda
                                left: 0,
                                right: 0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/login/verify_otp.png',
                                      width: 114,
                                      height: 114,
                                      fit: BoxFit.contain,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Icon(Icons.broken_image,
                                            size: 114, color: Colors.grey);
                                      },
                                    ),
                                    const SizedBox(height: 27),
                                    const Text(
                                      'Verify OTP Now',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24,
                                        color: Color(0xFFFA0209),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const Text(
                                      'Enter the 5-Digit Code Sent to You',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Color(0xFF991B1C),
                                      ),
                                    ),
                                    const SizedBox(height: 38),

                                    // OTP INPUT FIELD
                                    SizedBox(
                                      width: 377,
                                      height: 69,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: List.generate(5, (index) {
                                          return Container(
                                            width: 69,
                                            height: 69,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFF2F2F2),
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                              border: Border.all(
                                                color: const Color(0xFFA0A0A0),
                                                width: 1,
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            child: TextField(
                                              controller: _controllers[index],
                                              focusNode: _focusNodes[index],
                                              maxLength: 1,
                                              textAlign: TextAlign.center,
                                              keyboardType:
                                                  TextInputType.number,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                              ],
                                              style: const TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                              ),
                                              decoration: const InputDecoration(
                                                counterText: '',
                                                border: InputBorder.none,
                                                isDense: true,
                                                contentPadding: EdgeInsets.zero,
                                              ),
                                              onChanged: (value) {
                                                if (value.isNotEmpty &&
                                                    index < 4) {
                                                  _focusNodes[index + 1]
                                                      .requestFocus();
                                                }
                                                if (value.isEmpty &&
                                                    index > 0) {
                                                  _focusNodes[index - 1]
                                                      .requestFocus();
                                                }
                                              },
                                            ),
                                          );
                                        }),
                                      ),
                                    ),

                                    const SizedBox(height: 53),

                                    // VERIFY BUTTON
                                    SizedBox(
                                      width: 262,
                                      height: 36,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFFFA0007),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                          ),
                                          elevation: 0,
                                        ),
                                        onPressed: () async {
                                          // 1. Tutup Keyboard
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();

                                          // 2. Tunggu animasi keyboard turun (opsional, tapi lebih rapi)
                                          await Future.delayed(const Duration(
                                              milliseconds: 200));

                                          if (context.mounted) {
                                            // 3. Pindah Halaman dengan Animasi Slide
                                            Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                pageBuilder: (context,
                                                        animation,
                                                        secondaryAnimation) =>
                                                    const ResetPasswordPage(),
                                                transitionsBuilder: (context,
                                                    animation,
                                                    secondaryAnimation,
                                                    child) {
                                                  const begin =
                                                      Offset(1.0, 0.0);
                                                  const end = Offset.zero;
                                                  const curve =
                                                      Curves.easeInOut;

                                                  var tween = Tween(
                                                          begin: begin,
                                                          end: end)
                                                      .chain(CurveTween(
                                                          curve: curve));
                                                  var offsetAnimation =
                                                      animation.drive(tween);

                                                  return SlideTransition(
                                                    position: offsetAnimation,
                                                    child: child,
                                                  );
                                                },
                                                transitionDuration:
                                                    const Duration(
                                                        milliseconds: 500),
                                              ),
                                            );
                                          }
                                        },
                                        child: const Text(
                                          'Verify',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Tambahan padding bawah agar aman saat scroll
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
                  // Posisinya Absolut dan di luar ScrollView
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
}

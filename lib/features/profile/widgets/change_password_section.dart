// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class ChangePasswordSection extends StatefulWidget {
//   final VoidCallback onBack;
//   final VoidCallback onSuccess; // Callback baru saat sukses

//   const ChangePasswordSection({
//     super.key,
//     required this.onBack,
//     required this.onSuccess,
//   });

//   @override
//   State<ChangePasswordSection> createState() => _ChangePasswordSectionState();
// }

// class _ChangePasswordSectionState extends State<ChangePasswordSection> {
//   bool _obscureCurrent = true;
//   bool _obscureNew = true;
//   bool _obscureConfirm = true;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // TAMBAHAN 2: Logika untuk menutup keyboard
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       // Container Anda yang lama masuk ke sini sebagai child
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
//           child: SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 10), //ini

//                 // HEADER
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25),
//                   child: Stack(
//                     alignment: Alignment.centerLeft,
//                     children: [
//                       GestureDetector(
//                         onTap: widget.onBack,
//                         child: SvgPicture.asset(
//                           'assets/icons/ic_arrow-back-left.svg',
//                           width: 27,
//                           height: 27,
//                         ),
//                       ),
//                       Center(
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Image.asset(
//                               'assets/images/profile/change_password.png',
//                               width: 24,
//                               height: 24,
//                               fit: BoxFit.contain,
//                             ),
//                             const SizedBox(width: 15),
//                             const Text(
//                               'Change Password',
//                               style: TextStyle(
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 12,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 20), //ini

//                 // FORM 1
//                 _buildCenteredFormBlock(
//                   child: _buildPasswordSection(
//                     label: 'Current Password',
//                     hintText: 'Enter your current password',
//                     obscureText: _obscureCurrent,
//                     onToggle: () =>
//                         setState(() => _obscureCurrent = !_obscureCurrent),
//                   ),
//                 ),

//                 const SizedBox(height: 18),

//                 // FORM 2
//                 _buildCenteredFormBlock(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'New Password',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w600,
//                           fontSize: 12,
//                           color: Color(0xFF991B1C),
//                         ),
//                       ),
//                       const SizedBox(height: 3),
//                       const Text(
//                         'Password must be at least 8 characters.',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w600,
//                           fontSize: 12,
//                           color: Color(0xFF991B1C),
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       _buildInputField(
//                         hintText: 'Enter a new password',
//                         obscureText: _obscureNew,
//                         showEyeIcon: false,
//                         onToggle: () {},
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 18),

//                 // FORM 3
//                 _buildCenteredFormBlock(
//                   child: _buildPasswordSection(
//                     label: 'Confirm New Password',
//                     hintText: 'Re-enter your new password',
//                     obscureText: _obscureConfirm,
//                     onToggle: () =>
//                         setState(() => _obscureConfirm = !_obscureConfirm),
//                   ),
//                 ),

//                 const SizedBox(height: 12),

//                 // TOMBOL SAVE
//                 SizedBox(
//                   width: 262,
//                   height: 36,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Tutup keyboard
//                       FocusManager.instance.primaryFocus?.unfocus();
//                       // Panggil callback onSuccess milik Parent
//                       widget.onSuccess();
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFFFA0007),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//                       elevation: 0,
//                     ),
//                     child: const Text(
//                       'Save Changes',
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w600,
//                         fontSize: 15,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),

//                 // PADDING BAWAH AGAR TOMBOL TIDAK KENA NAVBAR
//                 const SizedBox(height: 50),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // --- HELPERS (Tetap sama) ---
//   Widget _buildCenteredFormBlock({required Widget child}) {
//     return Center(child: SizedBox(width: 314, child: child));
//   }

//   Widget _buildPasswordSection({
//     required String label,
//     required String hintText,
//     required bool obscureText,
//     required VoidCallback onToggle,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontFamily: 'Poppins',
//             fontWeight: FontWeight.w600,
//             fontSize: 12,
//             color: Color(0xFF991B1C),
//           ),
//         ),
//         const SizedBox(height: 8),
//         _buildInputField(
//           hintText: hintText,
//           obscureText: obscureText,
//           showEyeIcon: true,
//           onToggle: onToggle,
//         ),
//       ],
//     );
//   }

//   Widget _buildInputField({
//     required String hintText,
//     required bool obscureText,
//     required bool showEyeIcon,
//     required VoidCallback onToggle,
//   }) {
//     return Container(
//       width: double.infinity,
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
//             'assets/icons/ic_password.svg',
//             width: 21,
//             height: 21,
//             fit: BoxFit.contain,
//           ),
//           const SizedBox(width: 5),
//           Expanded(
//             child: TextField(
//               obscureText: showEyeIcon ? obscureText : true,
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
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class ChangePasswordSection extends StatefulWidget {
//   final VoidCallback onBack;
//   final VoidCallback onSuccess;

//   const ChangePasswordSection({
//     super.key,
//     required this.onBack,
//     required this.onSuccess,
//   });

//   @override
//   State<ChangePasswordSection> createState() => _ChangePasswordSectionState();
// }

// class _ChangePasswordSectionState extends State<ChangePasswordSection> {
//   bool _obscureCurrent = true;
//   bool _obscureNew = true;
//   bool _obscureConfirm = true;

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;

//     return GestureDetector(
//       onTap: () {
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       child: SafeArea(
//         top: false,
//         child: Container(
//           width: double.infinity,
//           height: screenHeight, // 🔥 CARD PUTIH FULL TINGGI LAYAR
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(40),
//               topRight: Radius.circular(40),
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.25),
//                 offset: const Offset(0, -3),
//                 blurRadius: 4,
//               ),
//             ],
//           ),
//           child: ClipRRect(
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(40),
//               topRight: Radius.circular(40),
//             ),
//             child: SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               padding: const EdgeInsets.symmetric(vertical: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const SizedBox(height: 10),

//                   // HEADER
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 25),
//                     child: Stack(
//                       alignment: Alignment.centerLeft,
//                       children: [
//                         GestureDetector(
//                           onTap: widget.onBack,
//                           child: SvgPicture.asset(
//                             'assets/icons/ic_arrow-back-left.svg',
//                             width: 27,
//                             height: 27,
//                           ),
//                         ),
//                         Center(
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Image.asset(
//                                 'assets/images/profile/change_password.png',
//                                 width: 24,
//                                 height: 24,
//                               ),
//                               const SizedBox(width: 15),
//                               const Text(
//                                 'Change Password',
//                                 style: TextStyle(
//                                   fontFamily: 'Poppins',
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 12,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   // FORM 1
//                   _buildCenteredFormBlock(
//                     child: _buildPasswordSection(
//                       label: 'Current Password',
//                       hintText: 'Enter your current password',
//                       obscureText: _obscureCurrent,
//                       onToggle: () =>
//                           setState(() => _obscureCurrent = !_obscureCurrent),
//                     ),
//                   ),

//                   const SizedBox(height: 18),

//                   // FORM 2
//                   _buildCenteredFormBlock(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'New Password',
//                           style: TextStyle(
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.w600,
//                             fontSize: 12,
//                             color: Color(0xFF991B1C),
//                           ),
//                         ),
//                         const SizedBox(height: 3),
//                         const Text(
//                           'Password must be at least 8 characters.',
//                           style: TextStyle(
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.w600,
//                             fontSize: 12,
//                             color: Color(0xFF991B1C),
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         _buildInputField(
//                           hintText: 'Enter a new password',
//                           obscureText: _obscureNew,
//                           showEyeIcon: false,
//                           onToggle: () {},
//                         ),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(height: 18),

//                   // FORM 3
//                   _buildCenteredFormBlock(
//                     child: _buildPasswordSection(
//                       label: 'Confirm New Password',
//                       hintText: 'Re-enter your new password',
//                       obscureText: _obscureConfirm,
//                       onToggle: () =>
//                           setState(() => _obscureConfirm = !_obscureConfirm),
//                     ),
//                   ),

//                   const SizedBox(height: 12),

//                   // BUTTON
//                   SizedBox(
//                     width: 262,
//                     height: 36,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         FocusManager.instance.primaryFocus?.unfocus();
//                         widget.onSuccess();
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFFFA0007),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(18),
//                         ),
//                         elevation: 0,
//                       ),
//                       child: const Text(
//                         'Save Changes',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w600,
//                           fontSize: 15,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 50),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // ===== HELPERS =====

//   Widget _buildCenteredFormBlock({required Widget child}) {
//     return Center(child: SizedBox(width: 314, child: child));
//   }

//   Widget _buildPasswordSection({
//     required String label,
//     required String hintText,
//     required bool obscureText,
//     required VoidCallback onToggle,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontFamily: 'Poppins',
//             fontWeight: FontWeight.w600,
//             fontSize: 12,
//             color: Color(0xFF991B1C),
//           ),
//         ),
//         const SizedBox(height: 8),
//         _buildInputField(
//           hintText: hintText,
//           obscureText: obscureText,
//           showEyeIcon: true,
//           onToggle: onToggle,
//         ),
//       ],
//     );
//   }

//   Widget _buildInputField({
//     required String hintText,
//     required bool obscureText,
//     required bool showEyeIcon,
//     required VoidCallback onToggle,
//   }) {
//     return Container(
//       height: 42,
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF2F2F2),
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Row(
//         children: [
//           SvgPicture.asset(
//             'assets/icons/ic_password.svg',
//             width: 21,
//             height: 21,
//           ),
//           const SizedBox(width: 5),
//           Expanded(
//             child: TextField(
//               obscureText: showEyeIcon ? obscureText : true,
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 hintText: hintText,
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
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangePasswordSection extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onSuccess;
  final double? height;

  const ChangePasswordSection({
    super.key,
    required this.onBack,
    required this.onSuccess,
    this.height,
  });

  @override
  State<ChangePasswordSection> createState() => _ChangePasswordSectionState();
}

class _ChangePasswordSectionState extends State<ChangePasswordSection> {
  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        top: false,
        // child: Container(
        //   width: double.infinity,
        //   height: screenHeight, // 🔥 CARD PUTIH FULL TINGGI LAYAR
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: const BorderRadius.only(
        //       topLeft: Radius.circular(40),
        //       topRight: Radius.circular(40),
        //     ),
        //     boxShadow: [
        //       BoxShadow(
        //         color: Colors.black.withOpacity(0.25),
        //         offset: const Offset(0, -3),
        //         blurRadius: 4,
        //       ),
        //     ],
        //   ),
        //   child: ClipRRect(
        //     borderRadius: const BorderRadius.only(
        //       topLeft: Radius.circular(40),
        //       topRight: Radius.circular(40),
        //     ),
        //     child: SingleChildScrollView(
        //       physics: const BouncingScrollPhysics(),
        //       padding: const EdgeInsets.symmetric(vertical: 10),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        child: Container(
          width: double.infinity, // tetap full layar
          height: widget.height ??
              MediaQuery.of(context).size.height *
                  0.7, // ganti tinggi sesuai kebutuhan
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
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),

                  // HEADER
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        GestureDetector(
                          onTap: widget.onBack,
                          child: SvgPicture.asset(
                            'assets/icons/ic_arrow-back-left.svg',
                            width: 27,
                            height: 27,
                          ),
                        ),
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/images/profile/change_password.png',
                                width: 24,
                                height: 24,
                              ),
                              const SizedBox(width: 15),
                              const Text(
                                'Change Password',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // FORM 1
                  _buildCenteredFormBlock(
                    child: _buildPasswordSection(
                      label: 'Current Password',
                      hintText: 'Enter your current password',
                      obscureText: _obscureCurrent,
                      onToggle: () =>
                          setState(() => _obscureCurrent = !_obscureCurrent),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // FORM 2
                  _buildCenteredFormBlock(
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
                          hintText: 'Enter a new password',
                          obscureText: _obscureNew,
                          showEyeIcon: false,
                          onToggle: () {},
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  // FORM 3
                  _buildCenteredFormBlock(
                    child: _buildPasswordSection(
                      label: 'Confirm New Password',
                      hintText: 'Re-enter your new password',
                      obscureText: _obscureConfirm,
                      onToggle: () =>
                          setState(() => _obscureConfirm = !_obscureConfirm),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // BUTTON
                  SizedBox(
                    width: 262,
                    height: 36,
                    child: ElevatedButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        widget.onSuccess();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFA0007),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Save Changes',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ===== HELPERS =====

  Widget _buildCenteredFormBlock({required Widget child}) {
    return Center(child: SizedBox(width: 314, child: child));
  }

  Widget _buildPasswordSection({
    required String label,
    required String hintText,
    required bool obscureText,
    required VoidCallback onToggle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: Color(0xFF991B1C),
          ),
        ),
        const SizedBox(height: 8),
        _buildInputField(
          hintText: hintText,
          obscureText: obscureText,
          showEyeIcon: true,
          onToggle: onToggle,
        ),
      ],
    );
  }

  Widget _buildInputField({
    required String hintText,
    required bool obscureText,
    required bool showEyeIcon,
    required VoidCallback onToggle,
  }) {
    return Container(
      height: 42,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/ic_password.svg',
            width: 21,
            height: 21,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: TextField(
              obscureText: showEyeIcon ? obscureText : true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
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
              ),
            ),
        ],
      ),
    );
  }
}

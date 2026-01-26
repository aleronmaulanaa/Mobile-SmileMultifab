// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class ChangePasswordSection extends StatefulWidget {
//   final VoidCallback onBack;
//   final VoidCallback onSuccess;
//   final double? height; // Opsional, sesuai kode Anda

//   const ChangePasswordSection({
//     super.key,
//     required this.onBack,
//     required this.onSuccess,
//     this.height,
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
//     // 1. Deteksi Keyboard & Tinggi Layar
//     final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
//     final double screenHeight = MediaQuery.of(context).size.height;

//     return GestureDetector(
//       onTap: () {
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       child: Container(
//         width: double.infinity,

//         // ============================================================
//         // 🔥 INI BAGIAN PENTING YANG ANDA MINTA (TIDAK SAYA HILANGKAN)
//         // ============================================================
//         // Logikanya:
//         // - Jika Keyboard BUKA: Gunakan double.infinity (Supaya card mau memanjang ke atas mengikuti ProfileScreen)
//         // - Jika Keyboard TUTUP: Gunakan 0.4 * screenHeight (Supaya tinggi card pas 40% sesuai keinginan Anda)
//         height: isKeyboardOpen
//             ? double.infinity
//             : (widget.height ?? screenHeight * 0.4),

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
//                 const SizedBox(height: 20),

//                 // ===========================
//                 // DESIGN LAMA (HEADER)
//                 // ===========================
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

//                 const SizedBox(height: 25),

//                 // ===========================
//                 // FORM 1 (Current)
//                 // ===========================
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

//                 // ===========================
//                 // FORM 2 (New)
//                 // ===========================
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

//                 // ===========================
//                 // FORM 3 (Confirm)
//                 // ===========================
//                 _buildCenteredFormBlock(
//                   child: _buildPasswordSection(
//                     label: 'Confirm New Password',
//                     hintText: 'Re-enter your new password',
//                     obscureText: _obscureConfirm,
//                     onToggle: () =>
//                         setState(() => _obscureConfirm = !_obscureConfirm),
//                   ),
//                 ),

//                 const SizedBox(height: 24),

//                 // ===========================
//                 // TOMBOL SAVE (DESIGN LAMA)
//                 // ===========================
//                 SizedBox(
//                   width: 262,
//                   height: 36,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       FocusManager.instance.primaryFocus?.unfocus();
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

//                 const SizedBox(height: 50),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // --- HELPERS (SAMA PERSIS DENGAN DESIGN LAMA) ---
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
    // 1. Deteksi Tinggi Keyboard
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final bool isKeyboardOpen = keyboardHeight > 0;
    final double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
        width: double.infinity,

        // ============================================================
        // LOGIKA TINGGI CARD
        // ============================================================
        height: isKeyboardOpen
            ? double.infinity
            : (widget.height ?? screenHeight * 0.4),

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
            // 🔥 UPDATE 1: Gunakan AlwaysScrollableScrollPhysics
            // Agar user tetap bisa scroll (bouncing) meskipun kontennya sedikit
            physics: const AlwaysScrollableScrollPhysics(),

            // 🔥 UPDATE 2: Padding Bawah Dinamis
            // Jika keyboard muncul, tambah padding sebesar tinggi keyboard + 20
            // Ini memastikan tombol "Save" bisa di-scroll sampai terlihat di atas keyboard
            padding: EdgeInsets.only(
              top: 10,
              left: 0,
              right: 0,
              bottom: isKeyboardOpen ? keyboardHeight + 20 : 50,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 15),

                // ===========================
                // HEADER
                // ===========================
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
                              fit: BoxFit.contain,
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

                const SizedBox(height: 25),

                // ===========================
                // FORM 1 (Current)
                // ===========================
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

                // ===========================
                // FORM 2 (New)
                // ===========================
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

                // ===========================
                // FORM 3 (Confirm)
                // ===========================
                _buildCenteredFormBlock(
                  child: _buildPasswordSection(
                    label: 'Confirm New Password',
                    hintText: 'Re-enter your new password',
                    obscureText: _obscureConfirm,
                    onToggle: () =>
                        setState(() => _obscureConfirm = !_obscureConfirm),
                  ),
                ),

                const SizedBox(height: 24),

                // ===========================
                // TOMBOL SAVE
                // ===========================
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- HELPERS (TIDAK BERUBAH) ---
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
      width: double.infinity,
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
            'assets/icons/ic_password.svg',
            width: 21,
            height: 21,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: TextField(
              obscureText: showEyeIcon ? obscureText : true,
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
}

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class ChangePasswordSection extends StatefulWidget {
//   final VoidCallback onBack;

//   const ChangePasswordSection({
//     super.key,
//     required this.onBack,
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
//           physics: const BouncingScrollPhysics(),
//           // Padding horizontal dikurangi sedikit atau bisa dihilangkan
//           // karena kita akan mengatur lebar konten secara spesifik (314)
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center, // Default center
//             children: [
//               const SizedBox(height: 16),

//               // ===============================================
//               // HEADER: BACK + ICON + JUDUL (POSISI TETAP)
//               // ===============================================
//               // Kita beri padding horizontal manual disini agar tombol back tidak mepet pinggir
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25),
//                 child: Stack(
//                   alignment: Alignment.centerLeft,
//                   children: [
//                     GestureDetector(
//                       onTap: widget.onBack,
//                       child: SvgPicture.asset(
//                         'assets/icons/ic_arrow-back-left.svg',
//                         width: 27,
//                         height: 27,
//                       ),
//                     ),
//                     Center(
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Image.asset(
//                             'assets/images/profile/change_password.png',
//                             width: 24,
//                             height: 24,
//                             fit: BoxFit.contain,
//                           ),
//                           const SizedBox(width: 15),
//                           const Text(
//                             'Change Password',
//                             style: TextStyle(
//                               fontFamily: 'Poppins',
//                               fontWeight: FontWeight.w600,
//                               fontSize: 12,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 25),

//               // ===============================================
//               // FORM 1: CURRENT PASSWORD (WIDTH 314 & CENTERED)
//               // ===============================================
//               _buildCenteredFormBlock(
//                 child: _buildPasswordSection(
//                   label: 'Current Password',
//                   hintText: 'Enter your current password',
//                   obscureText: _obscureCurrent,
//                   onToggle: () =>
//                       setState(() => _obscureCurrent = !_obscureCurrent),
//                 ),
//               ),

//               const SizedBox(height: 18),

//               // ===============================================
//               // FORM 2: NEW PASSWORD (WIDTH 314 & CENTERED)
//               // ===============================================
//               _buildCenteredFormBlock(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'New Password',
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w600,
//                         fontSize: 12,
//                         color: Color(0xFF991B1C),
//                       ),
//                     ),
//                     const SizedBox(height: 3),
//                     const Text(
//                       'Password must be at least 8 characters.',
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w600,
//                         fontSize: 12,
//                         color: Color(0xFF991B1C),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     _buildInputField(
//                       hintText: 'Enter a new password',
//                       obscureText: _obscureNew,
//                       showEyeIcon: false,
//                       onToggle: () {},
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 18),

//               // ===============================================
//               // FORM 3: CONFIRM NEW PASSWORD (WIDTH 314 & CENTERED)
//               // ===============================================
//               _buildCenteredFormBlock(
//                 child: _buildPasswordSection(
//                   label: 'Confirm New Password',
//                   hintText: 'Re-enter your new password',
//                   obscureText: _obscureConfirm,
//                   onToggle: () =>
//                       setState(() => _obscureConfirm = !_obscureConfirm),
//                 ),
//               ),

//               const SizedBox(height: 24),

//               // ===============================================
//               // TOMBOL SAVE CHANGES (WIDTH 262 & CENTERED)
//               // ===============================================
//               SizedBox(
//                 width: 262, // Lebar tombol dikunci 262
//                 height: 36,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFFFA0007),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(18),
//                     ),
//                     elevation: 0,
//                   ),
//                   child: const Text(
//                     'Save Changes',
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w600,
//                       fontSize: 15,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 50),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // --- HELPER UNTUK MEMBUAT FORM WIDTH 314 ---
//   // Widget ini memastikan isi form lebarnya 314 dan berada di tengah,
//   // tapi text label di dalamnya tetap rata kiri terhadap kotak input.
//   Widget _buildCenteredFormBlock({required Widget child}) {
//     return Center(
//       child: SizedBox(
//         width: 314, // Lebar Form dikunci 314
//         child: child,
//       ),
//     );
//   }

//   Widget _buildPasswordSection({
//     required String label,
//     required String hintText,
//     required bool obscureText,
//     required VoidCallback onToggle,
//   }) {
//     return Column(
//       crossAxisAlignment:
//           CrossAxisAlignment.start, // Label rata kiri terhadap kotak input
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
//       width: double.infinity, // Akan mengisi lebar 314 dari parent SizedBox
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

// import 'dart:async'; // WAJIB ADA: Untuk Timer
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class ChangePasswordSection extends StatefulWidget {
//   final VoidCallback onBack;

//   const ChangePasswordSection({
//     super.key,
//     required this.onBack,
//   });

//   @override
//   State<ChangePasswordSection> createState() => _ChangePasswordSectionState();
// }

// class _ChangePasswordSectionState extends State<ChangePasswordSection> {
//   // State Input Password
//   bool _obscureCurrent = true;
//   bool _obscureNew = true;
//   bool _obscureConfirm = true;

//   // State untuk Menampilkan Card Sukses
//   bool _isSuccess = false;

//   @override
//   Widget build(BuildContext context) {
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
//         // ANIMATED SWITCHER:
//         // Berfungsi menukar tampilan FORM dengan tampilan SUKSES
//         child: AnimatedSwitcher(
//           duration: const Duration(milliseconds: 600),
//           switchInCurve: Curves.easeInOutQuart,
//           switchOutCurve: Curves.easeInOutQuart,
//           transitionBuilder: (Widget child, Animation<double> animation) {
//             // Animasi Slide Menimpa dari Kanan
//             final offsetAnimation = Tween<Offset>(
//               begin: const Offset(1.0, 0.0),
//               end: Offset.zero,
//             ).animate(animation);
//             return SlideTransition(
//               position: offsetAnimation,
//               child: child,
//             );
//           },
//           // LOGIKA UTAMA: Pilih tampilan berdasarkan state _isSuccess
//           child: _isSuccess
//               ? _buildSuccessView() // TAMPILAN 2: SUKSES
//               : _buildFormView(), // TAMPILAN 1: FORMULIR
//         ),
//       ),
//     );
//   }

//   // ===============================================
//   // TAMPILAN 1: FORMULIR CHANGE PASSWORD
//   // ===============================================
//   Widget _buildFormView() {
//     return SingleChildScrollView(
//       key: const ValueKey('FormView'), // Key penting untuk animasi
//       physics: const BouncingScrollPhysics(),
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const SizedBox(height: 16),

//           // HEADER (BACK + ICON + JUDUL)
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 25),
//             child: Stack(
//               alignment: Alignment.centerLeft,
//               children: [
//                 GestureDetector(
//                   onTap: widget.onBack,
//                   child: SvgPicture.asset(
//                     'assets/icons/ic_arrow-back-left.svg',
//                     width: 27,
//                     height: 27,
//                   ),
//                 ),
//                 Center(
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Image.asset(
//                         'assets/images/profile/change_password.png',
//                         width: 24,
//                         height: 24,
//                         fit: BoxFit.contain,
//                       ),
//                       const SizedBox(width: 15),
//                       const Text(
//                         'Change Password',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w600,
//                           fontSize: 12,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 25),

//           // FORM 1: CURRENT PASSWORD
//           _buildCenteredFormBlock(
//             child: _buildPasswordSection(
//               label: 'Current Password',
//               hintText: 'Enter your current password',
//               obscureText: _obscureCurrent,
//               onToggle: () =>
//                   setState(() => _obscureCurrent = !_obscureCurrent),
//             ),
//           ),

//           const SizedBox(height: 18),

//           // FORM 2: NEW PASSWORD
//           _buildCenteredFormBlock(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'New Password',
//                   style: TextStyle(
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w600,
//                     fontSize: 12,
//                     color: Color(0xFF991B1C),
//                   ),
//                 ),
//                 const SizedBox(height: 3),
//                 const Text(
//                   'Password must be at least 8 characters.',
//                   style: TextStyle(
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w600,
//                     fontSize: 12,
//                     color: Color(0xFF991B1C),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 _buildInputField(
//                   hintText: 'Enter a new password',
//                   obscureText: _obscureNew,
//                   showEyeIcon: false,
//                   onToggle: () {},
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 18),

//           // FORM 3: CONFIRM NEW PASSWORD
//           _buildCenteredFormBlock(
//             child: _buildPasswordSection(
//               label: 'Confirm New Password',
//               hintText: 'Re-enter your new password',
//               obscureText: _obscureConfirm,
//               onToggle: () =>
//                   setState(() => _obscureConfirm = !_obscureConfirm),
//             ),
//           ),

//           const SizedBox(height: 24),

//           // TOMBOL SAVE CHANGES
//           SizedBox(
//             width: 262,
//             height: 36,
//             child: ElevatedButton(
//               // PENTING: Panggil fungsi _handleSaveChanges di sini
//               onPressed: _handleSaveChanges,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFFFA0007),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(18),
//                 ),
//                 elevation: 0,
//               ),
//               child: const Text(
//                 'Save Changes',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                   fontSize: 15,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),

//           const SizedBox(height: 100),
//         ],
//       ),
//     );
//   }

//   // ===============================================
//   // TAMPILAN 2: SUKSES (SLIDE IN)
//   // ===============================================
//   Widget _buildSuccessView() {
//     return Container(
//       key: const ValueKey('SuccessView'), // Key penting untuk animasi
//       width: double.infinity,
//       height: double.infinity,
//       color: Colors.white, // Background putih
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center, // Posisi Tengah Vertikal
//         children: [
//           // Gambar Gembok (Sesuai reset_password_page)
//           Image.asset(
//             'assets/images/profile/popup_lock.png',
//             width: 73,
//             height: 73,
//             fit: BoxFit.contain,
//           ),

//           const SizedBox(height: 16),

//           // Text Password updated
//           const Text(
//             'Password updated',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontFamily: 'Poppins',
//               fontWeight: FontWeight.w600,
//               fontSize: 24,
//               color: Colors.black,
//               height: 1.0,
//             ),
//           ),

//           // Row: successfully + Checklist Icon
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'successfully',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                   fontSize: 24,
//                   color: Colors.black,
//                   height: 1.0,
//                 ),
//               ),
//               const SizedBox(width: 7),
//               SvgPicture.asset(
//                 'assets/icons/checklist_popup.svg',
//                 width: 36,
//                 height: 36,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // ===============================================
//   // LOGIKA TOMBOL SAVE
//   // ===============================================
//   void _handleSaveChanges() {
//     // 1. Tutup Keyboard agar tampilan bersih
//     FocusManager.instance.primaryFocus?.unfocus();

//     // 2. Ubah state menjadi Sukses -> Ini akan memicu animasi ganti tampilan
//     setState(() {
//       _isSuccess = true;
//     });

//     // 3. Mulai Timer 4 Detik
//     Timer(const Duration(seconds: 4), () {
//       // Cek apakah widget masih aktif (mounted) sebelum memanggil fungsi
//       if (mounted) {
//         // Panggil onBack() milik parent untuk menutup card ini
//         // Efeknya: Card ini (yang sedang menampilkan sukses) akan slide keluar
//         widget.onBack();
//       }
//     });
//   }

//   // ===============================================
//   // HELPER WIDGETS
//   // ===============================================
//   Widget _buildCenteredFormBlock({required Widget child}) {
//     return Center(
//       child: SizedBox(
//         width: 314,
//         child: child,
//       ),
//     );
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
  final VoidCallback onSuccess; // Callback baru saat sukses

  const ChangePasswordSection({
    super.key,
    required this.onBack,
    required this.onSuccess,
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
    return GestureDetector(
      onTap: () {
        // TAMBAHAN 2: Logika untuk menutup keyboard
        FocusManager.instance.primaryFocus?.unfocus();
      },
      // Container Anda yang lama masuk ke sini sebagai child
      child: Container(
        width: double.infinity,
        height: double.infinity,
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
                const SizedBox(height: 3),

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

                const SizedBox(height: 24),

                // TOMBOL SAVE
                SizedBox(
                  width: 262,
                  height: 36,
                  child: ElevatedButton(
                    onPressed: () {
                      // Tutup keyboard
                      FocusManager.instance.primaryFocus?.unfocus();
                      // Panggil callback onSuccess milik Parent
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

                // PADDING BAWAH AGAR TOMBOL TIDAK KENA NAVBAR
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- HELPERS (Tetap sama) ---
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

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class ProfileMenuSection extends StatelessWidget {
//   const ProfileMenuSection({super.key});

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
//         // ClipRRect diletakkan di sini untuk memastikan konten scroll
//         // mengikuti lengkungan border radius container
//         child: ClipRRect(
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(40),
//             topRight: Radius.circular(40),
//           ),
//           child: SingleChildScrollView(
//             // Physics diperlukan agar scroll terasa natural
//             physics: const BouncingScrollPhysics(),
//             padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Jarak agar konten tidak tertutup card merah (ProfileHeader)
//                 const SizedBox(height: 60), // Sedikit ditambah agar lebih lega

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
//                   onTap: () {},
//                 ),
//                 const SizedBox(height: 12),

//                 _buildMenuButton(
//                   iconPath: 'assets/images/profile/informasi_profile.png',
//                   label: 'Informasi Profile',
//                   iconSize: 24,
//                   onTap: () {},
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

//                 // PERBAIKAN PENTING:
//                 // Karena di ProfileScreen kita set bottom: -100,
//                 // Kita harus menambah padding bawah di sini agar konten
//                 // bisa discroll naik melebihi tinggi navbar.
//                 // 100 (padding lama) + 80 (extra navbar gap) = 180
//                 const SizedBox(height: 180),
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_smile_multifab/features/profile/screens/account_screen.dart';

class ProfileMenuSection extends StatelessWidget {
  const ProfileMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Container(
        width: double.infinity,
        // Tetap menggunakan double.infinity agar background putih memanjang ke bawah
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
          // PERUBAHAN DISINI:
          // 1. SingleChildScrollView dihapus.
          // 2. Diganti dengan Padding untuk memberi jarak tepi.
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Jarak agar konten tidak tertutup card merah
                const SizedBox(height: 35),

                // =========================
                // SECTION: ACCOUNT
                // =========================
                const Text(
                  'Account',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),

                _buildMenuButton(
                  iconPath: 'assets/images/profile/account.png',
                  label: 'Account',
                  iconSize: 32,
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const AccountScreen(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          // Animasi Slide dari Kanan ke Kiri
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.easeOut;

                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 12),

                _buildMenuButton(
                  iconPath: 'assets/images/profile/informasi_profile.png',
                  label: 'Informasi Profile',
                  iconSize: 24,
                  onTap: () {},
                  leftPadding: 23,
                ),

                const SizedBox(height: 37),

                // =========================
                // SECTION: SECURITY
                // =========================
                const Text(
                  'Security',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),

                _buildMenuButton(
                  iconPath: 'assets/images/profile/change_password.png',
                  label: 'Change Password',
                  iconSize: 24,
                  onTap: () {},
                  leftPadding: 23,
                ),

                // PERUBAHAN:
                // SizedBox besar di bawah (height: 100/180) dihapus
                // karena halaman statis tidak perlu ruang scroll.
              ],
            ),
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
    double leftPadding = 17.0,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 39,
        padding: EdgeInsets.only(
          left: leftPadding,
          right: 17.0,
          top: 3.0,
          bottom: 3.0,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 32,
              child: Center(
                child: iconPath.toLowerCase().endsWith('.svg')
                    ? SvgPicture.asset(
                        iconPath,
                        width: iconSize,
                        height: iconSize,
                      )
                    : Image.asset(
                        iconPath,
                        width: iconSize,
                        height: iconSize,
                        fit: BoxFit.contain,
                      ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Colors.black,
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

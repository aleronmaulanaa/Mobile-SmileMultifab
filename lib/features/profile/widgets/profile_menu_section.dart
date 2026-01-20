// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class ProfileMenuSection extends StatelessWidget {
//   const ProfileMenuSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       // Decoration untuk Container Putih Besar
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(40),
//           topRight: Radius.circular(40),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.25),
//             offset: const Offset(0, -3), // x=0 y=-3
//             blurRadius: 4,
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(40),
//           topRight: Radius.circular(40),
//         ),
//         // AREA SCROLL
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 40),

//               // =========================
//               // SECTION: ACCOUNT
//               // =========================
//               const Text(
//                 'Account',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600, // Semibold
//                   fontSize: 14,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 12),

//               // TOMBOL 1: Account (Tetap 17 sesuai default)
//               _buildMenuButton(
//                 iconPath: 'assets/images/profile/account.png',
//                 label: 'Account',
//                 iconSize: 32,
//                 onTap: () {},
//                 // Tidak perlu kirim horizontalPadding, pakai default 17
//               ),
//               const SizedBox(height: 12),

//               // TOMBOL 2: Informasi Profile (Ubah jadi 23)
//               _buildMenuButton(
//                 iconPath: 'assets/images/profile/informasi_profile.png',
//                 label: 'Informasi Profile',
//                 iconSize: 24,
//                 onTap: () {},
//                 horizontalPadding: 23, // <--- KHUSUS INI DIUBAH KE 23
//               ),

//               const SizedBox(height: 37),

//               // =========================
//               // SECTION: SECURITY
//               // =========================
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

//               // TOMBOL 3: Change Password (Ubah jadi 23)
//               _buildMenuButton(
//                 iconPath: 'assets/images/profile/change_password.png',
//                 label: 'Change Password',
//                 iconSize: 24,
//                 onTap: () {},
//                 horizontalPadding: 23, // <--- KHUSUS INI DIUBAH KE 23
//               ),

//               const SizedBox(height: 100),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Helper Widget yang sudah di-update
//   Widget _buildMenuButton({
//     required String iconPath,
//     required String label,
//     required double iconSize,
//     required VoidCallback onTap,
//     // Parameter baru untuk mengatur padding kiri-kanan (Default 17)
//     double horizontalPadding = 17.0,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: double.infinity,
//         height: 39,
//         // Gunakan nilai dari parameter horizontalPadding di sini
//         padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 3),
//         decoration: BoxDecoration(
//           color: const Color(0xFFF3F4F6),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Row(
//           children: [
//             // ICON KIRI
//             SizedBox(
//               width: 32,
//               child: Center(
//                 child: SvgPicture.asset(
//                   iconPath,
//                   width: iconSize,
//                   height: iconSize,
//                 ),
//               ),
//             ),

//             const SizedBox(width: 15),

//             // TEXT LABEL
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

//             // ICON KANAN
//             SvgPicture.asset(
//               'assets/icons/ic_arrow-back.svg',
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

class ProfileMenuSection extends StatelessWidget {
  const ProfileMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // Decoration untuk Container Putih Besar
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, -3), // x=0 y=-3
            blurRadius: 4,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        // AREA SCROLL
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Jarak agar konten tidak tertutup card merah
              const SizedBox(height: 40),

              // =========================
              // SECTION: ACCOUNT
              // =========================
              const Text(
                'Account',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600, // Semibold
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),

              // TOMBOL 1: Account
              _buildMenuButton(
                iconPath: 'assets/images/profile/account.png', // File PNG
                label: 'Account',
                iconSize: 32,
                onTap: () {},
              ),
              const SizedBox(height: 12),

              // TOMBOL 2: Informasi Profile
              _buildMenuButton(
                iconPath:
                    'assets/images/profile/informasi_profile.png', // File PNG
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

              // TOMBOL 3: Change Password
              _buildMenuButton(
                iconPath:
                    'assets/images/profile/change_password.png', // File PNG
                label: 'Change Password',
                iconSize: 24,
                onTap: () {},
                leftPadding: 23,
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget (UPDATED: Support PNG & SVG)
  Widget _buildMenuButton({
    required String iconPath,
    required String label,
    required double iconSize,
    required VoidCallback onTap,
    // double horizontalPadding = 17.0,
    double leftPadding = 17.0,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 39,
        // padding:
        //     EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 3),
        padding: EdgeInsets.only(
          left: leftPadding, // Sesuai parameter (17 atau 23)
          right: 17.0, // Tetap 17 sesuai request
          top: 3.0,
          bottom: 3.0,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            // ICON KIRI
            SizedBox(
              width: 32,
              child: Center(
                // REVISI: Cek ekstensi file
                // Jika .svg gunakan SvgPicture, jika tidak (.png) gunakan Image.asset
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

            // TEXT LABEL
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

            // ICON KANAN (Tetap SVG)
            SvgPicture.asset(
              'assets/icons/ic_arrow-back.svg', // Pastikan file ini ada
              width: 27,
              height: 27,
            ),
          ],
        ),
      ),
    );
  }
}

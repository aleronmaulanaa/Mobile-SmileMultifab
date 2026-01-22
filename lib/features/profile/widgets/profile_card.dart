// import 'package:flutter/material.dart';

// class ProfileHeaderCard extends StatelessWidget {
//   final bool isOnline;
//   final String imageUrl;

//   const ProfileHeaderCard({
//     super.key,
//     required this.isOnline,
//     required this.imageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return MediaQuery(
//       data: MediaQuery.of(context)
//           .copyWith(textScaler: const TextScaler.linear(1.0)),
//       child: Container(
//         width: double.infinity,
//         height: 115,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(11),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.25),
//               offset: const Offset(0, 7),
//               blurRadius: 7,
//             ),
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(11),
//           child: Row(
//             children: [
//               // ==============================
//               // BAGIAN KIRI: CARD MERAH (PROFILE)
//               // ==============================
//               Expanded(
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 19, vertical: 21),
//                   decoration: const BoxDecoration(
//                     color: Color(0xFFF87072),
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(11),
//                       bottomRight: Radius.circular(11),
//                     ),
//                   ),
//                   child: Row(
//                     children: [
//                       // FOTO PROFILE
//                       Container(
//                         width: 73,
//                         height: 73,
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,
//                           // UBAH DISINI: Dari Colors.white menjadi Colors.grey
//                           // Ini akan menjadi warna background saat gambar sedang loading (transparan)
//                           color: Colors.grey,
//                         ),
//                         child: ClipOval(
//                           child: _buildProfileImage(),
//                         ),
//                       ),

//                       const SizedBox(width: 10),

//                       // TEXT SECTION
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text(
//                               'M. Richie Sugestiana.',
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 15,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             const SizedBox(height: 4),
//                             const Text(
//                               '83493',
//                               style: TextStyle(
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 13,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             const SizedBox(height: 11),
//                             const Text(
//                               'IT Network & Infrastruktur',
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 11,
//                                 color: Color(0xFF393939),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               // ==============================
//               // BAGIAN KANAN: CARD PUTIH (QR CODE)
//               // ==============================
//               Container(
//                 width: 110,
//                 color: Colors.white,
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(
//                       'assets/images/profile/qr_code.png',
//                       width: 57,
//                       height: 57,
//                       fit: BoxFit.contain,
//                       errorBuilder: (context, error, stackTrace) =>
//                           const Icon(Icons.qr_code_2, size: 40),
//                     ),
//                     const SizedBox(height: 3),
//                     const Text(
//                       'tap to view',
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w500,
//                         fontSize: 11,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // --- LOGIKA BUILD IMAGE ---
//   Widget _buildProfileImage() {
//     // 1. Jika Offline -> Pakai Asset Langsung
//     if (!isOnline) {
//       return Image.asset(
//         'assets/images/common/default-user.jpg',
//         fit: BoxFit.cover,
//       );
//     }

//     // 2. Jika Online -> Pakai Network Image dengan frameBuilder (RINGAN)
//     final String cleanUrl = imageUrl.replaceAll(RegExp(r'(?<!:)/{2,}'), '/');

//     return Image.network(
//       cleanUrl,
//       fit: BoxFit.cover,
//       // Menggunakan frameBuilder agar transisi opacity halus
//       // Saat opacity 0, warna Colors.grey di container belakang akan terlihat
//       frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
//         if (wasSynchronouslyLoaded) return child;
//         return AnimatedOpacity(
//           opacity: frame == null ? 0 : 1,
//           duration: const Duration(milliseconds: 500),
//           curve: Curves.easeOut,
//           child: child,
//         );
//       },
//       // Error Builder: Jika URL gagal/timeout, fallback ke Asset
//       errorBuilder: (context, error, stackTrace) {
//         return Image.asset(
//           'assets/images/common/default-user.jpg',
//           fit: BoxFit.cover,
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';

class ProfileHeaderCard extends StatelessWidget {
  final bool isOnline;
  final String imageUrl;
  final VoidCallback? onQrTap;

  const ProfileHeaderCard({
    super.key,
    required this.isOnline,
    required this.imageUrl,
    this.onQrTap,
  });

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Container(
        width: double.infinity,
        height: 115,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 7),
              blurRadius: 7,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: Row(
            children: [
              // ==============================
              // BAGIAN KIRI: CARD MERAH (PROFILE)
              // ==============================
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 19, vertical: 21),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF87072),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(11),
                      bottomRight: Radius.circular(11),
                    ),
                  ),
                  child: Row(
                    children: [
                      // FOTO PROFILE
                      Container(
                        width: 73,
                        height: 73,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: ClipOval(
                          child: _buildProfileImage(),
                        ),
                      ),

                      const SizedBox(width: 10),

                      // TEXT SECTION
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'M. Richie Sugestiana.',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              '83493',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 11),
                            const Text(
                              'IT Network & Infrastruktur',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 11,
                                color: Color(0xFF393939),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ==============================
              // BAGIAN KANAN: CARD PUTIH (QR CODE)
              // ==============================
              // PERBAIKAN DISINI:
              // Kita bungkus Container ini dengan GestureDetector agar bisa diklik
              GestureDetector(
                onTap: onQrTap, // <--- Memanggil fungsi callback saat ditekan
                behavior: HitTestBehavior
                    .opaque, // Agar area kosong tetap bisa diklik
                child: Container(
                  width: 110,
                  height: double.infinity, // Pastikan tinggi penuh
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/profile/qr_code.png',
                        width: 57,
                        height: 57,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.qr_code_2, size: 40),
                      ),
                      const SizedBox(height: 3),
                      const Text(
                        'tap to view',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- LOGIKA BUILD IMAGE ---
  Widget _buildProfileImage() {
    if (!isOnline) {
      return Image.asset(
        'assets/images/common/default-user.jpg',
        fit: BoxFit.cover,
      );
    }

    final String cleanUrl = imageUrl.replaceAll(RegExp(r'(?<!:)/{2,}'), '/');

    return Image.network(
      cleanUrl,
      fit: BoxFit.cover,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) return child;
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
          child: child,
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          'assets/images/common/default-user.jpg',
          fit: BoxFit.cover,
        );
      },
    );
  }
}

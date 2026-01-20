// import 'package:flutter/material.dart';

// class ProfileHeaderCard extends StatelessWidget {
//   const ProfileHeaderCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 115, // H=115
//       decoration: BoxDecoration(
//         color: Colors.white,
//         // Shadow untuk seluruh card (Red + White)
//         borderRadius: BorderRadius.circular(11),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.25),
//             offset: const Offset(0, 7),
//             blurRadius: 7,
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(11),
//         child: Row(
//           children: [
//             // ==============================
//             // BAGIAN KIRI: CARD MERAH (PROFILE)
//             // ==============================
//             Expanded(
//               child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 19, vertical: 21),
//                 decoration: const BoxDecoration(
//                   color: Color(0xFFF87072), // Warna Merah
//                   // ▼▼▼ PENAMBAHAN CORNER RADIUS KANAN ▼▼▼
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(11),
//                     bottomRight: Radius.circular(11),
//                   ),
//                   // ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
//                 ),
//                 child: Row(
//                   children: [
//                     // FOTO PROFILE (W=73 H=73)
//                     Container(
//                       width: 73,
//                       height: 73,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.white,
//                       ),
//                       child: ClipOval(
//                         child: Image.asset(
//                           'assets/images/common/user_avatar.png',
//                           fit: BoxFit.cover,
//                           errorBuilder: (context, error, stackTrace) =>
//                               const Icon(Icons.person,
//                                   color: Colors.grey, size: 40),
//                         ),
//                       ),
//                     ),

//                     const SizedBox(width: 10),

//                     // TEXT SECTION
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           // Nama
//                           const Text(
//                             'M. Richie Sugestiana.',
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               fontFamily: 'Poppins',
//                               fontWeight: FontWeight.w600,
//                               fontSize: 15,
//                               color: Colors.white,
//                             ),
//                           ),
//                           const SizedBox(height: 4),

//                           // ID / NIK
//                           const Text(
//                             '83493',
//                             style: TextStyle(
//                               fontFamily: 'Poppins',
//                               fontWeight: FontWeight.w500,
//                               fontSize: 13,
//                               color: Colors.white,
//                             ),
//                           ),
//                           const SizedBox(height: 11),

//                           // Jabatan
//                           const Text(
//                             'IT Network & Infrastruktur',
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               fontFamily: 'Poppins',
//                               fontWeight: FontWeight.w500,
//                               fontSize: 11,
//                               color: Color(0xFF393939),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             // ==============================
//             // BAGIAN KANAN: CARD PUTIH (QR CODE)
//             // ==============================
//             Container(
//               width: 110,
//               color: Colors.white, // Warna Putih
//               padding: const EdgeInsets.symmetric(vertical: 10),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // QR CODE IMAGE
//                   Image.asset(
//                     'assets/images/profile/qr_code.png',
//                     width: 57,
//                     height: 57,
//                     fit: BoxFit.contain,
//                     errorBuilder: (context, error, stackTrace) => Column(
//                       children: const [
//                         Icon(Icons.qr_code_2, size: 40),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 3),
//                   // TEXT TAP TO VIEW
//                   const Text(
//                     'tap to view',
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w500,
//                       fontSize: 11,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    // KITA BUNGKUS DENGAN MEDIAQUERY UNTUK MENGUNCI UKURAN TEXT
    // Ini menjamin tampilan tetap rapi meskipun user mengubah font HP menjadi "Sangat Besar"
    // karena tinggi kartu kita Fixed (115), teks tidak boleh membesar sembarangan.
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Container(
        width: double.infinity,
        height: 115, // H=115 Fixed
        decoration: BoxDecoration(
          color: Colors.white,
          // Shadow untuk seluruh card
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
              // Expanded membuatnya responsif memenuhi sisa lebar layar
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 21),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF87072), // Warna Merah
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(11),
                      bottomRight: Radius.circular(11),
                    ),
                  ),
                  child: Row(
                    children: [
                      // FOTO PROFILE (Fixed W=73 H=73)
                      Container(
                        width: 73,
                        height: 73,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/common/user_avatar.png',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.person,
                                    color: Colors.grey, size: 40),
                          ),
                        ),
                      ),
      
                      const SizedBox(width: 10),
      
                      // TEXT SECTION
                      // Expanded di sini mencegah teks panjang menabrak batas kanan
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Nama
                            const Text(
                              'M. Richie Sugestiana.',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis, // Memotong teks jika layar terlalu kecil
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
      
                            // ID / NIK
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
      
                            // Jabatan
                            const Text(
                              'IT Network & Infrastruktur',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis, // Memotong teks jabatan jika panjang
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
              Container(
                width: 110, // Fixed Width
                color: Colors.white, 
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // QR CODE IMAGE
                    Image.asset(
                      'assets/images/profile/qr_code.png',
                      width: 57,
                      height: 57,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.qr_code_2, size: 40),
                    ),
                    const SizedBox(height: 3),
                    
                    // TEXT TAP TO VIEW
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
            ],
          ),
        ),
      ),
    );
  }
}
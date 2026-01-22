// import 'package:flutter/material.dart';

// class QrCodeBottomSheet extends StatelessWidget {
//   const QrCodeBottomSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Material(
//         color: Colors.transparent,
//         child: Container(
//           // Spesifikasi Card Utama
//           width: double.infinity, // Mengisi lebar layar (sesuai W=430 di desain responsif)
//           height: 577,
//           margin: EdgeInsets.zero,
//           decoration: BoxDecoration(
//             color: const Color(0xFFFEE1E4), // Warna FEE1E4
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(40),
//               topRight: Radius.circular(40),
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.25), // Warna 000000 25%
//                 offset: const Offset(0, -3), // x=0 y=-3
//                 blurRadius: 4, // blur=4
//               ),
//             ],
//           ),
//           child: Padding(
//             // Margin dalam card: Kanan-Kiri=25, Atas-Bawah=30
//             padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // ===========================
//                 // 1. HANDLE / CLOSE BUTTON
//                 // ===========================
//                 GestureDetector(
//                   onTap: () => Navigator.pop(context), // Fungsi menutup card
//                   child: Container(
//                     width: 82,
//                     height: 8,
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFD9D9D9), // Warna D9D9D9
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 21), // Jarak ke text My QR Code

//                 // ===========================
//                 // 2. TEXT: MY QR CODE
//                 // ===========================
//                 const Text(
//                   'My QR Code',
//                   style: TextStyle(
//                     fontFamily: 'Poppins', // Sesuaikan font
//                     fontWeight: FontWeight.w700, // Bold
//                     fontSize: 20,
//                     color: Color(0xFF000000),
//                   ),
//                 ),

//                 const SizedBox(height: 10), // Jarak ke text instruksi

//                 // ===========================
//                 // 3. TEXT: INSTRUCTION
//                 // ===========================
//                 const Text(
//                   'show this QR code to the scanner',
//                   style: TextStyle(
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w600, // Semibold
//                     fontSize: 16,
//                     color: Color(0xFF575757),
//                   ),
//                 ),

//                 const SizedBox(height: 30), // Jarak ke Card Putih QR

//                 // ===========================
//                 // 4. WHITE QR CARD CONTAINER
//                 // ===========================
//                 Container(
//                   width: 270,
//                   height: 320,
//                   decoration: BoxDecoration(
//                     color: Colors.white, // FFFFFF
//                     borderRadius: BorderRadius.circular(17),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.25),
//                         offset: const Offset(0, 0),
//                         blurRadius: 7,
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       // GAMBAR QR CODE
//                       // Pastikan path assets sudah benar di pubspec.yaml
//                       Image.asset(
//                         'assets/images/profile/qr_code.png', // Ganti path sesuai asset Anda
//                         width: 201,
//                         height: 201,
//                         fit: BoxFit.contain,
//                       ),

//                       const SizedBox(height: 35), // Jarak QR ke Text Angka

//                       // TEXT ANGKA
//                       const Text(
//                         '83493',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w700, // Bold
//                           fontSize: 20,
//                           color: Colors.black,
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

class QrCodeBottomSheet extends StatelessWidget {
  const QrCodeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,

      // FITUR BARU: DISMISSIBLE
      // Membungkus seluruh card agar bisa ditarik ke bawah
      child: Dismissible(
        key: const Key('qr_code_modal'),
        direction: DismissDirection.down, // Hanya izinkan tarik ke bawah
        onDismissed: (_) {
          Navigator.pop(context); // Tutup dialog saat selesai ditarik
        },

        // Material dibungkus disini agar ikut tergeser saat ditarik
        child: Material(
          color: Colors.transparent,
          child: Container(
            // ==========================================
            // DISINI TEMPAT MENGATUR UKURAN CARD
            // ==========================================
            width: double.infinity,
            height: 523, // <--- Ubah angka ini untuk mengatur TINGGI card

            // Jika ingin card tidak terlalu nempel bawah, bisa tambah margin bottom disini
            // margin: const EdgeInsets.only(bottom: 0),

            decoration: BoxDecoration(
              color: const Color(0xFFFEE1E4),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // HANDLE / CLOSE BUTTON
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 82,
                      height: 8,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  const SizedBox(height: 21),

                  // TEXT: MY QR CODE
                  const Text(
                    'My QR Code',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Color(0xFF000000),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // TEXT: INSTRUCTION
                  const Text(
                    'show this QR code to the scanner',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xFF575757),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // WHITE QR CARD CONTAINER
                  Container(
                    width: 270,
                    height: 320,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: const Offset(0, 0),
                          blurRadius: 7,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/profile/qr_code.png',
                          width: 201,
                          height: 201,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 35),
                        const Text(
                          '83493',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
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
        ),
      ),
    );
  }
}

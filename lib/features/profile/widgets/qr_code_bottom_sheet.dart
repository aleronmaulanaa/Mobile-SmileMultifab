// import 'package:flutter/material.dart';

// class QrCodeBottomSheet extends StatelessWidget {
//   const QrCodeBottomSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.bottomCenter,

//       // FITUR BARU: DISMISSIBLE
//       // Membungkus seluruh card agar bisa ditarik ke bawah
//       child: Dismissible(
//         key: const Key('qr_code_modal'),
//         direction: DismissDirection.down, // Hanya izinkan tarik ke bawah
//         onDismissed: (_) {
//           Navigator.pop(context); // Tutup dialog saat selesai ditarik
//         },

//         // Material dibungkus disini agar ikut tergeser saat ditarik
//         child: Material(
//           color: Colors.transparent,
//           child: Container(
//             // ==========================================
//             // DISINI TEMPAT MENGATUR UKURAN CARD
//             // ==========================================
//             width: double.infinity,
//             height: 523, // <--- Ubah angka ini untuk mengatur TINGGI card

//             // Jika ingin card tidak terlalu nempel bawah, bisa tambah margin bottom disini
//             // margin: const EdgeInsets.only(bottom: 0),

//             decoration: BoxDecoration(
//               color: const Color(0xFFFEE1E4),
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(40),
//                 topRight: Radius.circular(40),
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.25),
//                   offset: const Offset(0, -3),
//                   blurRadius: 4,
//                 ),
//               ],
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // HANDLE / CLOSE BUTTON
//                   GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Container(
//                       width: 82,
//                       height: 8,
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFD9D9D9),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 21),

//                   // TEXT: MY QR CODE
//                   const Text(
//                     'My QR Code',
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w700,
//                       fontSize: 20,
//                       color: Color(0xFF000000),
//                     ),
//                   ),

//                   const SizedBox(height: 10),

//                   // TEXT: INSTRUCTION
//                   const Text(
//                     'show this QR code to the scanner',
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16,
//                       color: Color(0xFF575757),
//                     ),
//                   ),

//                   const SizedBox(height: 30),

//                   // WHITE QR CARD CONTAINER
//                   Container(
//                     width: 270,
//                     height: 320,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(17),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.25),
//                           offset: const Offset(0, 0),
//                           blurRadius: 7,
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           'assets/images/profile/qr_code.png',
//                           width: 201,
//                           height: 201,
//                           fit: BoxFit.contain,
//                         ),
//                         const SizedBox(height: 35),
//                         const Text(
//                           '83493',
//                           style: TextStyle(
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.w700,
//                             fontSize: 20,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
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

  // URL Gambar QR Code (Ganti dengan URL asli dari API/Backend Anda)
  final String qrCodeUrl = "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=83493";

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Dismissible(
        key: const Key('qr_code_modal'),
        direction: DismissDirection.down,
        onDismissed: (_) {
          Navigator.pop(context);
        },
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: double.infinity,
            height: 523,
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
                        // ==========================================
                        // PERUBAHAN: IMAGE.NETWORK DENGAN LOADING
                        // ==========================================
                        SizedBox(
                          width: 201,
                          height: 201,
                          child: Image.network(
                            qrCodeUrl,
                            fit: BoxFit.contain,
                            
                            // 1. Loading Builder: Tampil saat gambar sedang didownload (Online tapi loading)
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Color(0xFFFA0007), // Warna Merah sesuai tema
                                ),
                              );
                            },

                            // 2. Error Builder: Tampil saat Offline atau Gagal Load
                            // Sesuai request: Jika offline, tetap tampilkan animasi loading
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Color(0xFFFA0007),
                                ),
                              );
                            },
                          ),
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
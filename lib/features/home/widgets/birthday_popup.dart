// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class BirthdayPopup extends StatefulWidget {
//   const BirthdayPopup({super.key});

//   @override
//   State<BirthdayPopup> createState() => _BirthdayPopupState();
// }

// class _BirthdayPopupState extends State<BirthdayPopup> {
//   int _visibleCount = 6;
//   bool _isExpanded = false;

//   final List<Map<String, String>> _birthdayList = [
//     {
//       "name": "Aisah Nurhayati",
//       "date": "03 January",
//       "img":
//           "https://erp-multifab.com/storage//employees/Screen_Shot_2021-03-12_at_09_45_30.png",
//     },
//     {
//       "name": "Erni Susilawati",
//       "date": "23 January",
//       "img":
//           "https://erp-multifab.com/storage//employees/MFG-20241224-1735021410.jpg",
//     },
//     {
//       "name": "Aridhito Bayu Kusnanda",
//       "date": "09 January",
//       "img": "https://erp-multifab.com/storage//default-user.jpg",
//     },
//     {
//       "name": "Denny",
//       "date": "23 January",
//       "img":
//           "https://erp-multifab.com/storage//employees/MFG-20250102-1735833475.jpg",
//     },
//     {
//       "name": "Basuki Raharjo",
//       "date": "02 January",
//       "img": "https://erp-multifab.com/storage//default-user.jpg",
//     },
//     {
//       "name": "Wahyu Kencono",
//       "date": "30 January",
//       "img": "https://erp-multifab.com/storage//default-user.jpg",
//     },
//     {
//       "name": "Anggoro Ari Broto",
//       "date": "08 January",
//       "img": "https://erp-multifab.com/storage//default-user.jpg",
//     },
//     {
//       "name": "Janter Michelson Lombu",
//       "date": "28 January",
//       "img": "https://erp-multifab.com/storage//default-user.jpg",
//     },
//     {
//       "name": "Imam Dzikrillah",
//       "date": "19 January",
//       "img":
//           "https://erp-multifab.com/storage//employees/MFG-20250710-1752110475.jpg",
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       insetPadding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Container(
//         constraints: const BoxConstraints(maxWidth: 407),
//         padding: const EdgeInsets.fromLTRB(22, 8, 22, 22),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(9),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Align(
//               alignment: Alignment.centerRight,
//               child: GestureDetector(
//                 onTap: () => Navigator.pop(context),
//                 child: SvgPicture.asset(
//                   'assets/icons/ic_close.svg',
//                   width: 24,
//                   height: 24,
//                 ),
//               ),
//             ),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SvgPicture.asset(
//                   'assets/icons/ic_birthday.svg',
//                   width: 24,
//                   height: 24,
//                 ),
//                 const SizedBox(width: 8),
//                 const Text(
//                   "Birthday This Month!",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 13),

//             RichText(
//               textAlign: TextAlign.left,
//               text: TextSpan(
//                 style: const TextStyle(
//                   fontFamily: 'Poppins',
//                   fontSize: 15,
//                   fontWeight: FontWeight.w600,
//                   color: Color(0xFF575757),
//                   height: 1.2,
//                 ),
//                 children: [
//                   const TextSpan(
//                     text:
//                         "Celebrate with your friends or colleagues who\nhave birthdays this month! ",
//                   ),
//                   WidgetSpan(
//                     alignment: PlaceholderAlignment.middle,
//                     child: SvgPicture.asset(
//                       'assets/icons/ic_birthday-cake.svg',
//                       width: 19,
//                       height: 19,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 23),

//             Flexible(
//               child: GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: _visibleCount > _birthdayList.length
//                     ? _birthdayList.length
//                     : _visibleCount,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   mainAxisSpacing: 5,
//                   crossAxisSpacing: 13,
//                   childAspectRatio: 0.80,
//                 ),
//                 itemBuilder: (context, index) {
//                   final person = _birthdayList[index];
//                   return _buildProfileItem(
//                     name: person['name']!,
//                     date: person['date']!,
//                     imageUrl: person['img']!,
//                   );
//                 },
//               ),
//             ),

//             if (!_isExpanded) ...[
//               const SizedBox(height: 0),

//               Center(
//                 child: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       _visibleCount = 9;
//                       _isExpanded = true;
//                     });
//                   },
//                   child: const Text(
//                     "Lihat Lainnya",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xFF1F63C7),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildProfileItem({
//     required String name,
//     required String date,
//     required String imageUrl,
//   }) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           width: 65,
//           height: 65,
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.grey,
//           ),
//           child: ClipOval(
//             child: Image.network(
//               imageUrl,
//               fit: BoxFit.cover,
//               width: 65,
//               height: 65,
//               loadingBuilder: (context, child, loadingProgress) {
//                 if (loadingProgress == null) return child;
//                 return Image.asset(
//                   'assets/images/home/default-user.jpg',
//                   fit: BoxFit.cover,
//                 );
//               },
//               errorBuilder: (context, error, stackTrace) {
//                 return Image.asset(
//                   'assets/images/home/default-user.jpg',
//                   fit: BoxFit.cover,
//                 );
//               },
//             ),
//           ),
//         ),
//         const SizedBox(height: 13),
//         Text(
//           name,
//           textAlign: TextAlign.center,
//           maxLines: 2,
//           overflow: TextOverflow.ellipsis,
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w600,
//             color: Colors.black,
//             height: 1.1,
//           ),
//         ),
//         const SizedBox(height: 3),
//         Text(
//           date,
//           textAlign: TextAlign.center,
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//             color: Color(0xFF575757),
//           ),
//         ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class BirthdayPopup extends StatefulWidget {
//   const BirthdayPopup({super.key});

//   @override
//   State<BirthdayPopup> createState() => _BirthdayPopupState();
// }

// class _BirthdayPopupState extends State<BirthdayPopup> {
//   int _visibleCount = 6;
//   bool _isExpanded = false;

//   final List<Map<String, String>> _birthdayList = [
//     {
//       "name": "Aisah Nurhayati",
//       "date": "03 January",
//       // Hapus double slash agar URL valid
//       "img": "https://erp-multifab.com/storage/employees/Screen_Shot_2021-03-12_at_09_45_30.png",
//     },
//     // ... (Data lainnya pastikan URL-nya bersih dari // ganda) ...
//      {
//       "name": "Imam Dzikrillah",
//       "date": "19 January",
//       "img": "https://erp-multifab.com/storage/employees/MFG-20250710-1752110475.jpg",
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       insetPadding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Container(
//         constraints: const BoxConstraints(maxWidth: 407),
//         padding: const EdgeInsets.fromLTRB(22, 8, 22, 22),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(9),
//         ),
//         // Gunakan SingleChildScrollView agar jika konten panjang di HP kecil, tidak overflow
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // --- Close Button ---
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: GestureDetector(
//                   onTap: () {
//                     // Debug print untuk memastikan tombol ditekan
//                     debugPrint("Close button pressed");
//                     Navigator.of(context).pop();
//                   },
//                   // HitTestBehavior.opaque memastikan area sentuh tombol luas
//                   behavior: HitTestBehavior.opaque,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0), // Tambah padding agar mudah ditekan
//                     child: SvgPicture.asset(
//                       'assets/icons/ic_close.svg',
//                       width: 24,
//                       height: 24,
//                     ),
//                   ),
//                 ),
//               ),

//               // --- Header Title ---
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   SvgPicture.asset(
//                     'assets/icons/ic_birthday.svg',
//                     width: 24,
//                     height: 24,
//                   ),
//                   const SizedBox(width: 8),
//                   const Text(
//                     "Birthday This Month!",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 13),

//               // --- Description ---
//               RichText(
//                 textAlign: TextAlign.left,
//                 text: TextSpan(
//                   style: const TextStyle(
//                     fontFamily: 'Poppins',
//                     fontSize: 15,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF575757),
//                     height: 1.2,
//                   ),
//                   children: [
//                     const TextSpan(
//                       text: "Celebrate with your friends or colleagues who\nhave birthdays this month! ",
//                     ),
//                     WidgetSpan(
//                       alignment: PlaceholderAlignment.middle,
//                       child: SvgPicture.asset(
//                         'assets/icons/ic_birthday-cake.svg',
//                         width: 19,
//                         height: 19,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 23),

//               // --- Grid View ---
//               // Hapus Flexible. GridView shrinkWrap sudah cukup.
//               GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: _visibleCount > _birthdayList.length
//                     ? _birthdayList.length
//                     : _visibleCount,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   mainAxisSpacing: 15, // Jarak vertikal antar item diperbesar sedikit
//                   crossAxisSpacing: 13,
//                   childAspectRatio: 0.75, // Disesuaikan agar teks tidak terpotong
//                 ),
//                 itemBuilder: (context, index) {
//                   final person = _birthdayList[index];
//                   return _buildProfileItem(
//                     name: person['name']!,
//                     date: person['date']!,
//                     imageUrl: person['img']!,
//                   );
//                 },
//               ),

//               if (!_isExpanded && _birthdayList.length > 6) ...[
//                 const SizedBox(height: 15),
//                 Center(
//                   child: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         _visibleCount = _birthdayList.length; // Tampilkan semua
//                         _isExpanded = true;
//                       });
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(
//                         "Lihat Lainnya",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: Color(0xFF1F63C7),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildProfileItem({
//     required String name,
//     required String date,
//     required String imageUrl,
//   }) {
//     // Bersihkan URL dari double slash jika ada
//     final cleanUrl = imageUrl.replaceAll(RegExp(r'(?<!:)/{2,}'), '/');

//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           width: 65,
//           height: 65,
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.grey,
//           ),
//           child: ClipOval(
//             child: Image.network(
//               cleanUrl,
//               fit: BoxFit.cover,
//               width: 65,
//               height: 65,
//               // Gunakan frameBuilder untuk transisi halus, lebih ringan dari loadingBuilder
//               frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
//                 if (wasSynchronouslyLoaded) return child;
//                 return AnimatedOpacity(
//                   opacity: frame == null ? 0 : 1,
//                   duration: const Duration(seconds: 1),
//                   curve: Curves.easeOut,
//                   child: child,
//                 );
//               },
//               errorBuilder: (context, error, stackTrace) {
//                 // Tampilkan asset default jika gagal load
//                 return Image.asset(
//                   'assets/images/home/default-user.jpg',
//                   fit: BoxFit.cover,
//                 );
//               },
//             ),
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           name,
//           textAlign: TextAlign.center,
//           maxLines: 2,
//           overflow: TextOverflow.ellipsis,
//           style: const TextStyle(
//             fontSize: 12, // Perkecil sedikit font agar muat
//             fontWeight: FontWeight.w600,
//             color: Colors.black,
//             height: 1.1,
//           ),
//         ),
//         const SizedBox(height: 2),
//         Text(
//           date,
//           textAlign: TextAlign.center,
//           style: const TextStyle(
//             fontSize: 12,
//             fontWeight: FontWeight.w500,
//             color: Color(0xFF575757),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BirthdayPopup extends StatefulWidget {
  const BirthdayPopup({super.key});

  @override
  State<BirthdayPopup> createState() => _BirthdayPopupState();
}

class _BirthdayPopupState extends State<BirthdayPopup> {
  // State untuk logika "Lihat Lainnya"
  int _visibleCount = 6;
  bool _isExpanded = false;

  // DATA ASLI ANDA (LENGKAP)
  final List<Map<String, String>> _birthdayList = [
    {
      "name": "Aisah Nurhayati",
      "date": "03 January",
      "img":
          "https://erp-multifab.com/storage//employees/Screen_Shot_2021-03-12_at_09_45_30.png",
    },
    {
      "name": "Erni Susilawati",
      "date": "23 January",
      "img":
          "https://erp-multifab.com/storage//employees/MFG-20241224-1735021410.jpg",
    },
    {
      "name": "Aridhito Bayu Kusnanda",
      "date": "09 January",
      "img": "https://erp-multifab.com/storage//default-user.jpg",
    },
    {
      "name": "Denny",
      "date": "23 January",
      "img":
          "https://erp-multifab.com/storage//employees/MFG-20250102-1735833475.jpg",
    },
    {
      "name": "Basuki Raharjo",
      "date": "02 January",
      "img": "https://erp-multifab.com/storage//default-user.jpg",
    },
    {
      "name": "Wahyu Kencono",
      "date": "30 January",
      "img": "https://erp-multifab.com/storage//default-user.jpg",
    },
    {
      "name": "Anggoro Ari Broto",
      "date": "08 January",
      "img": "https://erp-multifab.com/storage//default-user.jpg",
    },
    {
      "name": "Janter Michelson Lombu",
      "date": "28 January",
      "img": "https://erp-multifab.com/storage//default-user.jpg",
    },
    {
      "name": "Imam Dzikrillah",
      "date": "19 January",
      "img":
          "https://erp-multifab.com/storage//employees/MFG-20250710-1752110475.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 407),
        padding: const EdgeInsets.fromLTRB(22, 8, 22, 22),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
        ),
        // PERBAIKAN UTAMA: Gunakan SingleChildScrollView
        // Ini mencegah error "RenderFlex overflowed" dan Lag
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Tombol Close ---
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  behavior:
                      HitTestBehavior.opaque, // Area sentuh lebih responsif
                  child: Padding(
                    padding:
                        const EdgeInsets.all(4.0), // Padding agar mudah ditekan
                    child: SvgPicture.asset(
                      'assets/icons/ic_close.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ),

              // --- Judul Header ---
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_birthday.svg',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Birthday This Month!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 13),

              // --- Subtitle RichText ---
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF575757),
                    height: 1.2,
                  ),
                  children: [
                    const TextSpan(
                      text:
                          "Celebrate with your friends or colleagues who\nhave birthdays this month! ",
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: SvgPicture.asset(
                        'assets/icons/ic_birthday-cake.svg',
                        width: 19,
                        height: 19,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 23),

              // --- Grid View Items ---
              // PERBAIKAN: Hapus Flexible, gunakan shrinkWrap: true
              GridView.builder(
                shrinkWrap: true, // Agar tinggi Grid menyesuaikan konten
                physics:
                    const NeverScrollableScrollPhysics(), // Scroll ikut parent
                itemCount: _visibleCount > _birthdayList.length
                    ? _birthdayList.length
                    : _visibleCount,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 13,
                  childAspectRatio: 0.80,
                ),
                itemBuilder: (context, index) {
                  final person = _birthdayList[index];
                  return _buildProfileItem(
                    name: person['name']!,
                    date: person['date']!,
                    imageUrl: person['img']!,
                  );
                },
              ),

              // --- Tombol Lihat Lainnya ---
              if (!_isExpanded && _birthdayList.length > 6) ...[
                const SizedBox(height: 10), // Sedikit jarak
                Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _visibleCount =
                            _birthdayList.length; // Tampilkan semua data
                        _isExpanded = true;
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Lihat Lainnya",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1F63C7),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem({
    required String name,
    required String date,
    required String imageUrl,
  }) {
    // FIX URL: Hapus double slash agar Image.network tidak error/lag
    // Mengubah 'storage//employees' menjadi 'storage/employees'
    final String cleanUrl = imageUrl.replaceAll(RegExp(r'(?<!:)/{2,}'), '/');

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
          child: ClipOval(
            child: Image.network(
              cleanUrl,
              fit: BoxFit.cover,
              width: 65,
              height: 65,
              // OPTIMASI: Gunakan frameBuilder (lebih ringan dari loadingBuilder)
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded) return child;
                return AnimatedOpacity(
                  opacity: frame == null ? 0 : 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  child: child,
                );
              },
              // Error Builder untuk menampilkan default image jika gagal load
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/home/default-user.jpg',
                  fit: BoxFit.cover,
                  // Fallback icon jika asset jpg juga tidak ketemu (opsional)
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.person),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 13),
        Text(
          name,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          date,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF575757),
          ),
        ),
      ],
    );
  }
}

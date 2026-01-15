// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class BirthdayPopup extends StatefulWidget {
//   const BirthdayPopup({super.key});

//   @override
//   State<BirthdayPopup> createState() => _BirthdayPopupState();
// }

// class _BirthdayPopupState extends State<BirthdayPopup> {
//   // Logic untuk "Lihat Lainnya"
//   // Awalnya tampil 6 (2 baris), jika diklik jadi 9 (3 baris)
//   int _visibleCount = 6;
//   bool _isExpanded = false;

//   // Dummy Data (Campuran URL Valid & Invalid untuk tes logika)
//   final List<Map<String, String>> _birthdayList = [
//     {
//       "name": "Aisah Nurhayati",
//       "date": "03 January",
//       "img":
//           "https://erp-multifab.com/storage//employees/Screen_Shot_2021-03-12_at_09_45_30.png", // Link Online
//     },
//     {
//       "name": "Erni Susilawati",
//       "date": "23 January",
//       "img":
//           "https://erp-multifab.com/storage//employees/MFG-20241224-1735021410.jpg", // Link Rusak (Tes Assets)
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
//     // Data Tambahan (Muncul saat Lihat Lainnya)
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
//       backgroundColor:
//           Colors.transparent, // Background transparan agar radius terlihat
//       insetPadding:
//           const EdgeInsets.symmetric(horizontal: 16), // Margin luar dialog
//       child: Container(
//         // Ukuran W=407 (Max)
//         constraints: const BoxConstraints(maxWidth: 407),
//         // Padding Dalam: Kanan Kiri 10, Atas 21, Bawah 35
//         padding: const EdgeInsets.fromLTRB(10, 21, 10, 35),
//         decoration: BoxDecoration(
//           color: Colors.white, // FFFFFF 100%
//           borderRadius: BorderRadius.circular(9), // Corner Radius 9
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min, // Tinggi menyesuaikan konten
//           children: [
//             // ===========================
//             // 1. HEADER (CLOSE + TITLE)
//             // ===========================
//             Stack(
//               children: [
//                 // Icon Close (Pojok Kanan Atas)
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: SvgPicture.asset(
//                       'assets/icons/ic_close.svg', // Pastikan aset ada
//                       width: 20,
//                       height: 20,
//                     ),
//                   ),
//                 ),

//                 // Header Content (Center)
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       top: 0), // Jarak Close ke Title 0 (Sejajar visual)
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       // Icon Birthday
//                       SvgPicture.asset(
//                         'assets/icons/ic_birthday.svg', // Gunakan icon birthday yang sama/beda
//                         width: 24,
//                         height: 24,
//                       ),
//                       const SizedBox(width: 8),
//                       // Text Judul
//                       const Text(
//                         "Birthday This Month!",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold, // Bold
//                           color: Colors.black, // 000000 100%
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 13), // Jarak Title ke Deskripsi

//             // ===========================
//             // 2. DESKRIPSI
//             // ===========================
//             RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                 style: const TextStyle(
//                   fontFamily: 'Poppins', // Sesuaikan font default Anda
//                   fontSize: 15,
//                   fontWeight: FontWeight.w600, // SemiBold
//                   color: Color(0xFF575757), // 575757 100%
//                 ),
//                 children: [
//                   const TextSpan(
//                     text:
//                         "Celebrate with your friends or colleagues who\nhave birthdays this month! ",
//                   ),
//                   // Icon Cake di dalam teks (Inline)
//                   WidgetSpan(
//                     alignment: PlaceholderAlignment.middle,
//                     child: SvgPicture.asset(
//                       'assets/icons/ic_birthday-cake.svg', // Pastikan aset ada
//                       width: 19,
//                       height: 19,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 23), // Jarak Deskripsi ke Profile

//             // ===========================
//             // 3. GRID PROFILE
//             // ===========================
//             Flexible(
//               child: GridView.builder(
//                 shrinkWrap: true,
//                 physics:
//                     const NeverScrollableScrollPhysics(), // Scroll ikut parent jika perlu
//                 itemCount: _visibleCount > _birthdayList.length
//                     ? _birthdayList.length
//                     : _visibleCount,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3, // 3 Kolom
//                   mainAxisSpacing: 19, // Jarak Atas-Bawah
//                   crossAxisSpacing: 13, // Jarak Kanan-Kiri
//                   childAspectRatio:
//                       0.65, // Rasio lebar:tinggi item (diatur agar muat teks)
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

//             // ===========================
//             // 4. TOMBOL LIHAT LAINNYA
//             // ===========================
//             if (!_isExpanded) ...[
//               const SizedBox(height: 25), // Jarak Profile ke Tombol
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _visibleCount = 9; // Tambah 1 baris (3 item)
//                     _isExpanded = true; // Hilangkan tombol
//                   });
//                 },
//                 child: const Text(
//                   "Lihat Lainnya",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600, // SemiBold
//                     color: Color(0xFF1F63C7), // 1F63C7 100%
//                   ),
//                 ),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }

//   // HELPER: BUILD SINGLE PROFILE ITEM
//   Widget _buildProfileItem({
//     required String name,
//     required String date,
//     required String imageUrl,
//   }) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         // 1. FOTO PROFILE (W=65, H=65)
//         // MEKANISME OFFLINE/ONLINE (Sama seperti EmployeeCard)
//         Container(
//           width: 65,
//           height: 65,
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.grey, // Placeholder bg
//           ),
//           child: ClipOval(
//             child: Image.network(
//               imageUrl, // Link dari list
//               fit: BoxFit.cover,
//               width: 65,
//               height: 65,
//               // Loading: Pakai Assets
//               loadingBuilder: (context, child, loadingProgress) {
//                 if (loadingProgress == null) return child;
//                 return Image.asset(
//                   'assets/images/home/default-user.jpg', // Aset Default
//                   fit: BoxFit.cover,
//                 );
//               },
//               // Error/Offline: Pakai Assets
//               errorBuilder: (context, error, stackTrace) {
//                 return Image.asset(
//                   'assets/images/home/default-user.jpg', // Aset Default
//                   fit: BoxFit.cover,
//                 );
//               },
//             ),
//           ),
//         ),

//         const SizedBox(height: 13), // Jarak Lingkaran ke Text Nama

//         // 2. NAMA (SemiBold, 14, Black)
//         Text(
//           name,
//           textAlign: TextAlign.center,
//           maxLines: 2, // Jaga-jaga nama panjang
//           overflow: TextOverflow.ellipsis,
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w600, // SemiBold
//             color: Colors.black, // 000000 100%
//             height: 1.1,
//           ),
//         ),

//         const SizedBox(height: 3), // Jarak Nama ke Tanggal

//         // 3. TANGGAL (Medium, 14, Grey)
//         Text(
//           date,
//           textAlign: TextAlign.center,
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500, // Medium
//             color: Color(0xFF575757), // 575757 100%
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
  // Logic untuk "Lihat Lainnya"
  int _visibleCount = 6;
  bool _isExpanded = false;

  // Dummy Data
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // PERBAIKAN 1: Semua konten rata kiri
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===========================
            // 1. ICON CLOSE (POJOK KANAN)
            // ===========================
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  'assets/icons/ic_close.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ),

            // Tidak ada SizedBox disini agar "tepat setelah" icon close

            // ===========================
            // 2. HEADER TITLE (RATA KIRI)
            // ===========================
            Row(
              // PERBAIKAN 2: Row dimulai dari Kiri (Start)
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

            // ===========================
            // 3. DESKRIPSI (RATA KIRI)
            // ===========================
            RichText(
              // PERBAIKAN 3: Text Align Left
              textAlign: TextAlign.left,
              text: TextSpan(
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF575757),
                  height: 1.2, // Tambahkan sedikit line height agar rapi
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

            // ===========================
            // 4. GRID PROFILE
            // ===========================
            Flexible(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _visibleCount > _birthdayList.length
                    ? _birthdayList.length
                    : _visibleCount,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  // PERBAIKAN 4: Rapatkan Jarak Antar Baris
                  mainAxisSpacing: 5, // Dikecilkan dari 19 -> 5
                  crossAxisSpacing: 13,
                  // PERBAIKAN 5: Sesuaikan Rasio agar item tidak terlalu tinggi (kosong bawahnya)
                  // Semakin besar angka, semakin pendek itemnya
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
            ),

            // ===========================
            // 5. TOMBOL LIHAT LAINNYA
            // ===========================
            if (!_isExpanded) ...[
              // PERBAIKAN: Ubah tinggi dari 15 menjadi 5 (atau 0 jika ingin nempel banget)
              const SizedBox(height: 0),

              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _visibleCount = 9;
                      _isExpanded = true;
                    });
                  },
                  child: const Text(
                    "Lihat Lainnya",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1F63C7),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem({
    required String name,
    required String date,
    required String imageUrl,
  }) {
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
              imageUrl,
              fit: BoxFit.cover,
              width: 65,
              height: 65,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Image.asset(
                  'assets/images/home/default-user.jpg',
                  fit: BoxFit.cover,
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/home/default-user.jpg',
                  fit: BoxFit.cover,
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

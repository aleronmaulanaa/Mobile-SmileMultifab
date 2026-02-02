// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
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

//   bool _isOnline = true;
//   late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

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
//   void initState() {
//     super.initState();
//     _initConnectivity();
//     _connectivitySubscription = Connectivity()
//         .onConnectivityChanged
//         .listen((List<ConnectivityResult> results) {
//       _updateConnectionStatus(results);
//     });
//   }

//   @override
//   void dispose() {
//     _connectivitySubscription.cancel();
//     super.dispose();
//   }

//   Future<void> _initConnectivity() async {
//     late List<ConnectivityResult> results;
//     try {
//       results = await Connectivity().checkConnectivity();
//     } catch (e) {
//       return;
//     }
//     if (!mounted) return;
//     _updateConnectionStatus(results);
//   }

//   void _updateConnectionStatus(List<ConnectivityResult> results) {
//     if (results.contains(ConnectivityResult.none)) {
//       setState(() {
//         _isOnline = false;
//       });
//     } else {
//       setState(() {
//         _isOnline = true;
//       });
//     }
//   }

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
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: GestureDetector(
//                   onTap: () => Navigator.pop(context),
//                   behavior: HitTestBehavior.opaque,
//                   child: Padding(
//                     padding: const EdgeInsets.all(4.0),
//                     child: SvgPicture.asset(
//                       'assets/icons/ic_close.svg',
//                       width: 24,
//                       height: 24,
//                     ),
//                   ),
//                 ),
//               ),

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
//                       text:
//                           "Celebrate with your friends or colleagues who\nhave birthdays this month! ",
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

//               GridView.builder(
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

//               if (!_isExpanded && _birthdayList.length > 6) ...[
//                 const SizedBox(height: 10),
//                 Center(
//                   child: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         _visibleCount = _birthdayList.length;
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
//             child: _buildImage(imageUrl),
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

//   Widget _buildImage(String url) {
//     if (!_isOnline) {
//       return Image.asset(
//         'assets/images/common/default-user.jpg', 
//         fit: BoxFit.cover,
//       );
//     }

//     final String cleanUrl = url.replaceAll(RegExp(r'(?<!:)/{2,}'), '/');

//     return Image.network(
//       cleanUrl,
//       fit: BoxFit.cover,
//       frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
//         if (wasSynchronouslyLoaded) return child;
//         return AnimatedOpacity(
//           opacity: frame == null ? 0 : 1,
//           duration: const Duration(milliseconds: 500),
//           curve: Curves.easeOut,
//           child: child,
//         );
//       },
//       errorBuilder: (context, error, stackTrace) {
//         return Image.asset(
//           'assets/images/common/default-user.jpg',
//           fit: BoxFit.cover,
//         );
//       },
//     );
//   }
// }

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BirthdayPopup extends StatefulWidget {
  const BirthdayPopup({super.key});

  @override
  State<BirthdayPopup> createState() => _BirthdayPopupState();
}

class _BirthdayPopupState extends State<BirthdayPopup> {
  int _visibleCount = 6;
  bool _isExpanded = false;
  bool _isOnline = true;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  final List<Map<String, String>> _birthdayList = [
    {"name": "Aisah Nurhayati", "date": "03 January", "img": "https://erp-multifab.com/storage//employees/Screen_Shot_2021-03-12_at_09_45_30.png"},
    {"name": "Erni Susilawati", "date": "23 January", "img": "https://erp-multifab.com/storage//employees/MFG-20241224-1735021410.jpg"},
    {"name": "Aridhito Bayu Kusnanda", "date": "09 January", "img": "https://erp-multifab.com/storage//default-user.jpg"},
    {"name": "Denny", "date": "23 January", "img": "https://erp-multifab.com/storage//employees/MFG-20250102-1735833475.jpg"},
    {"name": "Basuki Raharjo", "date": "02 January", "img": "https://erp-multifab.com/storage//default-user.jpg"},
    {"name": "Wahyu Kencono", "date": "30 January", "img": "https://erp-multifab.com/storage//default-user.jpg"},
    {"name": "Anggoro Ari Broto", "date": "08 January", "img": "https://erp-multifab.com/storage//default-user.jpg"},
    {"name": "Janter Michelson Lombu", "date": "28 January", "img": "https://erp-multifab.com/storage//default-user.jpg"},
    {"name": "Imam Dzikrillah", "date": "19 January", "img": "https://erp-multifab.com/storage//employees/MFG-20250710-1752110475.jpg"},
  ];

  @override
  void initState() {
    super.initState();
    _initConnectivity();
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> _initConnectivity() async {
    late List<ConnectivityResult> results;
    try {
      results = await Connectivity().checkConnectivity();
    } catch (e) {
      return;
    }
    if (!mounted) return;
    _updateConnectionStatus(results);
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    setState(() {
      _isOnline = !results.contains(ConnectivityResult.none);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar untuk kalkulasi responsif
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Container(
        // Lebar maksimal 407 (seperti aslinya) tapi tetap fleksibel di layar kecil
        constraints: BoxConstraints(
          maxWidth: 407,
          // Tinggi maksimal adalah 80% dari tinggi layar agar tidak overflow ke status bar/nav bar
          maxHeight: screenHeight * 0.8,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Membuat card mengikuti tinggi konten
          children: [
            // Header: Tombol Close (Tetap di atas)
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: SvgPicture.asset('assets/icons/ic_close.svg', width: 22, height: 22),
              ),
            ),

            // Konten yang bisa di-scroll
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(22, 0, 22, 22),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/ic_birthday.svg', width: 24, height: 24),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            "Birthday This Month!",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13, // Sedikit lebih kecil agar aman di layar mungil
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF575757),
                          height: 1.3,
                        ),
                        children: [
                          const TextSpan(text: "Celebrate with your friends or colleagues who birthdays this month! "),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: SvgPicture.asset('assets/icons/ic_birthday-cake.svg', width: 16, height: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Grid Responsive
                    LayoutBuilder(
                      builder: (context, constraints) {
                        // Kalkulasi rasio berdasarkan lebar box yang tersedia
                        double itemWidth = (constraints.maxWidth - 26) / 3;
                        // ChildAspectRatio dinamis: (lebar / tinggi_estimasi)
                        // Kita beri tinggi estimasi (avatar + spacing + 2 baris teks + tanggal)
                        double dynamicRatio = itemWidth / (itemWidth + 65);

                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _isExpanded ? _birthdayList.length : (_birthdayList.length > 6 ? 6 : _birthdayList.length),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 13,
                            childAspectRatio: dynamicRatio > 0.65 ? 0.65 : dynamicRatio,
                          ),
                          itemBuilder: (context, index) {
                            final person = _birthdayList[index];
                            return _buildProfileItem(
                              name: person['name']!,
                              date: person['date']!,
                              imageUrl: person['img']!,
                              availableWidth: itemWidth,
                            );
                          },
                        );
                      },
                    ),

                    if (!_isExpanded && _birthdayList.length > 6) ...[
                      const SizedBox(height: 16),
                      Center(
                        child: TextButton(
                          onPressed: () => setState(() => _isExpanded = true),
                          child: const Text(
                            "Lihat Lainnya",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF1F63C7)),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem({
    required String name,
    required String date,
    required String imageUrl,
    required double availableWidth,
  }) {
    // Ukuran avatar menyesuaikan lebar grid, maksimal 65
    double avatarSize = availableWidth * 0.8;
    if (avatarSize > 65) avatarSize = 65;

    return Column(
      children: [
        Container(
          width: avatarSize,
          height: avatarSize,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFE0E0E0)),
          child: ClipOval(child: _buildImage(imageUrl)),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.black, height: 1.1),
        ),
        const SizedBox(height: 2),
        Text(
          date,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Color(0xFF575757)),
        ),
      ],
    );
  }

  Widget _buildImage(String url) {
    if (!_isOnline) {
      return Image.asset('assets/images/common/default-user.jpg', fit: BoxFit.cover);
    }
    final String cleanUrl = url.replaceAll(RegExp(r'(?<!:)/{2,}'), '/');
    return Image.network(
      cleanUrl,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Image.asset('assets/images/common/default-user.jpg', fit: BoxFit.cover),
    );
  }
}
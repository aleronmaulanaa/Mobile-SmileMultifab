// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class AccountInfoCard extends StatelessWidget {
//   final String iconPath;
//   final String title;
//   final String value;
//   final bool showCopyIcon;
//   final VoidCallback? onCopyTap;

//   // TAMBAHAN: Parameter untuk ukuran icon custom
//   final double? iconWidth;
//   final double? iconHeight;

//   const AccountInfoCard({
//     super.key,
//     required this.iconPath,
//     required this.title,
//     required this.value,
//     this.showCopyIcon = false,
//     this.onCopyTap,
//     this.iconWidth, // Opsional
//     this.iconHeight, // Opsional
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 384,
//       height: 78,
//       // REVISI 1: Jarak antar section menjadi 18
//       margin: const EdgeInsets.only(bottom: 18),
//       padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 17),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.25),
//             offset: const Offset(0, 3),
//             blurRadius: 4,
//           ),
//         ],
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // ===========================
//           // 1. ICON BULAT KIRI
//           // ===========================
//           Container(
//             width: 44,
//             height: 44,
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(22),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.25),
//                   offset: const Offset(0, 3),
//                   blurRadius: 4,
//                 ),
//               ],
//             ),
//             child: Center(
//               // REVISI 2: Menggunakan ukuran custom jika ada, default 24
//               child: SvgPicture.asset(
//                 iconPath,
//                 width: iconWidth ?? 24,
//                 height: iconHeight ?? 24,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),

//           const SizedBox(width: 13),

//           // ===========================
//           // 2. TEXT SECTION
//           // ===========================
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w500,
//                     fontSize: 13,
//                     color: Color(0xFF575757),
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   value,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w500,
//                     fontSize: 13,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // ===========================
//           // 3. COPY ICON (KANAN)
//           // ===========================
//           if (showCopyIcon)
//             GestureDetector(
//               onTap: onCopyTap,
//               // HitTestBehavior.opaque agar area sentuh lebih responsif
//               behavior: HitTestBehavior.opaque,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 10),
//                 // REVISI 1: Memastikan ukuran copy icon W=24 H=23
//                 child: SvgPicture.asset(
//                   'assets/icons/ic_copy.svg',
//                   width: 24,
//                   height: 23,
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

class AccountInfoCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String value;
  final bool showCopyIcon;
  final VoidCallback? onCopyTap;
  final double? iconWidth;
  final double? iconHeight;

  const AccountInfoCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.value,
    this.showCopyIcon = false,
    this.onCopyTap,
    this.iconWidth,
    this.iconHeight,
  });

  @override
  Widget build(BuildContext context) {
    // LOGIKA PADDING OTOMATIS:
    // Jika ada ukuran custom (iconWidth/Height tidak null), padding jadi 0.
    // Jika tidak ada (default), padding tetap 10.
    final double dynamicPadding = (iconWidth != null || iconHeight != null) ? 0 : 10;

    return Container(
      width: 384,
      height: 78,
      margin: const EdgeInsets.only(bottom: 18), 
      padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 3),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ===========================
          // 1. ICON BULAT KIRI
          // ===========================
          Container(
            width: 44,
            height: 44,
            // TERAPKAN PADDING DINAMIS DISINI
            padding: EdgeInsets.all(dynamicPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(0, 3),
                  blurRadius: 4,
                ),
              ],
            ),
            // Center memastikan icon tetap di tengah meskipun padding 0
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                // Gunakan ukuran custom jika ada, jika tidak default 24
                width: iconWidth ?? 24,
                height: iconHeight ?? 24,
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(width: 13),

          // ===========================
          // 2. TEXT SECTION
          // ===========================
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Color(0xFF575757),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          // ===========================
          // 3. COPY ICON (KANAN)
          // ===========================
          if (showCopyIcon)
            GestureDetector(
              onTap: onCopyTap,
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SvgPicture.asset(
                  'assets/icons/ic_copy.svg',
                  width: 24,
                  height: 23,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
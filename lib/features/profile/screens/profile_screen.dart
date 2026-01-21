// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';

// // Import Shared Widget
// import 'package:mobile_smile_multifab/shared/widgets/base_background_scaffold.dart';

// // Import Widgets Profile
// import 'package:mobile_smile_multifab/features/profile/widgets/profile_card.dart';
// import 'package:mobile_smile_multifab/features/profile/widgets/profile_menu_section.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   // ==========================================
//   // LOGIKA CONNECTIVITY
//   // ==========================================
//   bool _isOnline = true;
//   late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

//   // URL Dummy untuk Foto Profile (Bisa diganti dengan data user asli nantinya)
//   final String _profileImageUrl =
//       "https://scontent-cgk2-1.cdninstagram.com/v/t51.2885-19/583200018_18367273294084132_5580250522120237473_n.jpg?efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4xMDgwLmMyIn0&_nc_ht=scontent-cgk2-1.cdninstagram.com&_nc_cat=104&_nc_oc=Q6cZ2QFUHV5MIMHQpwgpukY2oKbL4xJSdljTuioWaEMmkbDlefuKfo3TT1WJutYLmDiDUYA&_nc_ohc=doa6If38FpoQ7kNvwGbQ-30&_nc_gid=IffLnhmnXQE7k1TC0oEEwA&edm=AP4sbd4BAAAA&ccb=7-5&oh=00_Afo-q0wEwJnbQeErrNBpjefyIJ0asVmsjQsMjIrcQc86ew&oe=69761B8F&_nc_sid=7a9f4b";

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

//   // ==========================================
//   // UI BUILD
//   // ==========================================
//   @override
//   Widget build(BuildContext context) {
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double scale = screenHeight / 844.0;

//     final double headerCardTop = 170.0 * scale;
//     final double menuSectionTop = 380.0 * scale;

//     return BaseBackgroundScaffold(
//       isOnline: _isOnline,
//       child: Stack(
//         children: [
//           // ===========================
//           // LAYER 1: PROFILE MENU SECTION
//           // ===========================
//           // Positioned bottom: 0 akan memaksa menu section memanjang ke bawah
//           // Karena di widgetnya sudah kita set height: double.infinity
//           Positioned(
//             top: menuSectionTop,
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: const ProfileMenuSection(),
//           ),

//           // ===========================
//           // LAYER 2: PROFILE HEADER CARD
//           // ===========================
//           Positioned(
//             top: headerCardTop,
//             left: 24,
//             right: 24,
//             child: ProfileHeaderCard(
//               isOnline: _isOnline, // Kirim status online
//               imageUrl: _profileImageUrl, // Kirim URL foto
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

// Import Shared Widget
import 'package:mobile_smile_multifab/shared/widgets/base_background_scaffold.dart';

// Import Widgets Profile
import 'package:mobile_smile_multifab/features/profile/widgets/profile_card.dart';
import 'package:mobile_smile_multifab/features/profile/widgets/profile_menu_section.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // ==========================================
  // LOGIKA CONNECTIVITY
  // ==========================================
  bool _isOnline = true;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  // URL Dummy
  final String _profileImageUrl =
      "https://scontent-cgk2-1.cdninstagram.com/v/t51.2885-19/583200018_18367273294084132_5580250522120237473_n.jpg?efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4xMDgwLmMyIn0&_nc_ht=scontent-cgk2-1.cdninstagram.com&_nc_cat=104&_nc_oc=Q6cZ2QFUHV5MIMHQpwgpukY2oKbL4xJSdljTuioWaEMmkbDlefuKfo3TT1WJutYLmDiDUYA&_nc_ohc=doa6If38FpoQ7kNvwGbQ-30&_nc_gid=IffLnhmnXQE7k1TC0oEEwA&edm=AP4sbd4BAAAA&ccb=7-5&oh=00_Afo-q0wEwJnbQeErrNBpjefyIJ0asVmsjQsMjIrcQc86ew&oe=69761B8F&_nc_sid=7a9f4b";

  @override
  void initState() {
    super.initState();
    _initConnectivity();
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      _updateConnectionStatus(results);
    });
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
    if (results.contains(ConnectivityResult.none)) {
      setState(() {
        _isOnline = false;
      });
    } else {
      setState(() {
        _isOnline = true;
      });
    }
  }

  // ==========================================
  // UI BUILD
  // ==========================================
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double scale = screenHeight / 844.0;

    final double headerCardTop = 170.0 * scale;
    final double menuSectionTop = 380.0 * scale;

    return BaseBackgroundScaffold(
      isOnline: _isOnline,
      child: Stack(
        // PERBAIKAN 1: Izinkan Stack menggambar di luar batas (overflow)
        // Ini penting agar 'bottom: -100' berfungsi dan tidak terpotong.
        clipBehavior: Clip.none, 
        children: [
          // ===========================
          // LAYER 1: PROFILE MENU SECTION
          // ===========================
          Positioned(
            top: menuSectionTop,
            left: 0,
            right: 0,
            // PERBAIKAN 2: Gunakan nilai negatif!
            // Navbar Anda memakan area invisible sekitar 160px, tapi terlihat cuma 78px.
            // Kita paksa card turun 100px lebih dalam agar menutupi celah background.
            bottom: -100, 
            child: const ProfileMenuSection(),
          ),

          // ===========================
          // LAYER 2: PROFILE HEADER CARD
          // ===========================
          Positioned(
            top: headerCardTop,
            left: 24,
            right: 24,
            child: ProfileHeaderCard(
              isOnline: _isOnline,
              imageUrl: _profileImageUrl,
            ),
          ),
        ],
      ),
    );
  }
}
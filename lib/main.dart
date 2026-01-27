// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/date_symbol_data_local.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// // --- IMPORTS DARI KEDUA BRANCH ---

// // PROFILE FEATURE (Dari feature/profile)
// import 'package:mobile_smile_multifab/screens/main_wrapper.dart';

// // SCAN FEATURE (Dari dev)
// import 'screens/scan/scan_page.dart';

// // APP SCREENS (Dari dev)
// import 'screens/login/login_page.dart';
// import 'screens/home_screen.dart'; // Jika dibutuhkan

// // ATTENDANCE FEATURE (Dari dev)
// import 'features/attendance/pages/attendance_page.dart';
// import 'features/attendance/services/connectivity_service.dart';
// import 'features/attendance/services/notification_service.dart';
// import 'features/attendance/services/location_tracking_service.dart';

// // MODELS (Dari dev)
// import 'features/attendance/models/attendance_history.dart';
// import 'features/attendance/models/attendance_daily_summary.dart';
// import 'features/attendance/models/location_tracking.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // ================= ORIENTATION
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//   ]);

//   // ================= FIREBASE
//   // Pastikan file google-services.json sudah ada
//   await Firebase.initializeApp();

//   // ================= NOTIFICATION
//   await NotificationService.initialize();

//   // ================= LOCALIZATION
//   await initializeDateFormatting('id_ID', null);

//   // ================= CONNECTIVITY
//   ConnectivityService.initialize();

//   // ================= HIVE INIT
//   await Hive.initFlutter();

//   // ================= REGISTER ADAPTER
//   Hive.registerAdapter(AttendanceHistoryAdapter());
//   Hive.registerAdapter(AttendanceDailySummaryAdapter());
//   Hive.registerAdapter(LocationTrackingAdapter());

//   // ================= OPEN BOX
//   await Hive.openBox<AttendanceHistory>('attendance_history');
//   await Hive.openBox<AttendanceDailySummary>('attendance_daily_summary');
//   await Hive.openBox<LocationTracking>('tracking_buffer');

//   runApp(const MyApp());
// }

// // 🔥 FUNCTION TEST FIRESTORE (AMAN - DIPERTAHANKAN)
// Future<void> testSendFirestore() async {
//   await FirebaseFirestore.instance.collection('attendance').add({
//     'userId': 'test_user',
//     'type': 'checkin',
//     'status': 'online',
//     'time': DateTime.now().toIso8601String(),
//   });
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // Menggabungkan nama aplikasi (Smile Multifab terdengar lebih lengkap)
//       title: 'Smile Multifab',

//       // Menggunakan Tema dari Dev (lebih lengkap dengan Font Poppins & Material 3)
//       theme: ThemeData(
//         useMaterial3: true,
//         fontFamily: 'Poppins',
//         colorScheme: ColorScheme.fromSeed(
//           // Menggunakan kode warna terbaru dari dev
//           seedColor: const Color(0xFFFA0209),
//         ),
//       ),

//       // 🔑 LOGIC PENENTUAN HALAMAN AWAL
//       // Default ke Login Page (Flow normal aplikasi)
//       // Jika Anda ingin langsung melihat MainWrapper saat development,
//       // ganti ini menjadi: home: const MainWrapper(),
//       home: const LoginPage(),

//       // REGISTER ROUTES
//       // MainWrapper ditambahkan ke routes agar bisa diakses dari Login
//       routes: {
//         '/main': (_) => const MainWrapper(), // Route ke fitur baru (Profile/Wrapper)
//         '/scan': (_) => const ScanPage(),
//         '/attendance': (_) => const AttendancePage(),
//       },
//     );
//   }
// }

// // ==================
// // PAGE TEST (TETAP ADA, TIDAK DIHAPUS)
// // ==================
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.title)),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('$_counter'),
//             const SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => const AttendancePage(),
//                   ),
//                 );
//               },
//               child: const Text('Buka Kehadiran'),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: testSendFirestore,
//         child: const Icon(Icons.cloud_upload),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// --- IMPORTS DARI KEDUA BRANCH ---

// PROFILE FEATURE (Dari feature/profile)
import 'package:mobile_smile_multifab/screens/main_wrapper.dart'; // Import ini PENTING

// SCAN FEATURE (Dari dev)
import 'screens/scan/scan_page.dart';

// APP SCREENS (Dari dev)
import 'screens/login/login_page.dart';
// import 'screens/home_screen.dart'; // Tidak wajib di main jika sudah ada di wrapper

// ATTENDANCE FEATURE (Dari dev)
import 'features/attendance/pages/attendance_page.dart';
import 'features/attendance/services/connectivity_service.dart';
import 'features/attendance/services/notification_service.dart';
import 'features/attendance/services/location_tracking_service.dart';

// MODELS (Dari dev)
import 'features/attendance/models/attendance_history.dart';
import 'features/attendance/models/attendance_daily_summary.dart';
import 'features/attendance/models/location_tracking.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ================= ORIENTATION
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // ================= FIREBASE
  // Pastikan file google-services.json sudah ada
  await Firebase.initializeApp();

  // ================= NOTIFICATION
  await NotificationService.initialize();

  // ================= LOCALIZATION
  await initializeDateFormatting('id_ID', null);

  // ================= CONNECTIVITY
  ConnectivityService.initialize();

  // ================= HIVE INIT
  await Hive.initFlutter();

  // ================= REGISTER ADAPTER
  Hive.registerAdapter(AttendanceHistoryAdapter());
  Hive.registerAdapter(AttendanceDailySummaryAdapter());
  Hive.registerAdapter(LocationTrackingAdapter());

  // ================= OPEN BOX
  await Hive.openBox<AttendanceHistory>('attendance_history');
  await Hive.openBox<AttendanceDailySummary>('attendance_daily_summary');
  await Hive.openBox<LocationTracking>('tracking_buffer');

  runApp(const MyApp());
}

// 🔥 FUNCTION TEST FIRESTORE (AMAN - DIPERTAHANKAN)
Future<void> testSendFirestore() async {
  await FirebaseFirestore.instance.collection('attendance').add({
    'userId': 'test_user',
    'type': 'checkin',
    'status': 'online',
    'time': DateTime.now().toIso8601String(),
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Menggabungkan nama aplikasi (Smile Multifab terdengar lebih lengkap)
      title: 'Smile Multifab',

      // Menggunakan Tema dari Dev (lebih lengkap dengan Font Poppins & Material 3)
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
          // Menggunakan kode warna terbaru dari dev
          seedColor: const Color(0xFFFA0209),
        ),
      ),

      // 🔑 PERBAIKAN UTAMA DISINI:
      // Ubah dari LoginPage() ke MainWrapper() agar Background & Navbar muncul.
      home: const MainWrapper(),

      // REGISTER ROUTES
      // MainWrapper ditambahkan ke routes agar bisa diakses dari Login (jika nanti logika login dipasang lagi)
      routes: {
        '/main': (_) => const MainWrapper(),
        '/scan': (_) => const ScanPage(),
        '/attendance': (_) => const AttendancePage(),
      },
    );
  }
}

// ==================
// PAGE TEST (TETAP ADA, TIDAK DIHAPUS)
// ==================
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_counter'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AttendancePage(),
                  ),
                );
              },
              child: const Text('Buka Kehadiran'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: testSendFirestore,
        child: const Icon(Icons.cloud_upload),
      ),
    );
  }
}

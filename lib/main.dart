import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'features/attendance/pages/attendance_page.dart';
import 'features/attendance/services/connectivity_service.dart';
import 'features/attendance/services/notification_service.dart';
import 'features/attendance/services/location_tracking_service.dart';

import 'features/attendance/models/attendance_history.dart';
import 'features/attendance/models/attendance_daily_summary.dart';
import 'features/attendance/models/location_tracking.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ================= FIREBASE
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

  // 🔥 BUFFER TRACKING (HIDDEN – USER TIDAK BISA LIHAT)
  await Hive.openBox<LocationTracking>('tracking_buffer');

  runApp(const MyApp());
}

// 🔥 FUNCTION TEST FIRESTORE (AMAN)
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

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
      appBar: AppBar(
        title: Text(widget.title),
      ),
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
        onPressed: () async {
          await testSendFirestore();
        },
        child: const Icon(Icons.cloud_upload),
      ),
    );
  }
}

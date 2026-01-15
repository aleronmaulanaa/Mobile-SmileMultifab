import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // 1. WAJIB IMPORT INI
import 'package:mobile_smile_multifab/screens/home_screen.dart';

void main() {
  // 2. Pastikan binding terinisialisasi sebelum mengatur orientasi
  WidgetsFlutterBinding.ensureInitialized();

  // 3. Kunci orientasi hanya ke Portrait Up (Posisi HP Berdiri Normal)
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    // Jalankan aplikasi setelah orientasi dikunci
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smile Multifab',
      home: const HomeScreen(),
    );
  }
}

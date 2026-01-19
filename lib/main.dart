import 'package:flutter/material.dart';

// 1. NONAKTIFKAN IMPORT HOME SEMENTARA
// import 'package:mobile_smile_multifab/features/home/screens/home_screen.dart';

// 2. TAMBAHKAN IMPORT PROFILE
import 'package:mobile_smile_multifab/features/profile/screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smile V2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFA0007)),
        useMaterial3: true,
      ),

      // 3. UBAH BAGIAN INI:
      // Dari 'const HomeScreen()' menjadi 'const ProfileScreen()'
      // Ini akan membuat aplikasi langsung masuk ke halaman Profile saat dibuka.
      home: const ProfileScreen(),
    );
  }
}

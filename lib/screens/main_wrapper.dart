import 'package:flutter/material.dart';
import 'package:mobile_smile_multifab/shared/widgets/custom_bottom_navbar.dart';

// Import kedua halaman content kamu
import 'package:mobile_smile_multifab/features/home/screens/home_screen.dart'; // Pastikan path sesuai
import 'package:mobile_smile_multifab/features/profile/screens/profile_screen.dart'; // Pastikan path sesuai

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _selectedIndex = 0;

  // Daftar halaman yang akan ditampilkan
  // Kita menggunakan "const" agar widget tidak direbuild ulang terus menerus
  final List<Widget> _pages = [
    const HomeScreen(),    // Index 0
    const ProfileScreen(), // Index 1
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Logika Birthday: Hanya muncul jika di Home (index 0)
    final bool showBirthday = _selectedIndex == 0;

    return Scaffold(
      // Kita set background color global di sini agar transisi mulus
      backgroundColor: const Color(0xFFF3F4F6),
      
      // IndexedStack menjaga state halaman tetap hidup (tidak reload saat pindah tab)
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      
      // Navbar Global
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        showBirthday: showBirthday,
      ),
    );
  }
}
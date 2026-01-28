import 'package:flutter/material.dart';
import 'package:mobile_smile_multifab/shared/widgets/custom_bottom_navbar.dart';
import 'package:mobile_smile_multifab/features/home/screens/home_screen.dart';
import 'package:mobile_smile_multifab/features/profile/screens/profile_screen.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool showBirthday = _selectedIndex == 0;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),

      extendBody: true,

      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        showBirthday: showBirthday,
      ),
    );
  }
}

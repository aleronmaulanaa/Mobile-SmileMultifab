import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

// Import widget UI (Card, Carousel, Menu, News)
import 'package:mobile_smile_multifab/features/home/widgets/employee_card.dart';
import 'package:mobile_smile_multifab/features/home/widgets/banner_carousel.dart';
import 'package:mobile_smile_multifab/features/home/widgets/home_menu.dart';
import 'package:mobile_smile_multifab/features/home/widgets/news_section.dart';

// Import Wrapper Background
import 'package:mobile_smile_multifab/shared/widgets/base_background_scaffold.dart';

// HAPUS import custom_bottom_navbar dan flutter_svg karena tidak dipakai lagi di sini

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isOnline = true;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  // Data dummy
  final int testSpLevel = 3;
  final bool testSyncIcon = true;

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

  @override
  Widget build(BuildContext context) {
    // HAPUS variabel statusText, statusCircleColor, dll karena header sudah otomatis.

    return BaseBackgroundScaffold(
      isOnline: _isOnline,
      // PERBAIKAN: Langsung arahkan ke SingleChildScrollView sebagai 'child'
      child: SingleChildScrollView(
        // Padding agar konten tidak tertutup Header (atas) & Navbar (bawah)
        padding: const EdgeInsets.only(top: 115, bottom: 125),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              EmployeeCard(
                spLevel: testSpLevel,
                showSyncIcon: testSyncIcon,
              ),
              const SizedBox(height: 20),
              const BannerCarousel(),
              const SizedBox(height: 24),
              const HomeMenu(),
              const SizedBox(height: 24),
              const NewsSection(),
            ],
          ),
        ),
      ),
    );
  }
}

// HAPUS class HeaderCurveClipper di sini karena sudah ada di BaseBackgroundScaffold
import 'dart:async'; // <--- PERUBAHAN: Tambah import ini untuk StreamSubscription
import 'package:connectivity_plus/connectivity_plus.dart'; // <--- PERUBAHAN: Import library koneksi
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_smile_multifab/features/home/widgets/employee_card.dart';
import 'package:mobile_smile_multifab/features/home/widgets/banner_carousel.dart';
import 'package:mobile_smile_multifab/features/home/widgets/home_menu.dart';
import 'package:mobile_smile_multifab/features/home/widgets/news_section.dart';
import 'package:mobile_smile_multifab/features/home/widgets/custom_bottom_navbar.dart';

// PERUBAHAN 1: Ubah ke StatefulWidget agar bisa update status realtime
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ==========================================
  // VARIABEL LOGIKA KONEKSI
  // ==========================================
  bool _isOnline = true; // Default anggap online dulu
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  // Variabel Dummy (Tetap ada)
  final int testSpLevel = 3;
  final bool testSyncIcon = true;

  @override
  void initState() {
    super.initState();
    // 1. Cek status awal saat aplikasi dibuka
    _initConnectivity();

    // 2. Dengarkan perubahan (misal: user mematikan wifi/data)
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      _updateConnectionStatus(results);
    });
  }

  @override
  void dispose() {
    // Matikan pendengar saat halaman ditutup agar hemat memori
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Fungsi untuk cek status awal
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

  // Fungsi Logika Penentuan Online/Offline
  void _updateConnectionStatus(List<ConnectivityResult> results) {
    // Jika list mengandung none, berarti tidak ada koneksi
    if (results.contains(ConnectivityResult.none)) {
      setState(() {
        _isOnline = false;
      });
    } else {
      // Jika ada mobile, wifi, ethernet, vpn, dll -> Online
      setState(() {
        _isOnline = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // ==========================================
    // LOGIKA WARNA & TEXT (SESUAI REQUEST)
    // ==========================================

    // 1. Teks Status
    final String statusText = _isOnline ? "Online" : "Offline";

    // 2. Warna Lingkaran (Bulatan)
    // Online: Hijau Terang (74FF46) | Offline: Merah Request (FF4646)
    final Color statusCircleColor =
        _isOnline ? const Color(0xFF74FF46) : const Color(0xFFFF4646);

    // 3. Warna Teks
    // Online: Hijau Gelap (65D340) | Offline: Merah Gelap Request (D34040)
    final Color statusTextColor =
        _isOnline ? const Color(0xFF65D340) : const Color(0xFFD34040);

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: Stack(
        children: [
          // ==============================
          // LAYER 1: BACKGROUND GRADIENT
          // ==============================
          ClipPath(
            clipper: HeaderCurveClipper(),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFAFAFA),
                    Color(0xFFFDE5E3),
                    Color(0xFFFDCBC9),
                  ],
                  stops: [0.31, 0.55, 1.0],
                ),
              ),
            ),
          ),

          // ==============================
          // LAYER 2: SCROLLABLE CONTENT
          // ==============================
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 130, bottom: 120),
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

          // ==============================
          // LAYER 3: FIXED HEADER (Top Bar)
          // ==============================
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: const Color(0xFFFAFAFA),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // --- BAGIAN KIRI: LOGO ---
                      Image.asset(
                        'assets/images/common/logo_smile_v2.png',
                        height: 58,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Text("Smile V2",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red));
                        },
                      ),

                      // --- BAGIAN KANAN: ICON & STATUS ---
                      Row(
                        children: [
                          // 1. Icon Notifikasi
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/ic_notification.svg',
                                width: 24,
                                height: 24,
                              ),
                              Positioned(
                                right: 1,
                                top: 0,
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFF04241),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              )
                            ],
                          ),

                          const SizedBox(width: 16),

                          // 2. Status Koneksi (DINAMIS DENGAN WARNA BARU)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // BULATAN INDIKATOR
                                Container(
                                  width: 18,
                                  height: 18,
                                  decoration: BoxDecoration(
                                    color:
                                        statusCircleColor, // <--- Pakai Warna Lingkaran
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xFFDBDBDB),
                                      width: 2,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 2),
                                // TEKS ONLINE / OFFLINE
                                Text(
                                  statusText,
                                  style: TextStyle(
                                    color:
                                        statusTextColor, // <--- Pakai Warna Teks
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ==============================
          // LAYER 4: BOTTOM NAVIGATION BAR
          // ==============================
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavBar(),
          ),
        ],
      ),
    );
  }
}

// Custom Clipper (Tidak Berubah)
class HeaderCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 40,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

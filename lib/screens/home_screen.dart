import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_smile_multifab/features/home/widgets/employee_card.dart';
import 'package:mobile_smile_multifab/features/home/widgets/banner_carousel.dart';
import 'package:mobile_smile_multifab/features/home/widgets/home_menu.dart';
import 'package:mobile_smile_multifab/features/home/widgets/news_section.dart';
import 'package:mobile_smile_multifab/features/home/widgets/custom_bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

// ==========================================
  // VARIABEL TRIGGER (GANTI NILAI DISINI UNTUK TESTING)
  // ==========================================
  final int testSpLevel =
      3; // Coba ganti: 0 (Normal), 1 (Kuning), 2 (Orange), 3 (Merah)
  final bool testSyncIcon = true; // Coba ganti: true (Ada icon), false (Hilang)
  // ==========================================

  @override
  Widget build(BuildContext context) {
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
          // Konten ditaruh di sini agar bisa discroll
          SingleChildScrollView(
            // padding: const EdgeInsets.only(
            //     top: 110), // PENTING: Jarak agar tidak ketutup Header

            // PERBAIKAN 1: Tambahkan padding bottom: 120
            // Agar konten paling bawah tidak tertutup Bottom Navbar
            padding: const EdgeInsets.only(top: 130, bottom: 120),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Di sini nanti tempat Widget Kartu Absen, Menu, dll
                  // Saya buat dummy box panjang biar kelihatan bisa discroll
                  EmployeeCard(
                    spLevel: testSpLevel, // Menggunakan variabel trigger
                    showSyncIcon: testSyncIcon, // Menggunakan variabel trigger
                  ),
                  const SizedBox(height: 20),

                  const BannerCarousel(),

// Jarak antara Banner dan Menu
                  const SizedBox(height: 24),

                  // 3. MENU FITUR (BARU)
                  const HomeMenu(),

                  // Jarak antara Menu dan Berita
                  const SizedBox(height: 24),

                  // 4. ARTIKEL BERITA (BARU)
                  const NewsSection(),

                  // const SizedBox(height: 20),
                  // Container(height: 700, color: Colors.white.withOpacity(0.5)),
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
              // PERBAIKAN DISINI:
              // 1. Kita beri warna background agar tidak tembus pandang.
              // Saya gunakan FAFAFA agar menyatu dengan gradasi paling atas.
              color: const Color(0xFFFAFAFA),

              // 2. Opsional: Tambahkan shadow tipis di bawah header
              // agar terlihat terpisah dari konten saat discroll
              // decoration: BoxDecoration(
              //   color: const Color(0xFFFAFAFA),
              //   boxShadow: [
              //     BoxShadow(
              //       color: Colors.black.withOpacity(0.05),
              //       blurRadius: 5,
              //       offset: const Offset(0, 2),
              //     ),
              //   ],
              // ),

              child: SafeArea(
                // bottom: false memastikan padding bawah aman
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

                          // 2. Status Koneksi
                          Padding(
                            padding: const EdgeInsets.only(
                                top:
                                    8.0), // <--- UBAH ANGKA INI UNTUK NAIK/TURUN
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 18,
                                  height: 18,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF74FF46),
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
                                      ]),
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  "Online",
                                  style: TextStyle(
                                    color: Color(0xFF65D340),
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
          // LAYER 4: BOTTOM NAVIGATION BAR (BARU)
          // ==============================
          // PERBAIKAN 3: Menambahkan Custom Bottom Nav Bar disini
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

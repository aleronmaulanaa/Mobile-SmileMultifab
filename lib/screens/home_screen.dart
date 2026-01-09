import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Warna dasar aplikasi (F3F4F6)
      backgroundColor: const Color(0xFFF3F4F6),
      body: Stack(
        children: [
          // Background Gradient dengan Kurva
          ClipPath(
            clipper: HeaderCurveClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4, // Tinggi area gradient
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFAFAFA), // Stops 31%
                    Color(0xFFFDE5E3), // Stops 55%
                    Color(0xFFFDCBC9), // Stops 100%
                  ],
                  stops: [0.31, 0.55, 1.0],
                ),
              ),
            ),
          ),
          
          // Layer untuk konten (Header, dsb) akan diletakkan di sini nanti
          const SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Nanti kita isi Header di sini
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Clipper untuk membuat lengkungan di bawah
class HeaderCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // 1. Mulai dari titik 0,0 (kiri atas)
    // 2. Tarik garis ke bawah di sisi kiri (sisakan ruang untuk lengkungan)
    path.lineTo(0, size.height - 60); 
    
    // 3. Membuat lengkungan (Curve)
    // quadraticBezierTo(titik_kontrol_x, titik_kontrol_y, titik_tujuan_x, titik_tujuan_y)
    path.quadraticBezierTo(
      size.width / 2,     // Titik tengah secara horizontal
      size.height + 40,   // Menarik lengkungan ke bawah melewati batas container
      size.width,         // Titik akhir di sisi kanan
      size.height - 60,   // Tinggi akhir di sisi kanan (sejajar dengan sisi kiri)
    );
    
    // 4. Tarik garis ke pojok kanan atas
    path.lineTo(size.width, 0);
    
    // 5. Tutup jalur
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
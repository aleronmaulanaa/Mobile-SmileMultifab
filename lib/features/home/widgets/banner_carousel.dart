import 'dart:async';
import 'package:flutter/material.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  // Controller untuk PageView
  final PageController _pageController = PageController();

  // Index halaman saat ini (0-3)
  int _currentPage = 0;

  // Timer untuk auto slide
  Timer? _timer;

  // Daftar gambar dummy (Ganti dengan asset Anda nanti)
  // Pastikan Anda punya 4 gambar atau gunakan placeholder sementara
  final List<String> _bannerImages = [
    'assets/images/home/banner_1.png', // Ganti dengan path gambar asli
    'assets/images/home/banner_2.jpg',
    'assets/images/home/banner_3.jpg',
    'https://www.medcoenergi.com/uploads/pages/3/1346x390-our-business-banner-x.jpg',
  ];

  @override
  void initState() {
    super.initState();
    // Jalankan timer untuk auto slide
    _startAutoSlide();
  }

  @override
  void dispose() {
    // Matikan timer dan controller saat widget dihancurkan agar tidak memory leak
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  // Fungsi untuk memulai auto slide
  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_currentPage < _bannerImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0; // Kembali ke awal
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ===========================
        // BAGIAN 1: GAMBAR BANNER
        // ===========================
        Container(
          width: double.infinity, // Mengikuti lebar parent (W=387 di desain)
          height: 90, // H = 90 (Fix)
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9), // Corner Radius = 9
            // Opsional: Shadow tipis agar banner agak "pop up"
            // boxShadow: [
            //   BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
            // ],
          ),
          // ClipRRect untuk memotong gambar sesuai radius container
          child: ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: PageView.builder(
              controller: _pageController,
              itemCount: _bannerImages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              // itemBuilder: (context, index) {
              //   // Placeholder sementara jika file gambar belum ada
              //   // Nanti ganti child ini dengan Image.asset(...)
              //   return Image.asset(
              //     _bannerImages[index],
              //     fit: BoxFit.cover, // Gambar memenuhi area WxH
              //     errorBuilder: (context, error, stackTrace) {
              //       // Fallback jika gambar error/tidak ditemukan
              //       return Container(
              //         color: Colors.grey[300],
              //         child: Center(
              //           child: Icon(Icons.image, color: Colors.grey[500]),
              //         ),
              //       );
              //     },
              //   );
              // },
              itemBuilder: (context, index) {
                // Ambil string source gambar
                final String imageSource = _bannerImages[index];

                // Cek apakah ini URL Online (diawali http/https)
                bool isNetworkImage = imageSource.startsWith('http');

                // LOGIKA PEMILIHAN WIDGET IMAGE
                if (isNetworkImage) {
                  // --- JIKA GAMBAR ONLINE ---
                  return Image.network(
                    imageSource,
                    fit: BoxFit.cover,
                    // Loading builder (opsional: efek saat loading)
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: Colors.grey[200],
                        child: const Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                      );
                    },
                    // Error builder (opsional: jika gagal load)
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child:
                            const Icon(Icons.broken_image, color: Colors.grey),
                      );
                    },
                  );
                } else {
                  // --- JIKA GAMBAR LOKAL ---
                  return Image.asset(
                    imageSource,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.image_not_supported,
                            color: Colors.grey),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ),

        // Jarak antara Banner dan Indikator = 5
        const SizedBox(height: 5),

        // ===========================
        // BAGIAN 2: INDIKATOR SLIDE
        // ===========================
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_bannerImages.length, (index) {
            // Cek apakah ini index yang aktif
            bool isActive = _currentPage == index;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              // Jarak antar lingkaran = 5
              margin: const EdgeInsets.symmetric(horizontal: 2.5),
              // Ukuran:
              // Jika Aktif: W=23, H=5
              // Jika Tidak: W=5, H=5
              width: isActive ? 23 : 5,
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xFFF04142), // Warna F04142 100%
                borderRadius:
                    BorderRadius.circular(5), // Sudut tumpul (lingkaran)
              ),
            );
          }),
        ),
      ],
    );
  }
}

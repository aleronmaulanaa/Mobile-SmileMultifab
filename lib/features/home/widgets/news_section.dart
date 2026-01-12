import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({super.key});

  // Fungsi untuk membuka Link Website
  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://app.erp-multifab.com/artikel');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Dummy Data Berita (Sekarang menggunakan URL)
    final List<Map<String, String>> newsData = [
      {
        'title':
            'Sinergi Terjalin: Penandatanganan Kontrak Ekstension GI 150 kV Pinayungan',
        'desc':
            'Dalam upaya memperkuat infrastruktur kelistrikan nasional, telah dilaksanakan penandatanganan kontrak kerjasama pembangunan.',
        'date': 'Posting date: 24 April 2025',
        'image':
            'https://erp-multifab.com/storage/artikel/MFG-20250424-1745461716.jpeg', // Ganti dengan aset gambar Anda
      },
      {
        'title': 'Selamat Pagi dari Gardu induk (substation) Blawan Ijen!',
        'desc':
            'Selamat Pagi dari Gardu Induk Blawan Ijen! Sinar mentari pagi mulai menyapa, menghadirkan semangat baru dari Gardu Induk Blawan Ijen.',
        'date': 'Posting date: 19 February 2025',
        'image':
            'https://erp-multifab.com/storage/artikel/MFG-20250219-1739931591.JPG', // Ganti dengan aset gambar Anda
      },
    ];

    return Column(
      children: [
        // ===========================
        // 1. HEADER (Artikel Berita & Lihat Semua)
        // ===========================
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Artikel Berita",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500, // Medium
                  color: Colors.black, // 000000 100%
                ),
              ),
              GestureDetector(
                onTap: _launchURL,
                child: const Text(
                  "Lihat semua",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500, // Medium
                    color: Color(0xFF1F63C7), // 1F63C7 100%
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFF1F63C7),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // ===========================
        // 2. LIST KARTU BERITA
        // ===========================
        ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: newsData.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return _buildNewsCard(
              title: newsData[index]['title']!,
              desc: newsData[index]['desc']!,
              date: newsData[index]['date']!,
              imagePath: newsData[index]['image']!,
            );
          },
        ),
      ],
    );
  }

  // =========================================
  // HELPER: BUILD NEWS CARD
  // =========================================
  Widget _buildNewsCard({
    required String title,
    required String desc,
    required String date,
    required String imagePath,
  }) {
    // LOGIKA CEK APAKAH URL (ONLINE)
    bool isNetworkImage = imagePath.startsWith('http');

    return Container(
      width: double.infinity,
      height: 127,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 3),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          // 1. GAMBAR BERITA
          Container(
            width: 95,
            height: 95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.grey[200], // Warna dasar saat loading/kosong
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),

              // >>> IMPLEMENTASI LOGIKA DISINI <<<
              child: isNetworkImage
                  ? Image.network(
                      imagePath,
                      fit: BoxFit.cover,
                      // Loading Builder: Tampil saat gambar sedang didownload
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2)),
                        );
                      },
                      // Error Builder: Tampil jika URL mati / tidak ada internet
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.broken_image,
                                  color: Colors.grey, size: 30),
                              SizedBox(height: 4),
                              Text("Error",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.grey))
                            ],
                          ),
                        );
                      },
                    )
                  : Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      // Error Builder: Tampil jika file asset tidak ditemukan
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: const Icon(Icons.image_not_supported,
                              color: Colors.grey),
                        );
                      },
                    ),
            ),
          ),

          const SizedBox(width: 15),

          // 2. BAGIAN TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // JUDUL
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 4),

                // DESKRIPSI
                Text(
                  desc,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF5F6468),
                    height: 1.2,
                  ),
                ),

                const Spacer(),

                // TANGGAL
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF5F6468),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

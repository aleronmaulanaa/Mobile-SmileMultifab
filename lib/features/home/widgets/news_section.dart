// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:webview_flutter/webview_flutter.dart'; // Import WebView

// class NewsSection extends StatelessWidget {
//   const NewsSection({super.key});

//   // FUNGSI BARU: Membuka WebView di dalam Aplikasi
//   void _openWebView(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const ArticleWebViewPage(
//           url: 'https://app.erp-multifab.com/artikel',
//           title: 'Artikel Berita',
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Dummy Data Berita
//     final List<Map<String, String>> newsData = [
//       {
//         'title':
//             'Sinergi Terjalin: Penandatanganan Kontrak Ekstension GI 150 kV Pinayungan',
//         'desc':
//             'Dalam upaya memperkuat infrastruktur kelistrikan nasional, telah dilaksanakan penandatanganan kontrak kerjasama pembangunan.',
//         'date': 'Posting date: 24 April 2025',
//         'image':
//             'https://erp-multifab.com/storage/artikel/MFG-20250424-1745461716.jpeg',
//       },
//       {
//         'title': 'Selamat Pagi dari Gardu induk (substation) Blawan Ijen!',
//         'desc':
//             'Selamat Pagi dari Gardu Induk Blawan Ijen! Sinar mentari pagi mulai menyapa, menghadirkan semangat baru dari Gardu Induk Blawan Ijen.',
//         'date': 'Posting date: 19 February 2025',
//         'image':
//             'https://erp-multifab.com/storage/artikel/MFG-20250219-1739931591.JPG',
//       },
//     ];

//     return Column(
//       children: [
//         // ===========================
//         // 1. HEADER (Artikel Berita & Lihat Semua)
//         // ===========================
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 "Artikel Berita",
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () =>
//                     _openWebView(context), // <--- PANGGIL FUNGSI NAVIGASI
//                 child: const Text(
//                   "Lihat semua",
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: Color(0xFF1F63C7),
//                     decoration: TextDecoration.underline,
//                     decorationColor: Color(0xFF1F63C7),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),

//         const SizedBox(height: 16),

//         // ===========================
//         // 2. LIST KARTU BERITA
//         // ===========================
//         ListView.separated(
//           padding: EdgeInsets.zero,
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: newsData.length,
//           separatorBuilder: (context, index) => const SizedBox(height: 12),
//           itemBuilder: (context, index) {
//             return _buildNewsCard(
//               title: newsData[index]['title']!,
//               desc: newsData[index]['desc']!,
//               date: newsData[index]['date']!,
//               imagePath: newsData[index]['image']!,
//             );
//           },
//         ),
//       ],
//     );
//   }

//   // =========================================
//   // HELPER: BUILD NEWS CARD
//   // =========================================
//   Widget _buildNewsCard({
//     required String title,
//     required String desc,
//     required String date,
//     required String imagePath,
//   }) {
//     bool isNetworkImage = imagePath.startsWith('http');

//     return Container(
//       width: double.infinity,
//       height: 127,
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(9),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.25),
//             offset: const Offset(0, 3),
//             blurRadius: 4,
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           // 1. GAMBAR BERITA
//           Container(
//             width: 95,
//             height: 95,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(7),
//               color: Colors.grey[200],
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(7),
//               child: isNetworkImage
//                   ? Image.network(
//                       imagePath,
//                       fit: BoxFit.cover,
//                       loadingBuilder: (context, child, loadingProgress) {
//                         if (loadingProgress == null) return child;
//                         return const Center(
//                           child: SizedBox(
//                               width: 20,
//                               height: 20,
//                               child: CircularProgressIndicator(strokeWidth: 2)),
//                         );
//                       },
//                       errorBuilder: (context, error, stackTrace) {
//                         return Container(
//                           color: Colors.grey[300],
//                           child: const Icon(Icons.broken_image,
//                               color: Colors.grey, size: 30),
//                         );
//                       },
//                     )
//                   : Image.asset(
//                       imagePath,
//                       fit: BoxFit.cover,
//                       errorBuilder: (context, error, stackTrace) {
//                         return Container(
//                           color: Colors.grey[300],
//                           child: const Icon(Icons.image_not_supported,
//                               color: Colors.grey),
//                         );
//                       },
//                     ),
//             ),
//           ),
//           const SizedBox(width: 15),
//           // 2. BAGIAN TEXT
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   title,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   desc,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: Color(0xFF5F6468),
//                     height: 1.2,
//                   ),
//                 ),
//                 const Spacer(),
//                 Text(
//                   date,
//                   style: const TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w400,
//                     color: Color(0xFF5F6468),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // =========================================================================
// // CLASS BARU: HALAMAN WEBVIEW (DENGAN CUSTOM APPBAR CENTERED)
// // =========================================================================
// class ArticleWebViewPage extends StatefulWidget {
//   final String url;
//   final String title;

//   const ArticleWebViewPage({
//     super.key,
//     required this.url,
//     required this.title,
//   });

//   @override
//   State<ArticleWebViewPage> createState() => _ArticleWebViewPageState();
// }

// class _ArticleWebViewPageState extends State<ArticleWebViewPage> {
//   late final WebViewController _controller;
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onPageStarted: (String url) {
//             setState(() {
//               _isLoading = true;
//             });
//           },
//           onPageFinished: (String url) {
//             setState(() {
//               _isLoading = false;
//             });
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse(widget.url));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,

//       // --- CUSTOM APP BAR ---
//       appBar: AppBar(
//         // 1. Background Warna Merah (991B1C)
//         backgroundColor: const Color(0xFF991B1C),

//         // 2. Agar Judul berada di TENGAH (Seperti gambar Frame 2077)
//         centerTitle: true,

//         // Hilangkan tombol back default
//         automaticallyImplyLeading: false,

//         // 3. Custom Tombol Back (Kiri)
//         leading: IconButton(
//           onPressed: () => Navigator.pop(context),
//           icon: SvgPicture.asset(
//             'assets/icons/ic_arrow-back.svg', // Pastikan nama file benar
//             width: 27, // W = 27
//             height: 27, // H = 27
//             // Mengubah warna icon jadi Putih (FFFFFF)
//             colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
//           ),
//         ),

//         // 4. Teks Judul
//         title: Text(
//           widget.title,
//           style: const TextStyle(
//             color: Colors.white, // Warna FFFFFF
//             fontSize: 20, // Ukuran 20
//             fontWeight: FontWeight.bold, // Ketebalan Bold
//           ),
//         ),

//         elevation: 0, // Flat design (opsional)
//       ),

//       body: Stack(
//         children: [
//           WebViewWidget(controller: _controller),
//           if (_isLoading)
//             const Center(
//               child: CircularProgressIndicator(
//                 color: Color(0xFF991B1C),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Jangan lupa import ini untuk icon back

class NewsSection extends StatelessWidget {
  const NewsSection({super.key});

  // FUNGSI NAVIGASI DINAMIS (Menerima parameter URL)
  void _openWebView(BuildContext context, String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArticleWebViewPage(
          url: url, // URL dinamis sesuai yang diklik
          title: 'Artikel Berita', // Header tetap sama
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 1. UPDATE DATA: Menambahkan URL spesifik untuk setiap berita
    final List<Map<String, String>> newsData = [
      {
        'title': 'Sinergi Terjalin: Penandatanganan Kontrak Ekstension GI 150 kV Pinayungan',
        'desc': 'Dalam upaya memperkuat infrastruktur kelistrikan nasional, telah dilaksanakan penandatanganan kontrak kerjasama pembangunan.',
        'date': 'Posting date: 24 April 2025',
        'image': 'https://erp-multifab.com/storage/artikel/MFG-20250424-1745461716.jpeg',
        // Link Artikel 1
        'url': 'https://app.erp-multifab.com/artikel/sinergi-terjalin-penandatanganan-kontrak-ekstension-gi-150-kv-pinayungan',
      },
      {
        'title': 'Selamat Pagi dari Gardu induk (substation) Blawan Ijen!',
        'desc': 'Selamat Pagi dari Gardu Induk Blawan Ijen! Sinar mentari pagi mulai menyapa, menghadirkan semangat baru dari Gardu Induk Blawan Ijen.',
        'date': 'Posting date: 19 February 2025',
        'image': 'https://erp-multifab.com/storage/artikel/MFG-20250219-1739931591.JPG',
        // Link Artikel 2
        'url': 'https://app.erp-multifab.com/artikel/selamat-pagi-dari-gardu-induk-substation-blawan-ijen',
      },
    ];

    return Column(
      children: [
        // HEADER
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Artikel Berita",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                // Tombol "Lihat semua" mengarah ke halaman utama artikel
                onTap: () => _openWebView(context, 'https://app.erp-multifab.com/artikel'),
                child: const Text(
                  "Lihat semua",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1F63C7),
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFF1F63C7),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // LIST KARTU BERITA
        ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: newsData.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return _buildNewsCard(
              context: context, // Perlu context untuk navigasi
              title: newsData[index]['title']!,
              desc: newsData[index]['desc']!,
              date: newsData[index]['date']!,
              imagePath: newsData[index]['image']!,
              url: newsData[index]['url']!, // Kirim URL spesifik
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
    required BuildContext context, // Tambah parameter context
    required String title,
    required String desc,
    required String date,
    required String imagePath,
    required String url, // Tambah parameter URL
  }) {
    bool isNetworkImage = imagePath.startsWith('http');

    // 2. BUNGKUS DENGAN GESTURE DETECTOR
    return GestureDetector(
      onTap: () => _openWebView(context, url), // Navigasi saat card ditekan
      child: Container(
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
            // GAMBAR
            Container(
              width: 95,
              height: 95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.grey[200],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: isNetworkImage
                    ? Image.network(
                        imagePath,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(strokeWidth: 2)),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: const Icon(Icons.broken_image,
                                color: Colors.grey, size: 30),
                          );
                        },
                      )
                    : Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
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
            // TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
      ),
    );
  }
}

// =========================================================================
// CLASS HALAMAN WEBVIEW (Tidak berubah, tetap Custom AppBar Centered)
// =========================================================================
class ArticleWebViewPage extends StatefulWidget {
  final String url;
  final String title;

  const ArticleWebViewPage({
    super.key,
    required this.url,
    required this.title,
  });

  @override
  State<ArticleWebViewPage> createState() => _ArticleWebViewPageState();
}

class _ArticleWebViewPageState extends State<ArticleWebViewPage> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF991B1C),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            'assets/icons/ic_arrow-back.svg',
            width: 27,
            height: 27,
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn
            ),
          ),
        ),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF991B1C),
              ),
            ),
        ],
      ),
    );
  }
}
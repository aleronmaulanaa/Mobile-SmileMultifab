import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // Data Menu Utama (6 Item)
    final List<Map<String, String>> mainMenuItems = [
      {'title': 'Kalender', 'icon': 'assets/images/home/calendar.webp'},
      {'title': 'PKB', 'icon': 'assets/images/home/book.webp'},
      {'title': 'Struktur Organisasi', 'icon': 'assets/images/home/so.webp'},
      {'title': 'Kehadiran', 'icon': 'assets/images/home/kehadiran.webp'},
      {'title': 'Izin/Cuti', 'icon': 'assets/images/home/permission.png'},
      {'title': 'ERP Multifab', 'icon': 'assets/images/home/erp.png'},
    ];

    return Column(
      children: [
        // ===========================
        // 1. HEADER (Menu & More Apps)
        // ===========================

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text "Menu"
              const Text(
                "Menu",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500, // Medium
                  color: Colors.black, // 000000 100%
                ),
              ),

              // Text "More Apps" (Clickable)
              GestureDetector(
                onTap: () {
                  _showMoreAppsDialog(context);
                },
                child: const Text(
                  "More Apps",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500, // Medium
                    color: Color(0xFF1F63C7), // 1F63C7 100%
                    decoration: TextDecoration.underline, // Garis bawah
                    decorationColor: Color(0xFF1F63C7),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16), // Jarak antara Header Menu dan Grid Icon

        // ===========================
        // 2. GRID MENU UTAMA
        // ===========================

        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: mainMenuItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,

            // 1. KURANGI JARAK ANTAR BARIS
            mainAxisSpacing: 0,

            crossAxisSpacing: 10,

            // 2. NAIKKAN RASIO ASPEK (AGAR KOTAK LEBIH PENDEK)
            childAspectRatio: 1.0,
          ),
          itemBuilder: (context, index) {
            return _buildMenuItem(
              title: mainMenuItems[index]['title']!,
              iconPath: mainMenuItems[index]['icon']!,
            );
          },
        ),
      ],
    );
  }

  // =========================================
  // HELPER: BUILD MENU ITEM (ICON + TEXT)
  // =========================================

  Widget _buildMenuItem({
    required String title,
    required String iconPath,
    int maxLines = 1, // Default 1 baris
    Color backgroundColor = Colors.white,
  }) {
    // LOGIKA PENGECEKAN: Apakah ini URL Online?
    bool isNetworkImage = iconPath.startsWith('http');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // KOTAK ICON
        Container(
          width: 53,
          height: 53,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, 3),
                blurRadius: 4,
              ),
            ],
          ),
          child: Center(
            // PILIH WIDGET BERDASARKAN TIPE LINK
            child: isNetworkImage
                ? Image.network(
                    iconPath, // Ini URL
                    width: 39,
                    height: 39,
                    fit: BoxFit.contain,
                    // Tampilkan loading putar saat gambar sedang didownload
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const SizedBox(
                          width: 15,
                          height: 15,
                          child: CircularProgressIndicator(strokeWidth: 2));
                    },
                    // Tampilkan icon rusak jika URL error/mati
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.broken_image, color: Colors.grey);
                    },
                  )
                : Image.asset(
                    iconPath, // Ini Asset Lokal
                    width: 39,
                    height: 39,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.apps,
                          color: Colors.grey, size: 24);
                    },
                  ),
          ),
        ),

        const SizedBox(height: 11),

        // TEXT MENU
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: maxLines,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                height: 1.1,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // =========================================
  // POP-UP DIALOG (MORE APPS)
  // =========================================

  void _showMoreAppsDialog(BuildContext context) {
    final List<Map<String, String>> moreAppsItems = [
      {
        'title': 'Reimburse Medical',
        'icon': 'assets/images/pop-up/request.png'
      },
      {'title': 'E-Payslip', 'icon': 'assets/images/pop-up/payslip.png'},
      {
        'title': 'Perjalanan Dinas',
        'icon': 'assets/images/pop-up/mobildinas.png'
      },
      {
        'title': 'Kilometer Mobil\n(Km)',
        'icon': 'assets/images/pop-up/kilometer.png'
      },
      {
        'title': 'Dokumen Prosedur',
        'icon': 'assets/images/pop-up/procedure.png'
      },
      {
        'title': 'Pengaturan',
        'icon': 'https://app.erp-multifab.com/assets/setting.webp'
      },
    ];

    showDialog(
      context: context,
      barrierDismissible: true,
      // barrierColor: Colors.black.withOpacity(0.35),
      barrierColor: const Color(0x59000000),
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: 407,
            height: 259,
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // ICON CLOSE
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    'assets/icons/ic_close.svg',
                    width: 24,
                    height: 24,
                  ),
                ),

                // Jarak dihapus total
                const SizedBox(height: 4),

                // GRID MENU TAMBAHAN
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.zero, // Padding 0 agar mepet icon close

                    // SOLUSI 1: Matikan Scroll agar statis (Fit)
                    physics: const NeverScrollableScrollPhysics(),

                    itemCount: moreAppsItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 0,

                      // SOLUSI 2: Ubah rasio jadi 1.1
                      childAspectRatio: 1.1,
                    ),
                    itemBuilder: (context, index) {
                      return _buildMenuItem(
                        title: moreAppsItems[index]['title']!,
                        iconPath: moreAppsItems[index]['icon']!,
                        maxLines: 2,
                        backgroundColor: const Color(0xFFF3F4F6),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

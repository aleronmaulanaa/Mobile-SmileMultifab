import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../features/attendance/pages/attendance_page.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Menu",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  _showMoreAppsDialog(context);
                },
                child: const Text(
                  "More Apps",
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

        /// ============================
        /// MENU UTAMA (DITAMBAH ACTION)
        /// ============================
        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: mainMenuItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 0,
            crossAxisSpacing: 10,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (context, index) {
            final item = mainMenuItems[index];

            return GestureDetector(
              onTap: () {
                if (item['title'] == 'Kehadiran') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AttendancePage(),
                    ),
                  );
                }
              },
              child: _buildMenuItem(
                title: item['title']!,
                iconPath: item['icon']!,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required String title,
    required String iconPath,
    int maxLines = 1,
    Color backgroundColor = Colors.white,
  }) {
    bool isNetworkImage = iconPath.startsWith('http');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
            child: isNetworkImage
                ? Image.network(
                    iconPath,
                    width: 39,
                    height: 39,
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.broken_image, color: Colors.grey);
                    },
                  )
                : Image.asset(
                    iconPath,
                    width: 39,
                    height: 39,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.apps,
                        color: Colors.grey,
                        size: 24,
                      );
                    },
                  ),
          ),
        ),
        const SizedBox(height: 11),
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

  void _showMoreAppsDialog(BuildContext context) {
    final List<Map<String, String>> moreAppsItems = [
      {'title': 'Reimburse Medical', 'icon': 'assets/images/pop-up/request.png'},
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
      barrierColor: const Color(0x59000000),
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: 407,
            height: 259,
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 16,
              right: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    'assets/icons/ic_close.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
                const SizedBox(height: 4),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: moreAppsItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 0,
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

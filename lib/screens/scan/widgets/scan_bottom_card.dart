import 'package:flutter/material.dart';

class ScanBottomCard extends StatelessWidget {
  final bool isDetected;
  final String scannedUrl;
  final Function(String) onOpenUrl;

  const ScanBottomCard({
    super.key,
    required this.isDetected,
    required this.scannedUrl,
    required this.onOpenUrl,
  });

@override
Widget build(BuildContext context) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: FractionallySizedBox(
          widthFactor: 1.0, // 🔥 AMAN 100%
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 396, // 🔥 VISUAL TETAP 396
              minHeight: 211,
              maxHeight: 211,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: isDetected ? _detected() : _idle(context),
          ),
        ),
      ),
    ),
  );
}



Widget _idle(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Image.asset(
        'assets/images/scan/img_scan.png',
        width: 48,
        height: 48,
      ),
      const Text(
        'Please scan the QR code',
        textAlign: TextAlign.center,
        maxLines: 2,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF000000),
        ),
      ),
      SizedBox(
        height: 44,
        child: ElevatedButton.icon(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF4646),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          icon: Container(
            width: 18,
            height: 18,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.close,
              size: 12,
              color: Color(0xFFFF4646),
            ),
          ),
          label: const Text(
            'Cancel',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ],
  );
}


Widget _detected() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center, // 🔥 CENTER VISUAL
    children: [
      // ===== ICON =====
      Image.asset(
        'assets/images/scan/check_scan.png',
        width: 56, // sedikit dikecilkan biar seimbang
        height: 56,
      ),
      const SizedBox(width: 16),

      // ===== CONTENT =====
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center, // 🔥 TENGAH VERTIKAL
          children: [
            const Text(
              'Connected',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 2),
            const Text(
              'Arsip ditemukan',
              style: TextStyle(
                fontSize: 15, // 🔥 lebih ringan dari title
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '👉 Cek arsip di sini',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF595959),
              ),
            ),
            const SizedBox(height: 6),
            GestureDetector(
              onTap: () => onOpenUrl(scannedUrl),
              child: Text(
                scannedUrl,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
}
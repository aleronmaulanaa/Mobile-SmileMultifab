import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ScanBottomCard extends StatelessWidget {
  final bool isDetected;
  final String scannedUrl;

  const ScanBottomCard({
    super.key,
    required this.isDetected,
    required this.scannedUrl,
  });

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 396,
      height: 211,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: isDetected ? _detected() : _idle(context),
    );
  }

  Widget _idle(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/scan/img_scan.png',
          width: 48,
          height: 48,
        ),
        const SizedBox(height: 16),
        const Text(
          'Please scan the QR code',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 124,
          height: 44,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF4646),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            onPressed: () => Navigator.pop(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
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
                const SizedBox(width: 8),
                const Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _detected() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/scan/check_scan.png',
          width: 63,
          height: 63,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Connected',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              const Text(
                'Arsip ditemukan',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              const Text(
                '👉 Cek arsip disini',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF595959),
                ),
              ),
              const SizedBox(height: 6),
              GestureDetector(
                onTap: () => _openUrl(scannedUrl),
                child: Text(
                  scannedUrl,
                  style: const TextStyle(
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

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/scan_overlay.dart';
import 'widgets/scan_mask_overlay.dart'; // 🔥 MASK TRANSPARAN
import 'widgets/scan_bottom_card.dart';
import 'widgets/scan_success_popup.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final MobileScannerController scannerController =
      MobileScannerController(autoStart: false);

  bool isDetected = false;
  bool showPopup = false;

  String scannedUrl = '';
  String? lastScannedValue; // 🔒 barcode terakhir

  @override
  void initState() {
    super.initState();
    _requestCameraPermission();
  }

  // ===== CAMERA PERMISSION =====
  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      scannerController.start();
    }
  }

  // ===== SCAN DETECT (DYNAMIC & SMART) =====
  void _onDetect(BarcodeCapture capture) {
    final String? value = capture.barcodes.first.rawValue;
    if (value == null) return;

    // sementara hanya URL
    if (!value.startsWith('http')) return;

    // 🔒 jika barcode sama, abaikan
    if (value == lastScannedValue) return;

    setState(() {
      lastScannedValue = value;
      scannedUrl = value;
      isDetected = true;
      showPopup = true;
    });

    // popup auto close
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() => showPopup = false);
      }
    });
  }

  // ===== OPEN URL =====
  Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      debugPrint('Could not launch $url');
    }
  }

  // ===== OPTIONAL: RESET SCAN =====
  void resetScan() {
    setState(() {
      isDetected = false;
      scannedUrl = '';
      lastScannedValue = null;
    });
  }

  @override
  void dispose() {
    scannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4A4A4A),
      body: Stack(
        children: [
          /// ===== CAMERA (LIVE) =====
          MobileScanner(
            controller: scannerController,
            onDetect: _onDetect,
          ),

          /// ===== MASK TRANSPARAN (FOKUS KE TENGAH) =====
          const ScanMaskOverlay(),

          /// ===== SCAN OVERLAY (CORNER + LINE) =====
          const Center(child: ScanOverlay()),

          /// ===== BOTTOM CARD =====
          Align(
            alignment: Alignment.bottomCenter,
            child: ScanBottomCard(
              isDetected: isDetected,
              scannedUrl: scannedUrl,
              onOpenUrl: openUrl,
            ),
          ),

          /// ===== POPUP SUCCESS =====
          if (showPopup) const ScanSuccessPopup(),
        ],
      ),
    );
  }
}

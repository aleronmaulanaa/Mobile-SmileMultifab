import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

import 'widgets/scan_overlay.dart';
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
  bool isProcessing = false;

  String scannedUrl = '';

  @override
  void initState() {
    super.initState();
    _requestCameraPermission();
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      scannerController.start();
    }
  }

  void _onDetect(BarcodeCapture capture) {
    if (isProcessing) return;

    final String? value = capture.barcodes.first.rawValue;
    if (value == null) return;

    if (!value.startsWith('http')) return;

    isProcessing = true;
    scannerController.stop();

    setState(() {
      scannedUrl = value;
      isDetected = true;
      showPopup = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() => showPopup = false);
      }
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
          /// ===== CAMERA =====
          MobileScanner(
            controller: scannerController,
            onDetect: _onDetect,
          ),

          /// ===== SCAN BOX =====
          const Center(child: ScanOverlay()),

          /// ===== BOTTOM CARD =====
          Align(
            alignment: Alignment.bottomCenter,
            child: ScanBottomCard(
              isDetected: isDetected,
              scannedUrl: scannedUrl,
            ),
          ),

          /// ===== POPUP SUCCESS =====
          if (showPopup) const ScanSuccessPopup(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ScanMaskOverlay extends StatelessWidget {
  const ScanMaskOverlay({super.key});

  static const double scanBoxSize = 220;
  static const double cornerRadius = 20;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: MediaQuery.of(context).size,
      painter: _ScanMaskPainter(),
    );
  }
}

class _ScanMaskPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.45)
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);

    final scanRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: center,
        width: ScanMaskOverlay.scanBoxSize,
        height: ScanMaskOverlay.scanBoxSize,
      ),
      const Radius.circular(ScanMaskOverlay.cornerRadius),
    );

    final path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRRect(scanRect)
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

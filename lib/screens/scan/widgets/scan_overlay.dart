import 'package:flutter/material.dart';

class ScanOverlay extends StatefulWidget {
  const ScanOverlay({super.key});

  static const double boxSize = 220;

  @override
  State<ScanOverlay> createState() => _ScanOverlayState();
}

class _ScanOverlayState extends State<ScanOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _lineAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _lineAnimation = Tween<double>(
      begin: 12,
      end: ScanOverlay.boxSize - 12,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScanOverlay.boxSize,
      height: ScanOverlay.boxSize,
      child: Stack(
        children: [
          // ==== ROUNDED CORNERS ====
          _corner(top: 0, left: 0),
          _corner(top: 0, right: 0),
          _corner(bottom: 0, left: 0),
          _corner(bottom: 0, right: 0),

          // ==== GREEN SCAN LINE ====
          AnimatedBuilder(
            animation: _lineAnimation,
            builder: (_, __) {
              return Positioned(
                top: _lineAnimation.value,
                left: 16,
                right: 16,
                child: Container(
                  height: 2,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _corner({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: CustomPaint(
        size: const Size(28, 28),
        painter: _RoundedCornerPainter(
          isTop: top != null,
          isBottom: bottom != null,
          isLeft: left != null,
          isRight: right != null,
        ),
      ),
    );
  }
}

class _RoundedCornerPainter extends CustomPainter {
  final bool isTop;
  final bool isBottom;
  final bool isLeft;
  final bool isRight;

  static const double stroke = 4;
  static const double radius = 10;

  _RoundedCornerPainter({
    required this.isTop,
    required this.isBottom,
    required this.isLeft,
    required this.isRight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = stroke
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();

    // TOP LEFT
    if (isTop && isLeft) {
      path.moveTo(radius, stroke / 2);
      path.lineTo(size.width, stroke / 2);
      path.moveTo(stroke / 2, radius);
      path.quadraticBezierTo(
        stroke / 2,
        stroke / 2,
        radius,
        stroke / 2,
      );
    }

    // TOP RIGHT
    if (isTop && isRight) {
      path.moveTo(size.width - radius, stroke / 2);
      path.lineTo(0, stroke / 2);
      path.moveTo(size.width - stroke / 2, radius);
      path.quadraticBezierTo(
        size.width - stroke / 2,
        stroke / 2,
        size.width - radius,
        stroke / 2,
      );
    }

    // BOTTOM LEFT
    if (isBottom && isLeft) {
      path.moveTo(radius, size.height - stroke / 2);
      path.lineTo(size.width, size.height - stroke / 2);
      path.moveTo(stroke / 2, size.height - radius);
      path.quadraticBezierTo(
        stroke / 2,
        size.height - stroke / 2,
        radius,
        size.height - stroke / 2,
      );
    }

    // BOTTOM RIGHT
    if (isBottom && isRight) {
      path.moveTo(size.width - radius, size.height - stroke / 2);
      path.lineTo(0, size.height - stroke / 2);
      path.moveTo(size.width - stroke / 2, size.height - radius);
      path.quadraticBezierTo(
        size.width - stroke / 2,
        size.height - stroke / 2,
        size.width - radius,
        size.height - stroke / 2,
      );
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

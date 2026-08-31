import 'package:flutter/material.dart';

class DashedVerticalLine extends StatelessWidget {
  const DashedVerticalLine({
    super.key,
    required this.height,
    required this.color,
    this.dashHeight = 4,
    this.dashGap = 3,
    this.strokeWidth = 1,
  });

  final double height;
  final Color color;
  final double dashHeight;
  final double dashGap;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: strokeWidth,
      child: CustomPaint(
        painter: _DashedLinePainter(
          color: color,
          dashHeight: dashHeight,
          dashGap: dashGap,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  _DashedLinePainter({
    required this.color,
    required this.dashHeight,
    required this.dashGap,
    required this.strokeWidth,
  });

  final Color color;
  final double dashHeight;
  final double dashGap;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth;

    double y = 0;
    while (y < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, y),
        Offset(size.width / 2, (y + dashHeight).clamp(0, size.height)),
        paint,
      );
      y += dashHeight + dashGap;
    }
  }

  @override
  bool shouldRepaint(covariant _DashedLinePainter oldDelegate) =>
      oldDelegate.color != color;
}
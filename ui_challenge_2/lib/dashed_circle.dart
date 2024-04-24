import 'package:flutter/material.dart';
import 'dart:math';

const int defaultDashes = 20;
const Color defaultColor = Color(0x00000000);
const double defaultGapSize = 3.0;
const double defaultStrokeWidth = 2.5;

class DashedCircle extends StatelessWidget {
  final int dashes;
  final Color color;
  final double gapSize;
  final double strokeWidth;
  final Widget child;

  const DashedCircle({
    super.key,
    required this.child,
    this.dashes = defaultDashes,
    this.color = defaultColor,
    this.gapSize = defaultGapSize,
    this.strokeWidth = defaultStrokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedCirclePainter(
        dashes: dashes,
        color: color,
        gapSize: gapSize,
        strokeWidth: strokeWidth,
      ),
      child: child,
    );
  }
}

class DashedCirclePainter extends CustomPainter {
  final int dashes;
  final Color color;
  final double gapSize;
  final double strokeWidth;

  DashedCirclePainter({
    this.dashes = defaultDashes,
    this.color = defaultColor,
    this.gapSize = defaultGapSize,
    this.strokeWidth = defaultStrokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double gap = pi / 180 * gapSize;
    final double singleAngle = (pi * 2) / dashes;

    for (int i = 0; i < dashes; i++) {
      final Paint paint = Paint()
        ..color = color
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke;

      canvas.drawArc(Offset.zero & size, gap + singleAngle * i,
          singleAngle - gap * 2, false, paint);
    }
  }

  @override
  bool shouldRepaint(DashedCirclePainter oldDelegate) {
    return dashes != oldDelegate.dashes || color != oldDelegate.color;
  }
}

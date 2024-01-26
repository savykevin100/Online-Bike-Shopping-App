import 'package:flutter/material.dart';
import 'package:statistique_progress/core/colors.dart';

class BottomItemPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var roundnessFactor = 10.0;

    final gradient = LinearGradient(
      colors: ColorsResource.searchGradientColor,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    final paint = Paint()
      ..shader =
          gradient.createShader(Rect.fromPoints(Offset(0, 0), Offset(60, 60)))
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    final double height = 60;
    final double width = 60;

    var path = Path()
      ..moveTo(0, 20)
      ..lineTo(0, height - roundnessFactor)
      ..quadraticBezierTo(0, height, roundnessFactor, height)

      ///
      ..lineTo(width - roundnessFactor, height - roundnessFactor)
      ..quadraticBezierTo(
          width, height - roundnessFactor, width, height - roundnessFactor * 2)

      ///
      ..lineTo(60, roundnessFactor)
      ..quadraticBezierTo(
          width, 0, width - roundnessFactor, roundnessFactor - 10)
      //
      ..lineTo(roundnessFactor * 0.6, height * 0.2 - roundnessFactor * 0.2)
      ..quadraticBezierTo(0, height * 0.2, 0, width * 0.2 + roundnessFactor);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

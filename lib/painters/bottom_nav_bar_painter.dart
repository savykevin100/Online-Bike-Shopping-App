import 'package:flutter/material.dart';

class BottomNavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = Colors.red;
    final double height = 70;
    var path = Path()
      ..moveTo(0, 40)
      ..lineTo(0, 20)
      ..lineTo(size.width, height)
      ..lineTo(size.width, height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

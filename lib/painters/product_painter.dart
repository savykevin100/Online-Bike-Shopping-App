import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var roundnessFactor = 20.0;

    final gradient = LinearGradient(
      colors: [
        Color(0xff363E51).withOpacity(.6),
        Color(0xff191E26).withOpacity(.6),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    final gradientBorder = LinearGradient(colors: [
      Color(0xff363E51).withOpacity(.6),
      Color(0xff191E26).withOpacity(.6),
    ]);
    final paint = Paint()
      ..shader = gradient.createShader(
          Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height)))
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    Paint paintBorder = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..shader = gradientBorder.createShader(
          Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height)));

    var path = Path()
      ..moveTo(0, size.height * .25)
      ..lineTo(0, size.height - roundnessFactor)
      ..quadraticBezierTo(0, size.height, roundnessFactor, size.height)

      ///
      ..lineTo(size.width - roundnessFactor, size.height - roundnessFactor)
      ..quadraticBezierTo(size.width, size.height - roundnessFactor, size.width,
          size.height - roundnessFactor * 2)

      ///
      ..lineTo(size.width, roundnessFactor * 2.5)
      ..quadraticBezierTo(size.width, roundnessFactor + 5,
          size.width - roundnessFactor * 1.5, roundnessFactor * 1.5)
      //
      ..lineTo(roundnessFactor * 0.6, size.height * 0.2 - roundnessFactor * 0.2)
      ..quadraticBezierTo(
          0, size.height * 0.2, 0, size.height * 0.2 + roundnessFactor);

    canvas.drawPath(path, paint);
    canvas.drawPath(path, paintBorder);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

import 'package:flutter/material.dart';

class ContainerShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var roundnessFactor = 30.0;

    final gradient = LinearGradient(
      colors: [
        Color(0xff363E51).withOpacity(.6),
        Color(0xff191E26).withOpacity(.6),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    final gradientBorder = LinearGradient(colors: [
      Color(0xffFFFFFF).withOpacity(.2),
      Color(0xff000000).withOpacity(.2),
      Color(0xff000000).withOpacity(.2),
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
      ..moveTo(0, size.height * .2)
      ..lineTo(0, size.height - roundnessFactor)
      ..quadraticBezierTo(0, size.height, roundnessFactor, size.height)

      ///
      ..lineTo(size.width - roundnessFactor, size.height - roundnessFactor)
      ..quadraticBezierTo(size.width, size.height - roundnessFactor, size.width,
          size.height - roundnessFactor * 2)

      ///
      ..lineTo(size.width, roundnessFactor - 5)
      ..quadraticBezierTo(size.width, 0, size.width - roundnessFactor, 0)

      ///
      ..lineTo(roundnessFactor, 0)
      ..quadraticBezierTo(0, size.height * .01, 0, size.height * .2);

    canvas.drawPath(path, paint);
    canvas.drawPath(path, paintBorder);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

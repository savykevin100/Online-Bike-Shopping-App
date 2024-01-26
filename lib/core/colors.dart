import 'package:flutter/material.dart';

class ColorsResource {
  ColorsResource._();

  static const black50 = Color(0xff242C3B);
  static const black30 = Color(0xff353F54);
  static const black70 = Color(0xff222834);
  static const secondaryColor = Color(0xff37B6E9);
  static const primaryColor = Color(0xff4B4CED);
  static const reductionColor = Color(0x99FFFFFF);
  static const descriptionCardColor = Color(0xff323B4F);

  static List<Color> searchGradientColor = const [
    Color(0xff34C8E8),
    Color(0xff4E4AF2)
  ];

  static List<Color> cardMainBicycleColor = const [
    Color(0xff353F54),
    Color(0xff222834)
  ];

  static List<Color> bottomSheetBackgroundColor = const [
    Color(0xff353F54),
    Color(0xff222834)
  ];
  static Shader textLinearGradientColor = LinearGradient(
    colors: <Color>[Color(0xff3CA4EB), Color(0xff4286EE)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  static Shader textColorDescription = LinearGradient(
    colors: <Color>[Colors.white.withOpacity(.6), Colors.white.withOpacity(.6)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
}

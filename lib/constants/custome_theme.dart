import 'package:flutter/material.dart';

import '../gen/colors.gen.dart';

final class CustomTheme {
  CustomTheme._();
  static const MaterialColor kToDark = MaterialColor(
    0xFF0D1424, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xFF0D1424), //10%
      100: Color(0xFF0D1424), //20%
      200: Color(0xFF0D1424), //30%
      300: Color(0xFF0D1424), //40%
      400: Color(0xFF0D1424), //50%
      500: Color(0xFF0D1424), //60%
      600: Color(0xFF0D1424), //70%
      700: Color(0xFF0D1424), //80%
      800: Color(0xFF0D1424), //80%
      900: Color(0xFF0D1424), //80%
    },
  );
  static ThemeData get mainTheme {
    return ThemeData(
      primaryColor: AppColors.allPrimaryColor,
      primarySwatch: CustomTheme.kToDark,
      scaffoldBackgroundColor: AppColors.scaffoldColor,
    );
  }
}

//palette.dart
import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor purplePallete = MaterialColor(
    0xff6750A4, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      1: Color(0xff21005d),
      2: Color(0xffeaddff),
      50: Color(0xff7662ad), //10%
      100: Color(0xff8573b6), //20%
      200: Color(0xff9585bf), //30%
      300: Color(0xffa496c8), //40%
      400: Color(0xffb3a8d2), //50%
      500: Color(0xffc2b9db), //60%
      600: Color(0xffd1cbe4), //70%
      700: Color(0xffe1dced), //80%
      800: Color(0xfff0eef6), //90%
      900: Color(0xffffffff), //100%
    },
  );
}

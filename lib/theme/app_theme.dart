import 'package:flutter/material.dart';
import 'package:tunefun_front/theme/theme.dart';

class AppTheme {
  static ThemeData theme = ThemeData(fontFamily: "Pretendart").copyWith(
    scaffoldBackgroundColor: Pallete.bgMainColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Pallete.bgMainColor,
      elevation: 0,
    ),
  );
}

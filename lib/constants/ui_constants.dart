import 'package:flutter/material.dart';
import 'package:tunefun_front/constants/gradient_text.dart';
import 'package:tunefun_front/theme/pallete.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: const GradientText(
        text: "TuneFun",
        gradient: LinearGradient(
          colors: [
            Pallete.pinkColor,
            Pallete.redColor,
          ],
        ),
        style: TextStyle(
          color: Pallete.pointColor,
          height: 80,
          fontWeight: FontWeight.bold,
          fontSize: 35,
        ),
      ),
      centerTitle: true,
    );
  }

  static AppBar signUpAppBar() {
    return AppBar(
      title: const GradientText(
        text: "회원가입",
        gradient: LinearGradient(
          colors: [
            Pallete.pinkColor,
            Pallete.redColor,
          ],
        ),
        style: TextStyle(
          color: Pallete.pointColor,
          height: 80,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      centerTitle: true,
    );
  }
}

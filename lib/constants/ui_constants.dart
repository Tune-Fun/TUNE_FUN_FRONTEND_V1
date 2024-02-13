import 'package:flutter/material.dart';
import 'package:tunefun_front/theme/pallete.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: const Text(
        'TuneFun',
        style: TextStyle(
          color: Pallete.greenColor,
          height: 80,
          fontWeight: FontWeight.bold,
          fontSize: 35,
        ),
      ),
      centerTitle: true,
    );
  }
}

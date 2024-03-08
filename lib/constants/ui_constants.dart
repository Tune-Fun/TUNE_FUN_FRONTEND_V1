import 'package:flutter/material.dart';
import 'package:tunefun_front/constants/gradient_text.dart';
import 'package:tunefun_front/features/article/widgets/article_list.dart';
import 'package:tunefun_front/features/auth/views/email_verify_view.dart';
import 'package:tunefun_front/features/profile/views/profile_view.dart';
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

  static List<Widget> bottomTapBarPages = [
    const ArticleList(),
    // const Text(
    //   'Add',
    //   style: TextStyle(
    //     color: Pallete.textMainColor,
    //   ),
    // ),
    const EmailVerifyScreen(),
    const Text(
      'People',
      style: TextStyle(
        color: Pallete.textMainColor,
      ),
    ),
    const ProfileScreen(),
    // const Text(
    //   'Profile',
    //   style: TextStyle(
    //     color: Pallete.textMainColor,
    //   ),
    // )
  ];
}

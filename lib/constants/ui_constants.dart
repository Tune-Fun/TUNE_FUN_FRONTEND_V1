import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tunefun_front/constants/gradient_text.dart';
import 'package:tunefun_front/constants/image_constants.dart';
import 'package:tunefun_front/theme/pallete.dart';

class UIConstants {
  static AppBar basicAppBar() {
    return AppBar(
      title: const GradientText(
        text: "TuneFun",
        gradient: LinearGradient(
          colors: [
            Pallete.pinkColor,
            Pallete.negativeColor,
          ],
        ),
        style: TextStyle(
          color: Pallete.pointColor,
          height: 80,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      centerTitle: true,
    );
  }

  static AppBar homeAppBar() {
    return AppBar(
      title: const GradientText(
        text: "TuneFun",
        gradient: LinearGradient(
          colors: [
            Pallete.pinkColor,
            Pallete.negativeColor,
          ],
        ),
        style: TextStyle(
          color: Pallete.pointColor,
          height: 80,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: () {
                // 알림 화면 이동
              },
              icon: SvgPicture.asset(
                ImageConstants.alarmIcon,
                width: 16,
                height: 20,
              )),
        )
      ],
      centerTitle: true,
    );
  }

  static AppBar signUpAppBar() {
    return AppBar(
      title: const Text(
        "회원가입",
        style: TextStyle(
          color: Pallete.textMainColor,
          fontWeight: FontWeight.w700,
          fontSize: 22,
        ),
      ),
      centerTitle: true,
    );
  }

  void customButtomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.red,
          height: 200,
        );
      },
    );
  }
}

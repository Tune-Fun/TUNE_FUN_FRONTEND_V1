import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/constants/image_constants.dart';
import 'package:tunefun_front/core/enums/social_login_enum.dart';

import 'package:tunefun_front/theme/pallete.dart';

var logger = Logger();

class SocialSignupButton extends StatelessWidget {
  final String text;
  final SocialLoginType type;

  const SocialSignupButton({
    Key? key,
    required this.text,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String buttonText;
    switch (type) {
      case SocialLoginType.facebook:
        buttonText = '$text으로 계속하기';
        break;
      case SocialLoginType.google:
        buttonText = '$text로 계속하기';
        break;
      case SocialLoginType.apple:
        buttonText = '$text로 계속하기';
        break;
      default:
        buttonText = text;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 23,
      ),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 13),
          decoration: BoxDecoration(
            border: Border.all(
              color: Pallete.borderColor, // 테두리 색상 설정
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                ImageConstants.profileOutlinedIcon,
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 14),
              Text(buttonText),
            ],
          ),
        ),
      ),
    );
  }
}

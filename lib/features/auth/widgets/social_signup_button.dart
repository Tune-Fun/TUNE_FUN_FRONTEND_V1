import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/constants/image_constants.dart';
import 'package:tunefun_front/core/enums/enums.dart';

import 'package:tunefun_front/theme/pallete.dart';

var logger = Logger();

class SocialSignupButton extends StatelessWidget {
  final String text;
  final OAuthType type;

  const SocialSignupButton({
    Key? key,
    required this.text,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String buttonText;
    String iconPath;
    switch (type) {
      case OAuthType.instagram:
        buttonText = '$text으로 계속하기';
        iconPath = ImageConstants.instagramIcon;
        break;
      case OAuthType.google:
        buttonText = '$text로 계속하기';
        iconPath = ImageConstants.googleIcon;
        break;
      case OAuthType.apple:
        buttonText = '$text로 계속하기';
        iconPath = ImageConstants.appleIcon;
        break;
      default:
        buttonText = text;
        iconPath = ImageConstants.backIcon;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 23,
      ),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: Pallete.borderColor, // 테두리 색상 설정
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconPath == ImageConstants.instagramIcon
                  ? Image.asset(
                      iconPath,
                      height: 20,
                      width: 20,
                    )
                  : SvgPicture.asset(
                      iconPath,
                      height: 20,
                      width: 20,
                    ),
              const SizedBox(width: 14),
              Text(
                buttonText,
                style: const TextStyle(
                    color: Pallete.textSubColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

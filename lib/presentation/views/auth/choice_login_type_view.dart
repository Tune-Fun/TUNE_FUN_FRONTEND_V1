import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tunefun_front/constants/image_constants.dart';

class ChoiceLoginTypeScreen extends StatelessWidget {
  const ChoiceLoginTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "로그인",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: const Color.fromRGBO(234, 234, 234, 1))),
              child: const Text(
                "아이디로 로그인하기",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color.fromRGBO(17, 17, 17, 1)),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: const Color.fromRGBO(234, 234, 234, 1))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: const Color.fromRGBO(116, 119, 117, 1),
                    radius: 14,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 13,
                      child: SvgPicture.asset(
                          height: 14, width: 14, ImageConstants.googleIcon),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Google로 로그인하기",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Color.fromRGBO(17, 17, 17, 1)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: const Color.fromRGBO(234, 234, 234, 1))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 13,
                    child: SvgPicture.asset(
                        height: 19, width: 15, ImageConstants.appleIcon),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Apple로 로그인하기",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Color.fromRGBO(17, 17, 17, 1)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: const Color.fromRGBO(234, 234, 234, 1))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 13,
                    child: SvgPicture.asset(
                        height: 24, width: 24, ImageConstants.youtubeIcon),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Instagram으로 로그인하기",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Color.fromRGBO(17, 17, 17, 1)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: const Color.fromRGBO(234, 234, 234, 1))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 13,
                    child: SvgPicture.asset(
                        height: 14, width: 14, ImageConstants.twitterIcon),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Spotify로 로그인하기",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Color.fromRGBO(17, 17, 17, 1)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

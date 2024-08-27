import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tunefun_front/constants/image_constants.dart';
import 'package:tunefun_front/presentation/views/auth/login_view.dart';

class ChoiceLoginTypeScreen extends StatelessWidget {
  const ChoiceLoginTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginOptions = [
      LoginOption(
        label: "아이디로 로그인하기",
        icon: null,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        ),
      ),
      LoginOption(
        label: "Google로 로그인하기",
        icon: ImageConstants.googleIcon,
        iconBackgroundColor: const Color.fromRGBO(116, 119, 117, 1),
      ),
      LoginOption(
        label: "Apple로 로그인하기",
        icon: ImageConstants.appleIcon,
      ),
      LoginOption(
        label: "Instagram으로 로그인하기",
        icon: ImageConstants.youtubeIcon,
      ),
      LoginOption(
        label: "Spotify로 로그인하기",
        icon: ImageConstants.twitterIcon,
      ),
    ];

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
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: loginOptions
              .map((option) => LoginOptionWidget(option: option))
              .toList(),
        ),
      ),
    );
  }
}

class LoginOption {
  final String label;
  final String? icon;
  final Color? iconBackgroundColor;
  final VoidCallback? onTap;

  LoginOption({
    required this.label,
    this.icon,
    this.iconBackgroundColor = Colors.white,
    this.onTap,
  });
}

class LoginOptionWidget extends StatelessWidget {
  final LoginOption option;

  const LoginOptionWidget({Key? key, required this.option}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: option.onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color.fromRGBO(234, 234, 234, 1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (option.icon != null) ...[
              CircleAvatar(
                backgroundColor: option.iconBackgroundColor,
                radius: 14,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 13,
                  child: SvgPicture.asset(
                    option.icon!,
                    height: 14,
                    width: 14,
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
            Text(
              option.label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Color.fromRGBO(17, 17, 17, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

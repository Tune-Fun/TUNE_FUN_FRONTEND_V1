import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/core/enums/enums.dart';
import 'package:tunefun_front/features/auth/widgets/email_signup_button.dart';
import 'package:tunefun_front/features/auth/widgets/social_signup_button.dart';
import 'package:tunefun_front/theme/theme.dart';

class SignUpMainScreen extends ConsumerStatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const SignUpMainScreen());
  const SignUpMainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpMainScreen> {
  final appbar = UIConstants.appBar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: const Column(
        children: [
          SizedBox(
            height: 12,
          ),
          Text(
            '회원가입',
            style: TextStyle(
              color: Pallete.textMainColor,
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
          SizedBox(
            height: 70,
          ),
          EmailSignupButton(text: '가입하기'),
          SocialSignupButton(text: 'Google', type: OAuthType.google),
          SocialSignupButton(text: 'Apple', type: OAuthType.apple),
          SocialSignupButton(text: 'Facebook', type: OAuthType.facebook),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/features/auth/views/signup_email_input_view.dart';
import 'package:tunefun_front/theme/pallete.dart';

var logger = Logger();

class EmailSignupButton extends StatelessWidget {
  final String text;

  const EmailSignupButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 23,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, SignupEmailInputScreen.route());
        },
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
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}

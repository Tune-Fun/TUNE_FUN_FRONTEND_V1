import 'package:flutter/material.dart';
import 'package:tunefun_front/theme/theme.dart';

class LoginButton extends StatelessWidget {
  final bool buttonState;
  final VoidCallback onTap;

  const LoginButton({
    super.key,
    required this.buttonState,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          gradient: buttonState
              ? const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(251, 92, 102, 1),
                    Color.fromRGBO(250, 35, 48, 1)
                  ],
                )
              : null,
          color: !buttonState
              ? const Color.fromRGBO(209, 213, 219, 1)
              : Pallete.greenColor,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: const Color.fromRGBO(209, 213, 219, 1)),
        ),
        child: const Center(
          child: Text(
            "로그인",
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 22,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tunefun_front/theme/theme.dart';

class BasicSquareButton extends StatelessWidget {
  final bool buttonState;
  final VoidCallback onTap;
  final String buttonText;

  const BasicSquareButton({
    super.key,
    required this.buttonState,
    required this.onTap,
    required this.buttonText,
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
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color.fromRGBO(209, 213, 219, 1)),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

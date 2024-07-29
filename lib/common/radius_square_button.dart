import 'package:flutter/material.dart';
import 'package:tunefun_front/theme/theme.dart';

class RadiusSquareButton extends StatelessWidget {
  final bool buttonState;
  final VoidCallback onTap;
  final String buttonText;

  const RadiusSquareButton({
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
              : Colors.white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: const Color.fromRGBO(209, 213, 219, 1)),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                color: buttonState
                    ? const Color.fromRGBO(255, 255, 255, 1)
                    : const Color.fromRGBO(102, 102, 102, 1),
                fontSize: 22,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tunefun_front/theme/theme.dart';

class GreenSquareButton extends StatelessWidget {
  final bool buttonState;
  final VoidCallback onTap;
  final String buttonText;

  const GreenSquareButton({
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
          color: !buttonState ? Pallete.bgMainColor : Pallete.greenColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Pallete.greenColor),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: !buttonState ? Pallete.greenColor : Pallete.bgMainColor,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

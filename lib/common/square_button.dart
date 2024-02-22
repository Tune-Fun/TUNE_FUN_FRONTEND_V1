import 'package:flutter/material.dart';
import 'package:tunefun_front/theme/theme.dart';

class SquareButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final Color backgroundColor;
  final Color textColor;

  const SquareButton({
    super.key,
    required this.onTap,
    required this.label,
    this.backgroundColor = Pallete.greenColor,
    this.textColor = Pallete.bgMainColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
          ),
        ),
        backgroundColor: backgroundColor,
        labelPadding: const EdgeInsets.symmetric(
          horizontal: 120,
          vertical: 5,
        ),
      ),
    );
  }
}

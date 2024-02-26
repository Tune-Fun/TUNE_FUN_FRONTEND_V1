import 'package:flutter/material.dart';
import 'package:tunefun_front/theme/theme.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Pallete.bgMainColor,
      elevation: 6, // 그림자의 높이를 조정하여 더 입체적으로 보이도록 함
      behavior: SnackBarBehavior.floating, // SnackBar가 부드럽게 나타나게 함
      duration: const Duration(seconds: 1),
      content: Text(
        content,
        style: const TextStyle(
          color: Colors.red, // 텍스트 색상을 흰색으로 변경
          fontSize: 16, // 텍스트 크기를 조정
        ),
      ),
    ),
  );
}

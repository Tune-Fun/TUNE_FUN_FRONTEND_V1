import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/common/radius_square_button.dart';

var logger = Logger();

class PasswordUpdateEmailCheckScreen extends ConsumerStatefulWidget {
  final String email;
  const PasswordUpdateEmailCheckScreen({required this.email, super.key});

  @override
  ConsumerState<PasswordUpdateEmailCheckScreen> createState() =>
      _PasswordUpdateScreenState();
}

class _PasswordUpdateScreenState
    extends ConsumerState<PasswordUpdateEmailCheckScreen> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool buttonState = false;
  bool isClicked = false;

  @override
  void initState() {
    super.initState();
    emailController.text = widget.email;
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Widget gradientText(String text, FontWeight fontWeight, double fontSize) {
    final Shader linearGradientShader = ui.Gradient.linear(
        const Offset(0, 20), const Offset(150, 20), [
      const Color.fromRGBO(251, 92, 102, 1),
      const Color.fromRGBO(250, 35, 48, 1)
    ]);
    return Text(
      text,
      style: TextStyle(
        foreground: Paint()..shader = linearGradientShader,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "비밀번호 재설정",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '이메일 주소',
                  style: TextStyle(
                    color: Color.fromRGBO(102, 102, 102, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(234, 234, 234, 1))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(234, 234, 234, 1)),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "이메일 주소를 인증하기 위한 코드를 이메일로 보내드립니다.",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(102, 102, 102, 1)),
                ),
                const SizedBox(height: 20),
                RadiusSquareButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  buttonState: buttonState,
                  buttonText: '인증 코드 전송',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

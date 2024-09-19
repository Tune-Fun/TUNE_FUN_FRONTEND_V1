import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/common/radius_square_button.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/data/data_source/email_data_source.dart';
import 'package:tunefun_front/presentation/common/timer_manager.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/email_manager.dart';
import 'package:tunefun_front/presentation/views/auth/email_verify_second_view.dart';
import 'package:tunefun_front/theme/theme.dart';

var logger = Logger();

class EmailVerifyFirstScreen extends ConsumerStatefulWidget {
  final String email;
  const EmailVerifyFirstScreen({required this.email, super.key});

  @override
  ConsumerState<EmailVerifyFirstScreen> createState() =>
      _EmailVerifyFirstScreenState();
}

class _EmailVerifyFirstScreenState
    extends ConsumerState<EmailVerifyFirstScreen> {
  final appbar = UIConstants.basicAppBar();
  final _formKey = GlobalKey<FormState>();
  bool buttonState = false;
  bool isClicked = false;

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
          "이메일 인증",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
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
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: widget.email,
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(234, 234, 234, 1))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(234, 234, 234, 1)),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "이메일 주소를 인증하기 위한 코드를 이메일로 보내드립니다.",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Pallete.textSubColor),
                  ),
                  const SizedBox(height: 20),
                  RadiusSquareButton(
                    onTap: () {
                      int t = ref.read(timerProvider);
                      if (t == 180) {
                        ref.read(emailManagerProvider.notifier).send();
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const EmailVerifySecondScreen()));
                    },
                    buttonState: true,
                    buttonText: '인증 코드 전송',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

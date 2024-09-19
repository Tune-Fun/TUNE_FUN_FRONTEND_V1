import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/common/radius_square_button.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/auth_manager.dart';
import 'package:tunefun_front/features/setting/view/account_setting_view.dart';
import 'package:tunefun_front/theme/pallete.dart';

var logger = Logger();

class PasswordUpdateScreen extends ConsumerStatefulWidget {
  const PasswordUpdateScreen({super.key});

  @override
  ConsumerState<PasswordUpdateScreen> createState() =>
      _PasswordUpdateScreenState();
}

class _PasswordUpdateScreenState extends ConsumerState<PasswordUpdateScreen> {
  final confirmationCodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool buttonState = false;

  @override
  void dispose() {
    confirmationCodeController.dispose();
    super.dispose();
  }

  bool isValidPassword(String value) {
    String pattern = r'^[a-zA-Z0-9!@#\$&*~]{8,40}$';
    RegExp regex = RegExp(pattern);

    return regex.hasMatch(value);
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
    ref.listen<AuthManagerState>(authManagerProvider, (previous, next) {
      if (next is SetNewPasswordSuccess) {
        Fluttertoast.showToast(msg: "비밀번호 재설정을 완료했습니다.");
        Navigator.pushAndRemoveUntil(
          context,
          AccountSettingScreen.route(),
          (route) => false,
        );
      } else if (next is SetNewPasswordError) {
        Fluttertoast.showToast(msg: "비밀번호 재설정 실패했습니다. ${next.message}");
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "비밀번호 재설정",
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
                  const Row(
                    children: [
                      Text(
                        '새 비밀번호 입력',
                        style: TextStyle(
                          color: Color.fromRGBO(102, 102, 102, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "(영문/숫자 8자 이상 40자 이하)",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(153, 153, 153, 1)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: confirmationCodeController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(234, 234, 234, 1))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(234, 234, 234, 1)),
                          borderRadius: BorderRadius.circular(8)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Pallete.negativeColor),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      setState(() {
                        buttonState = isValidPassword(value);
                      });
                    },
                  ),
                  const SizedBox(height: 35),
                  RadiusSquareButton(
                    onTap: () {
                      if (buttonState) {
                        ref
                            .read(authManagerProvider.notifier)
                            .setNewPassword(confirmationCodeController.text);
                      }
                    },
                    buttonState: buttonState,
                    buttonText: '비밀번호 재설정',
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

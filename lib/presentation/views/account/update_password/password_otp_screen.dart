import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/common/radius_square_button.dart';
import 'package:tunefun_front/presentation/common/timer_manager.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/auth_manager.dart';
import 'package:tunefun_front/presentation/views/account/update_password/password_update_screen.dart';

var logger = Logger();

class PasswordOTPScreen extends ConsumerStatefulWidget {
  const PasswordOTPScreen({super.key});

  @override
  ConsumerState<PasswordOTPScreen> createState() => _PasswordOTPScreenState();
}

class _PasswordOTPScreenState extends ConsumerState<PasswordOTPScreen> {
  final confirmationCodeController = TextEditingController();
  bool buttonState = false;
  bool isClicked = false;
  bool isWrongOTP = false;
  @override
  void initState() {
    super.initState();
    ref.read(timerProvider.notifier).startTimer();
  }

  @override
  void dispose() {
    confirmationCodeController.dispose();
    super.dispose();
  }

  Widget resendText(String text, FontWeight fontWeight, double fontSize) {
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
    final start = ref.watch(timerProvider);

    ref.listen<AuthManagerState>(authManagerProvider, (previous, next) {
      if (next is VerifyPasswordOTPSuccess) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PasswordUpdateScreen()),
        );
      } else if (next is SendPasswordOTPError) {
        Fluttertoast.showToast(msg: "인증코드 발송 실패 ${next.message}");
        ref.read(timerProvider.notifier).resetTimer();
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '코드 입력',
                      style: TextStyle(
                        color: Color.fromRGBO(102, 102, 102, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                        onTap: () async {
                          //코드재전송
                        },
                        child: start == 180
                            ? resendText(
                                "코드 재전송",
                                FontWeight.w400,
                                14,
                              )
                            : Text("$start초 후에 다시 시도"))
                  ],
                ),
                const SizedBox(height: 12),
                TextFormField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: confirmationCodeController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: isWrongOTP
                                ? const Color.fromRGBO(233, 20, 20, 1)
                                : const Color.fromRGBO(234, 234, 234, 1))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: isWrongOTP
                                ? const Color.fromRGBO(233, 20, 20, 1)
                                : const Color.fromRGBO(234, 234, 234, 1)),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 35),
                RadiusSquareButton(
                  onTap: () {
                    if (confirmationCodeController.text.isEmpty) return;

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const PasswordUpdateScreen()));
                  },
                  buttonState: confirmationCodeController.text.isNotEmpty,
                  buttonText: '코드 확인',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

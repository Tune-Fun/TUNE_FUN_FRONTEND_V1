import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/common/radius_square_button.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/data/data_source/email_data_source.dart';
import 'package:tunefun_front/presentation/common/timer_manager.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/email_manager.dart';
import 'package:tunefun_front/theme/theme.dart';

var logger = Logger();

class EmailVerifySecondScreen extends ConsumerStatefulWidget {
  const EmailVerifySecondScreen({super.key});

  @override
  ConsumerState<EmailVerifySecondScreen> createState() =>
      _EmailVerifySecondScreenState();
}

class _EmailVerifySecondScreenState
    extends ConsumerState<EmailVerifySecondScreen> {
  final appbar = UIConstants.basicAppBar();
  final confirmationCodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool buttonState = false;
  bool isClicked = false;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    ref.read(timerProvider.notifier).startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    confirmationCodeController.dispose();
    super.dispose();
  }

  void resendConfirmationCode() {
    // ref.watch(authControllerProvider.notifier).resendConfirmationCode(
    //       // 나중에 실제 회원가입이 진행될 시에는
    //       // ref.watch(currentUserAccountProvider).when()
    //       // 를 통해 실시간 사용자 이메일 주소를 가져와서 넘겨줘야 한다.
    //       email: 'seilylook@naver.com',
    //       context: context,
    //     );
  }

  void verifyEmail(String otp) async {
    final res = await ref.read(emailManagerProvider.notifier).verify(otp);
    print(res);
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
    final emailVM = ref.watch(emailDataSourceProvider);
    final start = ref.watch(timerProvider);
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
                            // const storage = FlutterSecureStorage();
                            // final key = await storage.read(key: 'access_token');
                            // emailVM.regist('email');
                            // startTimer();
                          },
                          child: start == 180
                              ? gradientText(
                                  "코드 재전송",
                                  FontWeight.w400,
                                  14,
                                )
                              : Text("$start초 후에 다시 시도"))
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: confirmationCodeController,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(234, 234, 234, 1))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(234, 234, 234, 1)),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        buttonState = value.isNotEmpty ? true : false;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '코드를 입력해주세요.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 35),
                  RadiusSquareButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        verifyEmail(confirmationCodeController.text);
                      }
                    },
                    buttonState: buttonState,
                    buttonText: '코드 확인',
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

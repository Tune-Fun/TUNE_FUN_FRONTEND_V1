import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/common/common.dart';
import 'package:tunefun_front/common/radius_square_button.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/presentation/views/auth/signup_account_type_select_view.dart';
import 'package:tunefun_front/theme/theme.dart';

var logger = Logger();

class SignupPasswordInputScreen extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController usernameController;

  const SignupPasswordInputScreen({
    super.key,
    required this.emailController,
    required this.usernameController,
  });

  @override
  State<SignupPasswordInputScreen> createState() =>
      _SignupPasswordInputScreenState();
}

class _SignupPasswordInputScreenState extends State<SignupPasswordInputScreen> {
  final appbar = UIConstants.signUpAppBar();
  late TextEditingController emailController;
  late TextEditingController usernameController;
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? errorText;
  @override
  void initState() {
    super.initState();
    emailController = widget.emailController;
    usernameController = widget.usernameController;
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool buttonState = passwordController.text.length >= 8 &&
        RegExp(r'^(?=(?:.*[A-Za-z].*[0-9])|(?:.*[A-Za-z].*[$@$!%*#?&])|(?:.*[0-9].*[$@$!%*#?&]))[A-Za-z0-9$@$!%*#?&]{8,40}$')
            .hasMatch(passwordController.text);
    return Scaffold(
      appBar: appbar,
      body: Form(
        key: _formKey, // 폼 키 설정
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '비밀번호 만들기',
                        style: TextStyle(
                          color: Pallete.textMainColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (errorText != null) // 에러 메시지를 조건부로 표시합니다.
                        Text(
                          errorText!,
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 70,
                    child: TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(234, 234, 234, 1),
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(234, 234, 234, 1),
                            width: 1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(234, 234, 234, 1),
                            width: 1,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(234, 234, 234, 1),
                            width: 1,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(10),
                        helperStyle: const TextStyle(
                            color: Color.fromRGBO(153, 153, 153, 1)),
                        helperText: "8가지 이상 영문/숫자/특수문자 중2가지 포함",
                        errorStyle: const TextStyle(
                            color: Color.fromRGBO(153, 153, 153, 1)),
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      onChanged: (value) => setState(() {}),
                    ),
                  ),
                  const SizedBox(height: 35),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: RadiusSquareButton(
                        onTap: () {
                          if (buttonState) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SignupAccountTypeSelectScreen(
                                  emailController: emailController,
                                  usernameController: usernameController,
                                  passwordController: passwordController,
                                ),
                              ),
                            );
                          }
                        },
                        buttonState: buttonState,
                        buttonText: '다음',
                      ),
                    ),
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

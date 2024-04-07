import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/common/common.dart';
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
  bool buttonState = false;

  @override
  void initState() {
    super.initState();
    emailController = widget.emailController;
    usernameController = widget.usernameController;
  }

  @override
  Widget build(BuildContext context) {
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
                  const Text(
                    '비밀번호 만들기',
                    style: TextStyle(
                      color: Pallete.textMainColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
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
                        contentPadding: const EdgeInsets.all(22),
                        hintText: '비밀번호',
                        hintStyle: const TextStyle(
                          fontSize: 18,
                        ),
                        helperText: "8가지 이상 영문/숫자/특수문자 중2가지 포함"),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {});
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        passwordController.clear();
                        return '비밀번호를 입력해주세요.';
                      }
                      if (value.length <= 8) {
                        passwordController.clear();
                        return "8가지 이상 영문/숫자/특수문자 중2가지 포함";
                      }
                      if (!RegExp(
                              r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$')
                          .hasMatch(value)) {
                        passwordController.clear();
                        return "8가지 이상 영문/숫자/특수문자 중2가지 포함";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 35),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: GreenSquareButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              buttonState = true;
                            });
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
                        buttonState: passwordController.text.isNotEmpty,
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

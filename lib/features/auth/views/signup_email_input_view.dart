import 'package:flutter/material.dart';
import 'package:tunefun_front/common/common.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/features/auth/views/signup_username_input_view.dart';
import 'package:tunefun_front/theme/theme.dart';

class SignupEmailInputScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const SignupEmailInputScreen());
  const SignupEmailInputScreen({super.key});

  @override
  State<SignupEmailInputScreen> createState() => _SignupEmailInputScreenState();
}

class _SignupEmailInputScreenState extends State<SignupEmailInputScreen> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool buttonState = false;

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
            const Center(
              child: Text(
                '회원가입',
                style: TextStyle(
                  color: Pallete.textMainColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '이메일 주소가 무엇인가요?',
                    style: TextStyle(
                      color: Pallete.textMainColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                          color: Pallete.textSubColor,
                          width: 3,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                          color: Pallete.textSubColor,
                          width: 3,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(22),
                      hintText: '이메일',
                      hintStyle: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '이메일을 입력해주세요.';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return '올바른 이메일 형식이 아닙니다.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 35),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 120,
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
                                builder: (context) => SignupUsernameInputScreen(
                                    emailController: emailController),
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

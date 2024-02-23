import 'package:flutter/material.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/features/auth/views/signup_username_view.dart';
import 'package:tunefun_front/theme/theme.dart';

class SignupEmailScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const SignupEmailScreen());
  const SignupEmailScreen({super.key});

  @override
  State<SignupEmailScreen> createState() => _SignupEmailScreenState();
}

class _SignupEmailScreenState extends State<SignupEmailScreen> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
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
                    child: InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          // 폼 유효성 검사
                          // 여기에 다음 단계로 넘어가는 로직 작성
                          // 아이디 입력 스크린으로 이동
                          // 중요! 사용자가 입력한 이메일도 같이 넘겨줘야 한다.
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupUsernameScreen(
                                emailController: emailController,
                              ),
                            ),
                          );
                        }
                      },
                      child: const Chip(
                        label: Text(
                          '다음',
                          style: TextStyle(
                            color: Pallete.greenColor,
                            fontSize: 16,
                          ),
                        ),
                        backgroundColor: Pallete.bgMainColor,
                        labelPadding: EdgeInsets.symmetric(
                          horizontal: 120,
                          vertical: 5,
                        ),
                        side: BorderSide(color: Pallete.greenColor),
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

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/theme/theme.dart';

var logger = Logger();

class SignupPasswordScreen extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController userIdController;

  const SignupPasswordScreen({
    super.key,
    required this.emailController,
    required this.userIdController,
  });

  @override
  State<SignupPasswordScreen> createState() => _SignupPasswordScreenState();
}

class _SignupPasswordScreenState extends State<SignupPasswordScreen> {
  final appbar = UIConstants.appBar();
  late TextEditingController emailController;
  late TextEditingController userIdController;
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = widget.emailController;
    userIdController = widget.userIdController;
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
                    '비밀번호 만들기',
                    style: TextStyle(
                      color: Pallete.textMainColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: passwordController,
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
                      hintText: '비밀번호',
                      hintStyle: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        passwordController.clear();
                        return '비밀번호를 입력해주세요.';
                      }
                      if (value.length <= 8) {
                        passwordController.clear();
                        return "비밀번호는 8가지 이상 영문/숫자/특수문자 중 2가지 포함해야 합니다.";
                      }
                      if (!RegExp(
                              r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$')
                          .hasMatch(value)) {
                        passwordController.clear();
                        return "비밀번호는 8가지 이상 영문/숫자/특수문자 중 2가지 포함해야 합니다.";
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

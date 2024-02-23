import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/constants/ui_constants.dart';
import 'package:tunefun_front/features/auth/views/signup_password_view.dart';
import 'package:tunefun_front/theme/theme.dart';

var logger = Logger();

class SignupUserIdScreen extends StatefulWidget {
  final TextEditingController emailController;

  const SignupUserIdScreen({
    super.key,
    required this.emailController,
  });

  @override
  State<SignupUserIdScreen> createState() => _SignupUserIdScreenState();
}

class _SignupUserIdScreenState extends State<SignupUserIdScreen> {
  final appbar = UIConstants.appBar();
  final userIdController = TextEditingController();
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = widget.emailController;
  }

  @override
  void dispose() {
    super.dispose();
    userIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Form(
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
                    '아이디가 무엇인가요?',
                    style: TextStyle(
                      color: Pallete.textMainColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: userIdController,
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
                      hintText: '아이디',
                      hintStyle: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 35),
                  Center(
                    child: InkWell(
                      onTap: () {
                        // 폼 유효성 검사
                        // 여기에 다음 단계로 넘어가는 로직 작성
                        // 비밀번호 입력 스크린으로 이동
                        // 중요! 사용자가 입력한 이메일, 아이디도 같이 넘겨줘야 한다.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupPasswordScreen(
                              emailController: emailController,
                              userIdController: userIdController,
                            ),
                          ),
                        );
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

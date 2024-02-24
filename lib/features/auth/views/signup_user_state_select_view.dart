import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/common/common.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/features/auth/views/signup_username_input_view.dart';
import 'package:tunefun_front/theme/theme.dart';

var logger = Logger();

class SignupUserStateSelectScreen extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController userIdController;
  final TextEditingController passwordController;

  const SignupUserStateSelectScreen({
    super.key,
    required this.emailController,
    required this.userIdController,
    required this.passwordController,
  });

  @override
  State<SignupUserStateSelectScreen> createState() =>
      _SignupUserStateSelectScreenState();
}

class _SignupUserStateSelectScreenState
    extends State<SignupUserStateSelectScreen> {
  final appbar = UIConstants.appBar();
  late TextEditingController emailController;
  late TextEditingController userIdController;
  late TextEditingController passwordController;
  String userType = '';
  bool buttonState = false;

  @override
  void initState() {
    super.initState();
    emailController = widget.emailController;
    userIdController = widget.userIdController;
    passwordController = widget.passwordController;
    userType = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 12,
          ),
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
                  '사용자를 선택해주세요.',
                  style: TextStyle(
                    color: Pallete.textMainColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // 일반 사용자 버튼이 눌렸을 때의 로직
                          setState(() {
                            userType = 'normal';
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: userType == 'normal'
                                ? Pallete.greenColor
                                : Pallete.bgMainColor,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Pallete.greenColor),
                          ),
                          child: Center(
                            child: Text(
                              '일반 사용자',
                              style: TextStyle(
                                color: userType == 'normal'
                                    ? Pallete.bgMainColor
                                    : Pallete.greenColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10), // 버튼 사이의 간격 조정
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // 아티스트 사용자 버튼이 눌렸을 때의 로직
                          setState(() {
                            userType = 'artist';
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: userType == 'artist'
                                ? Pallete.greenColor
                                : Pallete.bgMainColor,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Pallete.greenColor),
                          ),
                          child: Center(
                            child: Text(
                              '아티스트 사용자',
                              style: TextStyle(
                                color: userType == 'artist'
                                    ? Pallete.bgMainColor
                                    : Pallete.greenColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 120, vertical: 5),
                    child: GreenSquareButton(
                      onTap: () {
                        setState(() {
                          buttonState = true;
                        });
                        // 다음 페이지로 이동
                        // 사용자 이름(닉네임) 입력 및 약관 동의
                        // 화면번호 : 12500
                        // parameter: emailController, userIdController, passwordController, userType
                        // logger.i(emailController.text);
                        // logger.i(userIdController.text);
                        // logger.i(passwordController.text);
                        // logger.i(userType);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupUserNameInputScreen(
                              emailController: emailController,
                              userIdController: userIdController,
                              passwordController: passwordController,
                              userType: userType,
                            ),
                          ),
                        );
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
    );
  }
}

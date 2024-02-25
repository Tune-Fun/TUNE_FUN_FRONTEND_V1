import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/common/common.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/features/auth/views/signup_nickname_input_view.dart';
import 'package:tunefun_front/theme/theme.dart';

var logger = Logger();

class SignupAccountTypeSelectScreen extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const SignupAccountTypeSelectScreen({
    super.key,
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
  });

  @override
  State<SignupAccountTypeSelectScreen> createState() =>
      _SignupAccountTypeSelectScreenState();
}

class _SignupAccountTypeSelectScreenState
    extends State<SignupAccountTypeSelectScreen> {
  final appbar = UIConstants.appBar();
  late TextEditingController emailController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  String accountType = '';
  bool buttonState = false;

  @override
  void initState() {
    super.initState();
    emailController = widget.emailController;
    usernameController = widget.usernameController;
    passwordController = widget.passwordController;
    accountType = '';
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
                            accountType = 'normal';
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: accountType == 'normal'
                                ? Pallete.greenColor
                                : Pallete.bgMainColor,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Pallete.greenColor),
                          ),
                          child: Center(
                            child: Text(
                              '일반 사용자',
                              style: TextStyle(
                                color: accountType == 'normal'
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
                            accountType = 'artist';
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: accountType == 'artist'
                                ? Pallete.greenColor
                                : Pallete.bgMainColor,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Pallete.greenColor),
                          ),
                          child: Center(
                            child: Text(
                              '아티스트 사용자',
                              style: TextStyle(
                                color: accountType == 'artist'
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
                        // parameter: emailController, usernameController, passwordController, accountType
                        // logger.i(emailController.text);
                        // logger.i(usernameController.text);
                        // logger.i(passwordController.text);
                        // logger.i(accountType);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupNickNameInputScreen(
                              emailController: emailController,
                              usernameController: usernameController,
                              passwordController: passwordController,
                              accountType: accountType,
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

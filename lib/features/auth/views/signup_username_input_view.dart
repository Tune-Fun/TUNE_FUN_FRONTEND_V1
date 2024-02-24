import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/common/circle_check_button.dart';
import 'package:tunefun_front/common/common.dart';
import 'package:tunefun_front/constants/ui_constants.dart';
import 'package:tunefun_front/theme/theme.dart';

var logger = Logger();

class SignupUserNameInputScreen extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController userIdController;
  final TextEditingController passwordController;
  final String userType;

  const SignupUserNameInputScreen({
    super.key,
    required this.emailController,
    required this.userIdController,
    required this.passwordController,
    required this.userType,
  });

  @override
  State<SignupUserNameInputScreen> createState() =>
      _SignupUserNameInputScreenState();
}

class _SignupUserNameInputScreenState extends State<SignupUserNameInputScreen> {
  final appbar = UIConstants.appBar();
  late TextEditingController emailController;
  late TextEditingController userIdController;
  late TextEditingController passwordController;
  late String userType;
  bool buttonState = false;
  bool termsOfService = false;
  bool privacyPolicy = false;

  final userNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController = widget.emailController;
    userIdController = widget.userIdController;
    passwordController = widget.passwordController;
    userType = widget.userType;
    userNameController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    userIdController.dispose();
    passwordController.dispose();
    userNameController.dispose();
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
                    '사용자 이름이 무엇인가요?',
                    style: TextStyle(
                      color: Pallete.textMainColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: userNameController,
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
                      hintText: '이름',
                      hintStyle: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    '프로필에 표시됩니다',
                    style: TextStyle(
                      color: Pallete.textMainColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                    ),
                  ),
                  // 필수
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Pallete.borderColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 4,
                      ),
                      child: Text(
                        '필수',
                        style: TextStyle(
                          color: Pallete.textMainColor,
                        ),
                      ),
                    ),
                  ),
                  // text = Tunefun 이용약관 / 체크 버튼
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'TuneFun 이용 약관',
                        style: TextStyle(
                          color: Pallete.textMainColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      CircleCheckButton(
                        isChecked: termsOfService,
                        onChanged: (value) {
                          setState(() {
                            termsOfService = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      // 이용 약관에 대한 동작 추가
                      logger.d('이용 약관 클릭!');
                    },
                    child: const Text(
                      '이용 약관',
                      style: TextStyle(
                        color: Pallete.greenColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        color: Pallete.borderColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 4,
                      ),
                      child: Text(
                        '필수',
                        style: TextStyle(
                          color: Pallete.textMainColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '필수 개인정보의 수집 및 사용',
                        style: TextStyle(
                          color: Pallete.textMainColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      CircleCheckButton(
                        isChecked: privacyPolicy,
                        onChanged: (value) {
                          setState(() {
                            privacyPolicy = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      // 이용 약관에 대한 동작 추가
                      logger.d('필수 개인정보의 수집 및 사용 클릭!');
                    },
                    child: const Text(
                      '필수 개인정보의 수집 및 사용',
                      style: TextStyle(
                        color: Pallete.greenColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '사용자 개인 데이터 처리에 대한 자세한 내용은 TuneFun 개인정보 처리방침을 확인하세요.',
                    style: TextStyle(
                      color: Pallete.textMainColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      // 이용 약관에 대한 동작 추가
                      logger.d('개인 처리 방침 클릭!');
                    },
                    child: const Text(
                      '개인정보 처리방침',
                      style: TextStyle(
                        color: Pallete.greenColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120, vertical: 5),
                      child: GreenSquareButton(
                        onTap: () {
                          setState(() {
                            buttonState = true;
                          });
                          logger.i(emailController.text);
                          logger.i(userIdController.text);
                          logger.i(passwordController.text);
                          logger.i(userType);
                          logger.i(userNameController.text);
                          // 이제 회원가입 진행하면 된다.
                          // api 연결
                        },
                        buttonState: buttonState,
                        buttonText: '계정 만들기',
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

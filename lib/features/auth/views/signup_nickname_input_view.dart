import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/common/common.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/features/auth/controllers/auth_controller.dart';
import 'package:tunefun_front/features/auth/views/login_view.dart';
import 'package:tunefun_front/theme/theme.dart';

var logger = Logger();

class SignupNickNameInputScreen extends ConsumerStatefulWidget {
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final String accountType;

  const SignupNickNameInputScreen({
    super.key,
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
    required this.accountType,
  });

  @override
  ConsumerState<SignupNickNameInputScreen> createState() =>
      _SignupNickNameInputScreenState();
}

class _SignupNickNameInputScreenState
    extends ConsumerState<SignupNickNameInputScreen> {
  final appbar = UIConstants.appBar();
  late TextEditingController emailController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late String accountType;
  bool buttonState = false;
  bool termsOfService = false;
  bool privacyPolicy = false;
  final _formKey = GlobalKey<FormState>();

  final nicknameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController = widget.emailController;
    usernameController = widget.usernameController;
    passwordController = widget.passwordController;
    accountType = widget.accountType;
  }

  void signUp() {
    ref.read(authControllerProvider.notifier).signup(
          email: emailController.text,
          username: usernameController.text,
          password: passwordController.text,
          nickname: nicknameController.text,
          accountType: accountType,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: appbar,
      body: Form(
        key: _formKey,
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
                    controller: nicknameController,
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '이름을 입력해주세요';
                      }
                      return null;
                    },
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
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              buttonState = true;
                            });

                            // 이제 회원가입 진행하면 된다.
                            // api 연결
                            signUp();

                            if (isLoading == true) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                LoginScreen.route(),
                                (route) => false,
                              );
                            }
                          }
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

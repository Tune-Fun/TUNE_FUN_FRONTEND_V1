import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tunefun_front/common/common.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/features/auth/controllers/auth_controller.dart';
import 'package:tunefun_front/features/auth/views/signup_main_view.dart';
import 'package:tunefun_front/theme/pallete.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const LoginScreen());
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final appbar = UIConstants.appBar();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool buttonState = false;

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  void logIn() {
    ref.watch(authControllerProvider.notifier).login(
          username: usernameController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    controller: usernameController,
                    keyboardType: TextInputType.text,
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
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
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
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          ImageConstants.profileOutlinedIcon,
                          height: 40,
                          width: 40,
                        ),
                      ),
                      const SizedBox(width: 45),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          ImageConstants.profileOutlinedIcon,
                          height: 40,
                          width: 40,
                        ),
                      ),
                      const SizedBox(width: 45),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          ImageConstants.profileOutlinedIcon,
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, SignUpMainScreen.route());
                        },
                        child: const Text(
                          '회원가입',
                          style: TextStyle(
                            color: Pallete.textMainColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 70,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          '아이디/비밀번호 찾기',
                          style: TextStyle(
                            color: Pallete.textMainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GreenSquareButton(
                      onTap: () {
                        setState(() {
                          buttonState = true;
                        });

                        logIn();
                      },
                      buttonState: buttonState,
                      buttonText: '로그인',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

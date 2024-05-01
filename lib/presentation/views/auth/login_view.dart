import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tunefun_front/common/login_button.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/auth_manager.dart';
import 'package:tunefun_front/presentation/views/auth/signup_main_view.dart';
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
    dynamic data = {
      'username': usernameController.text,
      'password': passwordController.text,
    };
    ref.watch(authManagerProvider.notifier).logIn(data);
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(authManagerProvider);
    return Scaffold(
        appBar: appbar,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '아이디',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(102, 102, 102, 1)),
                ),
                TextFormField(
                  controller: usernameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: Pallete.borderColor,
                        width: 3,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: Pallete.borderColor,
                        width: 3,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(16),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  '비밀번호',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(102, 102, 102, 1)),
                ),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: Pallete.borderColor,
                        width: 3,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: Pallete.borderColor,
                        width: 3,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(16),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                loginState is AuthMangerStateError
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            ImageConstants.alertIcon,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "아이디 및 비밀번호 조합이 잘못되었습니다.",
                            style: TextStyle(
                                color: Color.fromRGBO(233, 20, 20, 1),
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    : const SizedBox(),
                // login test
                if (loginState is AuthMangerStateSuccess)
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 15),
                    child: Text(
                      "로그인 성공 ",
                      style: TextStyle(
                          color: Color.fromRGBO(233, 20, 20, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                else
                  const SizedBox(),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: LoginButton(
                    onTap: () {
                      if (usernameController.text.isEmpty ||
                          passwordController.text.isEmpty) return;
                      logIn();
                    },
                    buttonState: usernameController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '아이디 찾기',
                      style: TextStyle(
                          color: Colors.black, fontSize: 16), // 폰트 스타일 설정
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        '|',
                        style: TextStyle(
                            color: Colors.black, fontSize: 16), // 폰트 스타일 설정
                      ),
                    ),
                    Text(
                      '비밀번호 찾기',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        '|',
                        style: TextStyle(
                            color: Colors.black, fontSize: 16), // 폰트 스타일 설정
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SignUpMainScreen()));
                      },
                      child: Text(
                        '회원 가입',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("------------------   ",
                        style:
                            TextStyle(color: Color.fromRGBO(153, 153, 153, 1))),
                    Text("또는",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(153, 153, 153, 1))),
                    Text("   ------------------",
                        style:
                            TextStyle(color: Color.fromRGBO(153, 153, 153, 1))),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(234, 234, 234, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 30,
                            child: GestureDetector(
                              onTap: () {
                                // apple social
                              },
                              child: SvgPicture.asset(
                                ImageConstants.appleIcon,
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(234, 234, 234, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 30,
                            child: GestureDetector(
                              onTap: () {
                                // apple social
                              },
                              child: SvgPicture.asset(
                                ImageConstants.googleIcon,
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(234, 234, 234, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 30,
                            child: GestureDetector(
                              onTap: () {
                                // apple social
                              },
                              child: SvgPicture.asset(
                                ImageConstants.instagramIcon,
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tunefun_front/common/login_button.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/features/home/views/home_view.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/auth_manager.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/email_manager.dart';
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
  final appbar = UIConstants.basicAppBar();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool buttonState = false;

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  Future checkEmailVerify() async {
    await ref.read(emailManagerProvider.notifier).checkVerify();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
                Navigator.pushAndRemoveUntil(
                  context,
                  HomeScreen.route(),
                  (route) => false,
                );
              }
            },
          ),
          title: const Text(
            "로그인",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    final loginState = ref.watch(authManagerProvider);
    ref.listen<AuthManagerState>(authManagerProvider, (previus, next) {
      if (next is LoginSuccess) {
        ref.read(emailManagerProvider.notifier).checkVerify();
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        } else {
          Navigator.pushAndRemoveUntil(
            context,
            HomeScreen.route(),
            (route) => false,
          );
        }
        Fluttertoast.showToast(msg: "로그인 성공");
      } else if (next is LoginError) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Fluttertoast.showToast(msg: "error ${next.message}");
        });
      }
    });
    return loginState is AuthManagerStateLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
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
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Pallete.borderColor,
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
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Pallete.borderColor,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(16),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: 50,
                    child: loginState is LoginError
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
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: LoginButton(
                      onTap: usernameController.text.isEmpty ||
                              passwordController.text.isEmpty
                          ? () {}
                          : () async {
                              dynamic data = {
                                'username': usernameController.text,
                                'password': passwordController.text,
                              };
                              await ref
                                  .read(authManagerProvider.notifier)
                                  .logIn(data);
                            },
                      buttonState: usernameController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '아이디 찾기',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ), // 폰트 스타일 설정
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          '|',
                          style: TextStyle(
                              color: Colors.black, fontSize: 16), // 폰트 스타일 설정
                        ),
                      ),
                      const Text(
                        '비밀번호 찾기',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
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
                        child: const Text(
                          '회원 가입',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          );
  }
}

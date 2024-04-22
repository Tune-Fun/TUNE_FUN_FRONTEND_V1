import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/common/common.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/presentation/views/auth/signup_nickname_input_view.dart';
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
  final appbar = UIConstants.signUpAppBar();
  late TextEditingController emailController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  String accountType = 'artist';

  @override
  void initState() {
    super.initState();
    emailController = widget.emailController;
    usernameController = widget.usernameController;
    passwordController = widget.passwordController;
    accountType = 'artist';
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
          const SizedBox(height: 22),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '사용자를 선택해 주세요.',
                  style: TextStyle(
                    color: Pallete.textMainColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Color.fromRGBO(250, 92, 102, 1),
                        Color.fromRGBO(250, 35, 48, 1),
                      ]),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    alignment: Alignment.center,
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.all(2),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => setState(() {
                              accountType = "artist";
                            }),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                height: 42,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    accountType == "artist"
                                        ? const Color.fromRGBO(250, 92, 102, 1)
                                        : Colors.white,
                                    accountType == "artist"
                                        ? const Color.fromRGBO(250, 35, 48, 1)
                                        : Colors.white,
                                  ]),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Center(
                                  child: Text(
                                    "아티스트",
                                    style: TextStyle(
                                        color: accountType == 'artist'
                                            ? const Color.fromRGBO(
                                                255, 255, 255, 1)
                                            : Colors.red,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => setState(() {
                              accountType = 'normal';
                            }),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                height: 42,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    accountType == "normal"
                                        ? const Color.fromRGBO(250, 92, 102, 1)
                                        : Colors.white,
                                    accountType == "normal"
                                        ? const Color.fromRGBO(250, 35, 48, 1)
                                        : Colors.white,
                                  ]),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Center(
                                  child: Text(
                                    "일반",
                                    style: TextStyle(
                                        color: accountType == 'normal'
                                            ? const Color.fromRGBO(
                                                255, 255, 255, 1)
                                            : Colors.red,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: GreenSquareButton(
                      onTap: () {
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
                      buttonState: true,
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

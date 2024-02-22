import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tunefun_front/common/common.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/features/auth/views/signup_main_view.dart';
import 'package:tunefun_front/features/auth/widgets/auth_field.dart';
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

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
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
                AuthField(
                  controller: usernameController,
                  hintText: '아이디',
                ),
                const SizedBox(
                  height: 25,
                ),
                AuthField(
                  controller: passwordController,
                  hintText: '비밀번호',
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
                  child: SquareButton(
                    onTap: () {},
                    label: '로그인',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

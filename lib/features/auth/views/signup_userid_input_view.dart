import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/common/green_square_button.dart';
import 'package:tunefun_front/constants/ui_constants.dart';
import 'package:tunefun_front/features/auth/views/signup_password_input_view.dart';
import 'package:tunefun_front/theme/theme.dart';

var logger = Logger();

class SignupUserIdInputScreen extends StatefulWidget {
  final TextEditingController emailController;

  const SignupUserIdInputScreen({
    super.key,
    required this.emailController,
  });

  @override
  State<SignupUserIdInputScreen> createState() =>
      _SignupUserIdInputScreenState();
}

class _SignupUserIdInputScreenState extends State<SignupUserIdInputScreen> {
  final appbar = UIConstants.appBar();
  final userIdController = TextEditingController();
  late TextEditingController emailController;
  bool buttonState = false;

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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120, vertical: 5),
                      child: GreenSquareButton(
                        onTap: () {
                          setState(() {
                            buttonState = true;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupPasswordInputScreen(
                                  emailController: emailController,
                                  userIdController: userIdController),
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/common/common.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/auth_manager.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/email_manager.dart';
import 'package:tunefun_front/presentation/views/auth/signup_username_input_view.dart';
import 'package:tunefun_front/theme/theme.dart';

class SignupEmailInputScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const SignupEmailInputScreen());
  const SignupEmailInputScreen({super.key});

  @override
  State<SignupEmailInputScreen> createState() => _SignupEmailInputScreenState();
}

class _SignupEmailInputScreenState extends State<SignupEmailInputScreen> {
  final appbar = UIConstants.signUpAppBar();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool buttonState = false;
  String emailMessage = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Form(
        key: _formKey, // 폼 키 설정
        child: Consumer(builder: (context, ref, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const SizedBox(height: 22),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '이메일 주소가 무엇인가요?',
                      style: TextStyle(
                        color: Pallete.textMainColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(234, 234, 234, 1),
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(234, 234, 234, 1),
                            width: 1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(234, 234, 234, 1),
                            width: 1,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(234, 234, 234, 1),
                            width: 1,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(22),
                        hintText: '이메일',
                        hintStyle: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {});
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '이메일을 입력해주세요.';
                        } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return '올바른 이메일 형식이 아닙니다.';
                        } else if (emailMessage.isNotEmpty) {
                          if (emailMessage == "2006") {
                            return "중복된 이메일 입니다. 다른 이메일을 입력해 주세요.";
                          }
                          return emailMessage;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 35),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        child: BasicSquareButton(
                          onTap: () async {
                            emailMessage = "";
                            if (_formKey.currentState!.validate()) {
                              // api
                              dynamic response = await ref
                                  .read(emailManagerProvider.notifier)
                                  .checkEmailDuplicate(emailController.text);
                              // const response = "2008";
                              if (response.toString() == "2008") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SignupUsernameInputScreen(
                                            emailController: emailController),
                                  ),
                                );
                              } else {
                                setState(() {
                                  emailMessage = response;
                                });
                                _formKey.currentState!.validate();
                              }
                            }
                          },
                          buttonState: emailController.text.isNotEmpty,
                          buttonText: '다음',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

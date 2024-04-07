import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/common/common.dart';
import 'package:tunefun_front/constants/ui_constants.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/auth_manager.dart';
import 'package:tunefun_front/presentation/views/auth/signup_password_input_view.dart';
import 'package:tunefun_front/theme/theme.dart';

var logger = Logger();

class SignupUsernameInputScreen extends StatefulWidget {
  final TextEditingController emailController;

  const SignupUsernameInputScreen({
    super.key,
    required this.emailController,
  });

  @override
  State<SignupUsernameInputScreen> createState() =>
      _SignupUsernameInputScreenState();
}

class _SignupUsernameInputScreenState extends State<SignupUsernameInputScreen> {
  final appbar = UIConstants.signUpAppBar();
  final usernameController = TextEditingController();
  late TextEditingController emailController;
  final _formKey = GlobalKey<FormState>();
  bool buttonState = false;
  String idMessage = "";
  @override
  void initState() {
    super.initState();
    emailController = widget.emailController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Form(
        key: _formKey,
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
                      '아이디가 무엇인가요?',
                      style: TextStyle(
                        color: Pallete.textMainColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: usernameController,
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
                        hintText: '아이디',
                        hintStyle: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        setState(() {});
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '아이디를 입력해주세요.';
                        } else if (idMessage.isNotEmpty) {
                          if (idMessage == "2005") return "아이디가 중복입니다.";
                          return idMessage;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 35),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: GreenSquareButton(
                          onTap: () async {
                            idMessage = "";
                            if (_formKey.currentState!.validate()) {
                              // api
                              String response = await ref
                                  .read(authManagerProvider.notifier)
                                  .checkId(usernameController.text);
                              // const response = "2007";
                              if (response == "2007") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SignupPasswordInputScreen(
                                            emailController: emailController,
                                            usernameController:
                                                usernameController),
                                  ),
                                );
                              } else {
                                setState(() {
                                  idMessage = response;
                                });
                                _formKey.currentState!.validate();
                              }
                            }
                          },
                          buttonState: usernameController.text.isNotEmpty,
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

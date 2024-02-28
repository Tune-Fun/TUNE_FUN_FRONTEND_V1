import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/common/common.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/features/auth/controllers/auth_controller.dart';
import 'package:tunefun_front/features/upload/views/upload_view.dart';
import 'package:tunefun_front/theme/theme.dart';

var logger = Logger();

class EmailVerifyScreen extends ConsumerStatefulWidget {
  const EmailVerifyScreen({super.key});

  @override
  ConsumerState<EmailVerifyScreen> createState() => _EmailVerifyScreenState();
}

class _EmailVerifyScreenState extends ConsumerState<EmailVerifyScreen> {
  final appbar = UIConstants.appBar();
  final confirmationCodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool buttonState = false;

  @override
  void dispose() {
    super.dispose();
    confirmationCodeController.dispose();
  }

  void resendConfirmationCode() {
    ref.watch(authControllerProvider.notifier).resendConfirmationCode(
          // 나중에 실제 회원가입이 진행될 시에는
          // ref.watch(currentUserAccountProvider).when()
          // 를 통해 실시간 사용자 이메일 주소를 가져와서 넘겨줘야 한다.
          email: 'seilylook@naver.com',
          context: context,
        );
  }

  void verifyEmail() {
    ref.watch(authControllerProvider.notifier).verifyEmail(
          // 나중에 실제 회원가입이 진행될 시에는
          // ref.watch(currentUserAccountProvider).when()
          // 를 통해 실시간 사용자 이메일 주소를 가져와서 넘겨줘야 한다.
          email: 'seilylook@naver.com',
          confirmationCode: confirmationCodeController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserAccountProvider);
    return currentUser == null
        ? const UploadScreen()
        : Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                const Center(
                  child: Text(
                    '이메일 인증',
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
                      Row(
                        children: [
                          const Text(
                            '코드 입력',
                            style: TextStyle(
                              color: Pallete.textMainColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            width: 13,
                          ),
                          GestureDetector(
                            onTap: () {
                              // logger.i('코드 재전송 클릭 됏음!');
                              resendConfirmationCode();
                            },
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  color: Pallete.greenColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Center(
                                  child: Text(
                                    '코드 재전송',
                                    style: TextStyle(
                                      color: Pallete.bgMainColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                  ),
                                )),
                          )
                        ],
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: confirmationCodeController,
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
                          hintText: '인증 코드',
                          hintStyle: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '코드를 입력해주세요.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 35),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: GreenSquareButton(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                // 이메일 인증
                                // logger.i(confirmationCodeController.text);
                                verifyEmail();
                              }
                            },
                            buttonState: buttonState,
                            buttonText: '코드 확인',
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tunefun_front/common/radius_square_button.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/email_manager.dart';
import 'package:tunefun_front/presentation/views/auth/signup_username_input_view.dart';
import 'package:tunefun_front/theme/theme.dart';

class SignupEmailInputScreen extends ConsumerStatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const SignupEmailInputScreen());
  const SignupEmailInputScreen({super.key});

  @override
  ConsumerState<SignupEmailInputScreen> createState() =>
      _SignupEmailInputScreenState();
}

class _SignupEmailInputScreenState
    extends ConsumerState<SignupEmailInputScreen> {
  final appbar = UIConstants.signUpAppBar();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final emailState = ref.watch(emailManagerProvider);
    ref.listen<EmailManagerState>(emailManagerProvider, (previus, next) {
      if (next is EmailIsNoneExist) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SignupUsernameInputScreen(
                    emailController: emailController)));
      }
    });
    return Stack(
      children: [
        emailState is EmailManagerLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const SizedBox(),
        Form(
          key: _formKey, // 폼 키 설정
          child: Column(
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
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: emailState is EmailIsExist
                                  ? Pallete.negativeColor
                                  : Pallete.greyLineColor,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: emailState is EmailIsExist
                                  ? Pallete.negativeColor
                                  : Pallete.greyLineColor,
                              width: 1,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: emailState is EmailIsExist
                                  ? Pallete.negativeColor
                                  : Pallete.greyLineColor,
                              width: 1,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: emailState is EmailIsExist
                                  ? Pallete.negativeColor
                                  : Pallete.greyLineColor,
                              width: 1,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          hintText: '이메일',
                          hintStyle: const TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(153, 153, 153, 1)),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: emailState is EmailIsExist
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
                                  "중복된 이메일입니다. 다른 이메일을 사용해주세요.",
                                  style: TextStyle(
                                      color: Color.fromRGBO(233, 20, 20, 1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                          : const SizedBox(),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        child: RadiusSquareButton(
                          onTap: () async {
                            if (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(emailController.text)) {
                              await ref
                                  .read(emailManagerProvider.notifier)
                                  .checkEmailDuplicate(emailController.text);
                            }
                          },
                          buttonState:
                              RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(emailController.text),
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
      ],
    );
  }
}

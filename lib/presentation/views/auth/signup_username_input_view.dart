import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/common/radius_square_button.dart';
import 'package:tunefun_front/constants/image_constants.dart';
import 'package:tunefun_front/constants/ui_constants.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/auth_manager.dart';
import 'package:tunefun_front/presentation/views/auth/signup_password_input_view.dart';
import 'package:tunefun_front/theme/theme.dart';

var logger = Logger();

class SignupUsernameInputScreen extends ConsumerStatefulWidget {
  final TextEditingController emailController;

  const SignupUsernameInputScreen({
    super.key,
    required this.emailController,
  });

  @override
  ConsumerState<SignupUsernameInputScreen> createState() =>
      _SignupUsernameInputScreenState();
}

class _SignupUsernameInputScreenState
    extends ConsumerState<SignupUsernameInputScreen> {
  final appbar = UIConstants.signUpAppBar();
  final usernameController = TextEditingController();
  late TextEditingController emailController;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    emailController = widget.emailController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final checkIdState = ref.watch(authManagerProvider);
    ref.listen<AuthManagerState>(authManagerProvider, (previus, next) {
      if (next is IdIsNoExist) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SignupPasswordInputScreen(
                    emailController: emailController,
                    usernameController: usernameController)));
      }
    });
    return Stack(
      children: [
        checkIdState is AuthManagerStateLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const SizedBox(),
        Form(
          key: _formKey,
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
                      '아이디가 무엇인가요?',
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
                        controller: usernameController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: checkIdState is IdIsExist
                                  ? Pallete.redColor
                                  : Pallete.greyLineColor,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: checkIdState is IdIsExist
                                  ? Pallete.redColor
                                  : Pallete.greyLineColor,
                              width: 1,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: checkIdState is IdIsExist
                                  ? Pallete.redColor
                                  : Pallete.greyLineColor,
                              width: 1,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: checkIdState is IdIsExist
                                  ? Pallete.redColor
                                  : Pallete.greyLineColor,
                              width: 1,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          hintText: '아이디',
                          hintStyle: const TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(153, 153, 153, 1)),
                        ),
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: checkIdState is IdIsExist
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
                                  "중복된 아이디 입니다. 다른 아이디를 사용해주세요.",
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
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: RadiusSquareButton(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              await ref
                                  .read(authManagerProvider.notifier)
                                  .checkId(usernameController.text);
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
          ),
        ),
      ],
    );
  }
}

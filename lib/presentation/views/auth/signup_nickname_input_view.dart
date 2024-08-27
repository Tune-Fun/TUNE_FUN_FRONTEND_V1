import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/common/common.dart';
import 'package:tunefun_front/common/radius_square_button.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/constants/setting_data.dart';
import 'package:tunefun_front/features/setting/view/agreement/agreement_detail_view.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/auth_manager.dart';
import 'package:tunefun_front/presentation/views/auth/login_view.dart';
import 'package:tunefun_front/theme/theme.dart';

var logger = Logger();

class SignupNickNameInputScreen extends ConsumerStatefulWidget {
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final String accountType;

  const SignupNickNameInputScreen({
    super.key,
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
    required this.accountType,
  });

  @override
  ConsumerState<SignupNickNameInputScreen> createState() =>
      _SignupNickNameInputScreenState();
}

class _SignupNickNameInputScreenState
    extends ConsumerState<SignupNickNameInputScreen> {
  final appbar = UIConstants.signUpAppBar();
  late TextEditingController emailController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  List agreementData = SettingData.agreementData;
  late String accountType;
  bool termsOfService = false;
  bool privacyPolicy = false;
  final _formKey = GlobalKey<FormState>();

  final nicknameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController = widget.emailController;
    usernameController = widget.usernameController;
    passwordController = widget.passwordController;
    accountType = widget.accountType;
  }

  void signUp() {
    dynamic data = {
      'type': accountType,
      "email": emailController.text,
      "username": usernameController.text,
      "password": passwordController.text,
      "nickname": nicknameController.text,
    };
    ref.watch(authManagerProvider.notifier).signUp(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final loginState = ref.watch(authManagerProvider);
    ref.listen<AuthManagerState>(authManagerProvider, (previus, next) {
      if (next is SignupSuccess) {
        Navigator.pushAndRemoveUntil(
          context,
          LoginScreen.route(),
          (route) => false,
        );
      } else if (next is SignupError) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Fluttertoast.showToast(msg: "회원가입중에 오류가 발생했습니다. ${next.message}");
        });
      }
    });
    return Stack(
      children: [
        loginState is AuthManagerStateLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '사용자 이름이 무엇인가요?',
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
                                  controller: nicknameController,
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
                                    contentPadding: const EdgeInsets.all(10),
                                  ),
                                  onChanged: (value) => setState(() {}),
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 15, bottom: 15),
                                child: Text(
                                  '프로필에 표시됩니다',
                                  style: TextStyle(
                                    color: Color.fromRGBO(153, 153, 153, 1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Pallete.bgCustomColor,
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 2,
                                  ),
                                  child: Text(
                                    '필수',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'TuneFun 이용 약관',
                                    style: TextStyle(
                                      color: Pallete.textMainColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                  CircleCheckButton(
                                    isChecked: termsOfService,
                                    onChanged: (value) {
                                      setState(() {
                                        termsOfService = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AgreementDetailScreen(
                                                  data: agreementData[0])));
                                },
                                child: const Text(
                                  '이용 약관',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color.fromRGBO(102, 102, 102, 1),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Container(
                                decoration: BoxDecoration(
                                    color: Pallete.bgCustomColor,
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 2,
                                  ),
                                  child: Text(
                                    '필수',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    '필수 개인정보의 수집 및 사용',
                                    style: TextStyle(
                                      color: Pallete.textMainColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                  CircleCheckButton(
                                    isChecked: privacyPolicy,
                                    onChanged: (value) {
                                      setState(() {
                                        privacyPolicy = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AgreementDetailScreen(
                                                  data: agreementData[1])));
                                },
                                child: const Text(
                                  '필수 개인정보의 수집 및 사용',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color.fromRGBO(102, 102, 102, 1),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const SizedBox(height: 35),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: SizedBox(
                        width: double.infinity,
                        child: RadiusSquareButton(
                          onTap: () {
                            if (_formKey.currentState!.validate() &&
                                privacyPolicy &&
                                termsOfService) {
                              signUp();
                            }
                          },
                          buttonState: nicknameController.text.isNotEmpty &&
                              privacyPolicy &&
                              termsOfService,
                          buttonText: '계정 만들기',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}

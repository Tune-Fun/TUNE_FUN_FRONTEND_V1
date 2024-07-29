import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tunefun_front/common/radius_square_button.dart';
import 'package:tunefun_front/constants/image_constants.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/email_manager.dart';
import 'package:tunefun_front/presentation/views/account/delete/delete_account_send_otp_view.dart';

class CheckPasswordView extends ConsumerStatefulWidget {
  const CheckPasswordView({super.key});

  @override
  ConsumerState<CheckPasswordView> createState() => _CheckPasswordViewState();
}

class _CheckPasswordViewState extends ConsumerState<CheckPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "계정 해지하기",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    // password state로 교체해야함
    final duplicateState = ref.watch(emailManagerProvider);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "비밀번호 입력",
              style: TextStyle(
                  height: 2, fontSize: 14, fontWeight: FontWeight.w400),
            ),
            TextFormField(
              controller: emailController,
              obscureText: true,
              onChanged: (value) {
                setState(() {});
              },
              validator: (value) {},
              decoration: InputDecoration(
                errorStyle: const TextStyle(height: 0),
                enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(234, 234, 234, 1))),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(234, 234, 234, 1)),
                    borderRadius: BorderRadius.circular(8)),
                errorBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color.fromRGBO(233, 20, 20, 1)),
                    borderRadius: BorderRadius.circular(8)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color.fromRGBO(233, 20, 20, 1)),
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 5),
            if (duplicateState is EmailIsExist)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(ImageConstants.alertIcon),
                    const SizedBox(width: 10),
                    const Text(
                      "입력하신 비밀번호가 일치하지 않습니다.",
                      style: TextStyle(
                          color: Color.fromRGBO(233, 20, 20, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 10),
            RadiusSquareButton(
                buttonState: emailController.text.isNotEmpty,
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const DeleteAccountSendOtpView()));
                  if (_formKey.currentState!.validate()) {
                    // 비밀번호 검증 api
                  }
                },
                buttonText: "다음")
          ],
        ),
      ),
    );
  }
}

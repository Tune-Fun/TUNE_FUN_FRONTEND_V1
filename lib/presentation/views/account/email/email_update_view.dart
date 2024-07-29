import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tunefun_front/common/radius_square_button.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/email_manager.dart';

class EmailUpdateScreen extends ConsumerStatefulWidget {
  const EmailUpdateScreen({super.key});

  @override
  ConsumerState<EmailUpdateScreen> createState() => _EmailUpdateScreenState();
}

class _EmailUpdateScreenState extends ConsumerState<EmailUpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  String emailPattern = r'^[a-z0-9._%+-]{1,64}@[a-z0-9.-]+\.[a-z]{2,}$';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "이메일 주소 변경하기",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    print("_buildBody");
    final duplicateState = ref.watch(emailManagerProvider);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "이메일 입력",
              style: TextStyle(
                  height: 2, fontSize: 14, fontWeight: FontWeight.w400),
            ),
            TextFormField(
              controller: emailController,
              onChanged: (value) {
                setState(() {});
              },
              validator: (value) {
                print("validator");
                if (value == null || value.isEmpty) {
                  return "이메일을 입력하세요";
                }
                if (!RegExp(emailPattern).hasMatch(value)) {
                  return "유효한 이메일 주소를 입력하세요";
                }
                return null;
              },
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
                      "중복된 이메일 주소입니다. 다른주소를 입력하세요.",
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
                  if (_formKey.currentState!.validate()) {
                    // 실제 api email 중복 검증
                    await ref
                        .read(emailManagerProvider.notifier)
                        .checkEmailDuplicate(emailController.text);
                    if (mounted) {
                      print("mounted");
                    }
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => EmailVerifyScreen()));
                  }
                },
                buttonText: "인증 코드 전송")
          ],
        ),
      ),
    );
  }
}

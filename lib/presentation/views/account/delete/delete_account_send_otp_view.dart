import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/common/radius_square_button.dart';
import 'package:tunefun_front/presentation/views/account/delete/delete_account_otp_view.dart';

class DeleteAccountSendOtpView extends ConsumerWidget {
  const DeleteAccountSendOtpView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextStyle subStyle = const TextStyle(
        color: Color.fromRGBO(102, 102, 102, 1),
        fontWeight: FontWeight.w400,
        fontSize: 14);
    TextStyle mainStyle = const TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontWeight: FontWeight.w700,
        fontSize: 22);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "게정 해지하기",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("아이디", style: subStyle),
            Text("sanghun00", style: mainStyle),
            const SizedBox(height: 20),
            Text("사용자 이름", style: subStyle),
            Text("parksanghun", style: mainStyle),
            const SizedBox(height: 20),
            Text("이메일", style: subStyle),
            Text("simondr@naver.com", style: mainStyle),
            const SizedBox(height: 20),
            Text("위 계정을 해지하려면 이메일 인증 코드를 입력해주세요.", style: subStyle),
            const SizedBox(height: 50),
            RadiusSquareButton(
                buttonState: true,
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const DeleteAccountOTPScreen()));
                },
                buttonText: "이메일 인증 코드 전송")
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/domain/model/account_model.dart';
import 'package:tunefun_front/presentation/common/timer_manager.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/auth_manager.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/user_manager.dart';
import 'package:tunefun_front/presentation/views/account/delete/check_password_view.dart';
import 'package:tunefun_front/presentation/views/account/email/email_disconnect_view.dart';
import 'package:tunefun_front/presentation/views/account/email/email_update_view.dart';
import 'package:tunefun_front/presentation/views/account/update_password/password_otp_screen.dart';
import 'package:tunefun_front/presentation/views/auth/email_verify_view.dart';

class AccountSettingScreen extends ConsumerWidget {
  static MaterialPageRoute route() => MaterialPageRoute(
        builder: (context) => const AccountSettingScreen(),
      );
  const AccountSettingScreen({super.key});

  final TextStyle titleStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(17, 17, 17, 1));
  final TextStyle contentStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(17, 17, 17, 1));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AccountModel? accountModel = ref.read(userManagerProvider);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      appBar: AppBar(
        title: const Text(
          "계정 정보",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        // leading: IconButton(
        //   onPressed: (){},
        // ),
      ),
      body: _buildBody(ref, context, accountModel),
    );
  }

  Widget _buildBody(
      WidgetRef ref, BuildContext context, AccountModel? accountModel) {
    return Column(
      children: [
        infoContainer(ref, context, accountModel),
        deleteAccountButton(context)
      ],
    );
  }

  Widget infoContainer(
      WidgetRef ref, BuildContext context, AccountModel? accountModel) {
    final userModel = ref.read(userManagerProvider);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.35,
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("사용자", style: titleStyle),
              Text(
                userModel!.roles!.contains("ARTIST") ? "아티스트 사용자" : "일반 사용자",
                style: contentStyle,
              )
            ],
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("사용자 이름", style: titleStyle),
              Text(
                "parksanghun00",
                style: contentStyle,
              )
            ],
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("아이디", style: titleStyle),
              Text(
                "sanghun",
                style: contentStyle,
              )
            ],
          ),
          const SizedBox(height: 18),
          GestureDetector(
            onTap: () => emailDialog(context, "simondr@naver.com"),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("이메일", style: titleStyle),
                Text(
                  "simondr@naver.com",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: accountModel!.emailverify!
                          ? Color.fromRGBO(17, 17, 17, 1)
                          : Colors.red),
                )
              ],
            ),
          ),
          const SizedBox(height: 18),
          GestureDetector(
            onTap: () {
              int t = ref.read(timerProvider);
              if (t == 180) {
                ref.read(authManagerProvider.notifier).sendPasswordOTP();
              }
              // final email = ref.read(userManagerProvider)!.email;
              // print(email);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PasswordOTPScreen()));
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => PasswordUpdateEmailCheckScreen(
              //               email: email.toString(),
              //             )));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("비밀번호 재설정", style: titleStyle),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                )
              ],
            ),
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("연동된 SNS 계정", style: titleStyle),
              Text(
                "Google",
                style: contentStyle,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget deleteAccountButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      color: const Color.fromRGBO(253, 253, 253, 1),
      child: GestureDetector(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CheckPasswordView())),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            "계정해지",
            textAlign: TextAlign.start,
            style: titleStyle,
          ),
        ),
      ),
    );
  }

  void emailDialog(BuildContext context, String email) {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: AlertDialog(
          title: const Text(
            '등록된 이메일 주소',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(17, 17, 17, 1)),
          ),
          content: Text(
            email,
            textAlign: TextAlign.center,
            style: contentStyle,
          ),
          actions: [
            Center(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EmailVerifyScreen()));
                    },
                    child: Text('이메일 인증', style: titleStyle),
                  ),
                  const Divider(
                    color: Color.fromRGBO(234, 234, 234, 1),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EmailUpdateScreen()));
                    },
                    child: Text('이메일 변경', style: titleStyle),
                  ),
                  const Divider(
                    color: Color.fromRGBO(234, 234, 234, 1),
                  ),
                  TextButton(
                    onPressed: () {
                      emailDisconnectDialog(context, email);
                    },
                    child: Text('이메일 연결 해제', style: titleStyle),
                  ),
                  const Divider(
                    color: Color.fromRGBO(234, 234, 234, 1),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('취소', style: titleStyle),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void emailDisconnectDialog(BuildContext context, String email) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Column(
          children: [
            const Text(
              '이메일 연결을 해제하시겠습니까?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(17, 17, 17, 1),
                  height: 2),
            ),
            Text(
              email,
              textAlign: TextAlign.center,
              style: contentStyle,
            ),
          ],
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("연결 해제 시 아래 활동이 불가합니다.",
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w400, height: 3)),
            Text("- 아이디 찾기",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(102, 102, 102, 1),
                    height: 2)),
            Text("- 비밀번호 재설정",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(102, 102, 102, 1),
                    height: 2)),
            Text("- TuneFun 중요 알림 메일 수신",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(102, 102, 102, 1),
                    height: 2)),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: false).pop();
                },
                child: Text('취소', style: titleStyle),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EmailDisconnectView(
                                email: "simondr@naver.com",
                              )));
                },
                child: Text('연결 해제', style: titleStyle),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tunefun_front/common/radius_square_button.dart';
import 'package:tunefun_front/constants/image_constants.dart';

class EmailDisconnectView extends StatelessWidget {
  final String email;
  const EmailDisconnectView({required this.email, super.key});

  static TextStyle textStyle = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 2,
      color: Color.fromRGBO(102, 102, 102, 1));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("이메일 주소 연결 해제"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            int count = 0;
            Navigator.of(context).popUntil((_) => count++ >= 2);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("등록된 이메일 주소", style: textStyle),
            Text(
              email,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
            ),
            const SizedBox(height: 10),
            const Text("이메일 주소 연결을 해제할 시,\n아래와 같은 활동을 진행할 수 없습니다.",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color.fromRGBO(102, 102, 102, 1))),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: const Color.fromRGBO(234, 234, 234, 1))),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(ImageConstants.xIcon),
                      Text('아이디 찾기', style: textStyle),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(ImageConstants.xIcon),
                      Text('비밀번호 재설정', style: textStyle),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(ImageConstants.xIcon),
                      Text(
                        'TuneFun의 중요 정보 및 알림 메시지 수신',
                        style: textStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            RadiusSquareButton(
                buttonState: true, onTap: () {}, buttonText: "이메일 연결 해제")
          ],
        ),
      ),
    );
  }
}

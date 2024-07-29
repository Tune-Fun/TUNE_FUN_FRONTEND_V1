import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tunefun_front/common/radius_square_button.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/features/home/views/home_view.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/auth_manager.dart';

class DeleteAccountFinalView extends ConsumerStatefulWidget {
  const DeleteAccountFinalView({super.key});

  @override
  ConsumerState<DeleteAccountFinalView> createState() =>
      _DeleteAccountFinalViewState();
}

class _DeleteAccountFinalViewState
    extends ConsumerState<DeleteAccountFinalView> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    TextStyle subStyle = const TextStyle(
        color: Color.fromRGBO(102, 102, 102, 1),
        fontWeight: FontWeight.w400,
        height: 2,
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
            Text("주의사항", style: mainStyle),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(234, 234, 234, 1),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.circle,
                        size: 6,
                        color: Color.fromRGBO(102, 102, 102, 1),
                      ),
                      const SizedBox(width: 10),
                      Text("계정이 해지되면 복구할 수 없습니다.", style: subStyle),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.circle,
                        size: 6,
                        color: Color.fromRGBO(102, 102, 102, 1),
                      ),
                      const SizedBox(width: 10),
                      Text("참여 투표 내역, 좋아요 내역 삭제", style: subStyle),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.circle,
                        size: 6,
                        color: Color.fromRGBO(102, 102, 102, 1),
                      ),
                      const SizedBox(width: 10),
                      Text("팔로우 목록 삭제", style: subStyle),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                  child: isChecked
                      ? SvgPicture.asset(ImageConstants.doneColorIcon)
                      : const Icon(Icons.circle_outlined,
                          color: Color.fromRGBO(153, 153, 153, 1)),
                ),
                const SizedBox(width: 5),
                const Text(
                  "주의사항을 확인했으며, 계정해지를 진행합니다.",
                  style: TextStyle(
                      color: Color.fromRGBO(17, 17, 17, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            const SizedBox(height: 50),
            RadiusSquareButton(
                buttonState: isChecked,
                onTap: () async {
                  // 계정 해지 API 호출 성공 시 홈화면으로 이동
                  if (!isChecked) return;
                  // user 정보 초기화
                  ref.read(authManagerProvider.notifier).initAuthState();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
                buttonText: "계정 해지하기")
          ],
        ),
      ),
    );
  }
}

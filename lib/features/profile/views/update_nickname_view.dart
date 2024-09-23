import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tunefun_front/common/radius_square_button.dart';
import 'package:tunefun_front/constants/image_constants.dart';
import 'package:tunefun_front/features/home/views/home_view.dart';
import 'package:tunefun_front/features/profile/views/profile_view.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/auth_manager.dart';

class UpdateNicknameView extends ConsumerStatefulWidget {
  final String nickname;
  final String imageUrl;
  const UpdateNicknameView(
      {required this.nickname, required this.imageUrl, super.key});

  @override
  ConsumerState<UpdateNicknameView> createState() => _UpdateNicknameViewState();
}

class _UpdateNicknameViewState extends ConsumerState<UpdateNicknameView> {
  final TextEditingController nicknameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "닉네임 변경하기",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    final state = ref.watch(authManagerProvider);
    ref.listen<AuthManagerState>(authManagerProvider, (previus, next) {
      if (next is UpdateNicknameSuccess) {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        } else {
          Navigator.pushAndRemoveUntil(
            context,
            HomeScreen.route(),
            (route) => false,
          );
        }
        Fluttertoast.showToast(msg: "닉네임이 변경되었습니다.");
      } else if (next is UpdateNicknameError) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Fluttertoast.showToast(msg: "error ${next.message}");
        });
      }
    });
    if (state is UpdateNicknameLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                  'https://ichef.bbci.co.uk/ace/ws/640/cpsprodpb/7036/production/_111162782__313.jpg'),
            ),
          ),
          Center(
            child: Text(
              widget.nickname,
              style: const TextStyle(
                  color: Color.fromRGBO(17, 17, 17, 1),
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "변경할 사용자 이름",
            style: TextStyle(
                color: Color.fromRGBO(102, 102, 102, 1),
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
          TextFormField(
            controller: nicknameController,
            decoration: InputDecoration(
              hintText: "2자 이상 20자 이내의 닉네임을 입력해주세요.",
              hintStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color.fromRGBO(153, 153, 153, 1)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: nicknameController.text.isEmpty
                      ? const Color.fromRGBO(234, 234, 234, 1)
                      : nicknameController.text.length < 2
                          ? const Color.fromRGBO(233, 20, 20, 1)
                          : const Color.fromRGBO(23, 205, 15, 1),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: nicknameController.text.isEmpty
                      ? const Color.fromRGBO(234, 234, 234, 1)
                      : nicknameController.text.length < 2
                          ? const Color.fromRGBO(233, 20, 20, 1)
                          : const Color.fromRGBO(23, 205, 15, 1),
                  width: 1,
                ),
              ),
            ),
            onChanged: (value) => setState(() {}),
          ),
          const SizedBox(height: 10),
          nicknameController.text.isNotEmpty
              ? nicknameController.text.length > 1
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle_outline_outlined,
                          size: 18,
                          color: Color.fromRGBO(23, 205, 15, 1),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "사용 가능한 닉네임입니다.",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(23, 205, 15, 1),
                          ),
                        )
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(ImageConstants.alertIcon),
                        const SizedBox(width: 5),
                        const Text(
                          "2자 이상 20자 이하로 입력해주세요.",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(233, 20, 20, 1)),
                        )
                      ],
                    )
              : const SizedBox(),
          const SizedBox(height: 30),
          RadiusSquareButton(
              buttonState: nicknameController.text.length > 1 &&
                  nicknameController.text.length <= 20,
              onTap: () async {
                if (nicknameController.text.length > 1 &&
                    nicknameController.text.length <= 20) {
                  await ref
                      .read(authManagerProvider.notifier)
                      .updateNickname(nicknameController.text);
                }
              },
              buttonText: "변경 완료")
        ],
      ),
    );
  }
}

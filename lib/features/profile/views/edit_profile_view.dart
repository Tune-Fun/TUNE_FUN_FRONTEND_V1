import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tunefun_front/constants/gradient_text.dart';
import 'package:tunefun_front/constants/image_constants.dart';
import 'package:tunefun_front/features/profile/views/update_nickname_view.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/user_manager.dart';

class EditProfileView extends ConsumerWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userManagerProvider);
    TextStyle mainStyle = const TextStyle(
        color: Color.fromRGBO(17, 17, 17, 1),
        fontWeight: FontWeight.w700,
        fontSize: 22);
    TextStyle subStyle = const TextStyle(
        color: Color.fromRGBO(102, 102, 102, 1),
        fontWeight: FontWeight.w400,
        fontSize: 14);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        title: const Text(
          "프로필 수정",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    'https://ichef.bbci.co.uk/ace/ws/640/cpsprodpb/7036/production/_111162782__313.jpg'),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.camera_alt,
                          size: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text("사용자 이름", style: subStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${userInfo.nickname}",
                  style: mainStyle,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateNicknameView(
                                nickname: userInfo.nickname.toString(),
                                imageUrl: userInfo.profileImageUrl.toString(),
                              ))),
                  child: const Icon(Icons.edit),
                )
              ],
            ),
            const SizedBox(height: 30),
            Text("사용자 유형", style: subStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(userInfo!.roles![0] == "ARTIST" ? "아티스트 사용자" : "일반 사용자",
                    style: mainStyle),
                GestureDetector(
                  child: GradientText(
                      text: "사용자 전환하기",
                      style: subStyle,
                      gradient: const LinearGradient(colors: [
                        Color.fromRGBO(251, 92, 102, 1),
                        Color.fromRGBO(250, 35, 48, 1)
                      ])),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Divider(
              color: Color.fromRGBO(234, 234, 234, 1),
            ),
            const SizedBox(height: 10),
            Text("SNS 계정 연동하기", style: subStyle),
            const SizedBox(height: 10),
            snsListTile("인스타그램", ImageConstants.youtubeIcon),
            snsListTile("유튜브", ImageConstants.ticktokIcon),
            snsListTile("틱톡", ImageConstants.ticktokIcon),
            snsListTile("X", ImageConstants.twitterIcon),
          ],
        ),
      ),
    );
  }

  Widget snsListTile(String platform, String iconString) {
    return ListTile(
      onTap: () {
        print(iconString);
      },
      contentPadding: EdgeInsets.zero,
      leading: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromRGBO(234, 234, 234, 1),
            ),
            borderRadius: BorderRadius.circular(100)),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: SvgPicture.asset(
            width: 20,
            height: 20,
            iconString,
          ),
        ),
      ),
      title: Text(platform,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        color: Color.fromRGBO(102, 102, 102, 1),
      ),
    );
  }
}

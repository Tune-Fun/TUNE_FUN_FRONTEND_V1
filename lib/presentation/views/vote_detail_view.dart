import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/constants/ui_constants.dart';
import 'package:tunefun_front/features/vote/presentation/%08controller/view_model.dart';
import 'package:tunefun_front/features/vote/presentation/widgets/add_song_box.dart';
import 'package:tunefun_front/features/vote/presentation/widgets/bottom_buttons.dart';
import 'package:tunefun_front/features/vote/presentation/widgets/gradient_container.dart';
import 'package:tunefun_front/theme/pallete.dart';

List<Map<String, dynamic>> dummy = [
  {"artist": "10cm", "song": "gogogo"},
  {"artist": "정승환", "song": "눈사람"},
  {"artist": "10cm", "song": "스토커"},
  {"artist": "이소정", "song": "우린 이제 남이니까"},
  {"artist": "10cm", "song": "폰서트"},
  {"artist": "노라조", "song": "형"},
  {"artist": "노라조", "song": "카레"}
];

class VoteDetailScreen extends ConsumerStatefulWidget {
  const VoteDetailScreen({super.key});

  @override
  ConsumerState<VoteDetailScreen> createState() => _VoteDetailScreenState();
}

class _VoteDetailScreenState extends ConsumerState<VoteDetailScreen> {
  int clickedIndex = -1;
  bool isClicked = false;
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final voteViewModel = ref.watch(voteViewModelProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      String searchSong =
          voteViewModel.filteredSongs[voteViewModel.filteredSongIndex]["song"];
      int songIndex = dummy.indexWhere((song) => song["song"] == searchSong);
      if (songIndex != -1) {
        scrollController.animateTo(songIndex * 40.0,
            duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
      }
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: UIConstants.appBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CircleAvatar(),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'name',
                  style: TextStyle(
                    color: Pallete.textMainColor,
                    fontSize: 15,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              '제목',
              style: TextStyle(
                color: Pallete.textMainColor,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                GradientContainer(
                    height: 13,
                    width: MediaQuery.of(context).size.width * 0.2,
                    borderRadius: BorderRadius.circular(10),
                    type: "fill",
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "13일 ",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            ),
                            TextSpan(
                              text: "남음",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            ),
                          ],
                        ),
                      ),
                    )),
                const SizedBox(
                  width: 9,
                ),
                const Text(
                  "2023. 10. 04 ~ 2023. 10. 05",
                  style: TextStyle(
                    color: Color.fromRGBO(102, 102, 102, 1),
                    fontSize: 14,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            GradientContainer(
                edgetInsets: const EdgeInsets.all(2),
                height: 50,
                width: MediaQuery.of(context).size.width,
                borderRadius: BorderRadius.circular(10),
                type: "contentBox",
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "꽃이 새롭게 피는 계절 마음을 설레게 만드는 산뜻한 봄날! \n 백예린님의 목소리를 통해 봄을 미리 느끼고 싶은 곡에 투표해 주세요!",
                    style: TextStyle(fontSize: 14),
                  ),
                )),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "List",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(17, 17, 17, 1)),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                  controller: scrollController,
                  clipBehavior: Clip.hardEdge,
                  itemCount: dummy.length + 1,
                  itemBuilder: ((context, index) {
                    if (index == 0) {
                      return const Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: AddSongContainer(),
                      );
                    }
                    final itemIndex = index - 1;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          clickedIndex =
                              clickedIndex == itemIndex ? -1 : itemIndex;
                          isClicked = clickedIndex == itemIndex ? true : false;
                        });
                      },
                      child: Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: GradientContainer(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              borderRadius: BorderRadius.circular(10),
                              type:
                                  clickedIndex == itemIndex ? "fill" : "border",
                              child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        dummy[itemIndex]["artist"],
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: clickedIndex == itemIndex
                                                ? const Color.fromRGBO(
                                                    255, 255, 255, 1)
                                                : const Color.fromRGBO(
                                                    17, 17, 17, 1)),
                                      ),
                                      Text(
                                        " - ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: clickedIndex == itemIndex
                                                ? const Color.fromRGBO(
                                                    255, 255, 255, 1)
                                                : const Color.fromRGBO(
                                                    17, 17, 17, 1)),
                                      ),
                                      Text(
                                        dummy[itemIndex]["song"],
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: clickedIndex == itemIndex
                                                ? const Color.fromRGBO(
                                                    255, 255, 255, 1)
                                                : const Color.fromRGBO(
                                                    17, 17, 17, 1)),
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.check_circle_outline_outlined,
                                        color: clickedIndex == itemIndex
                                            ? Colors.white
                                            : Colors.redAccent,
                                      )
                                    ],
                                  )))),
                    );
                  })),
            ),
            BottomButtons(isClicked: isClicked)
          ],
        ),
      ),
    );
  }
}

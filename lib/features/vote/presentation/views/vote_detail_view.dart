import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tunefun_front/constants/image_constants.dart';
import 'package:tunefun_front/constants/ui_constants.dart';
import 'package:tunefun_front/features/vote/presentation/%08controller/view_model.dart';
import 'package:tunefun_front/features/vote/presentation/widgets/bottom_buttons.dart';
import 'package:tunefun_front/features/vote/presentation/widgets/gradient_container.dart';
import 'package:tunefun_front/features/vote/presentation/widgets/search_song_widget.dart';
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
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    final songList = ref.watch(voteViewModelProvider).filteredSongs;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: UIConstants.appBar(),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
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
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              '봄이 다가올 때 듣고 싶은 노래',
              style: TextStyle(
                color: Pallete.textMainColor,
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(55, 65, 81, 1),
                      borderRadius: BorderRadius.circular(12)),
                  child: const Padding(
                    padding:
                        EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
                    child: Text(
                      "13일 남음",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                const Text(
                  "2024.03.03~2024.03.16",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(102, 102, 102, 1)),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(255, 242, 242, 1),
              ),
              child: const Padding(
                padding: EdgeInsets.all(14),
                child: Text(
                  '꽃이 새롭게 피는 계절 마음을 설레게 만드는 산뜻한 봄날! 백예린님의 목소리를 통해 봄을 미리 느끼고 싶은 곡에 투표해 주세요!',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(17, 17, 17, 1)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            isSearch
                ? const SearchSongWidget()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "List",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(17, 17, 17, 1)),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isSearch = true;
                            });
                          },
                          icon: SvgPicture.asset(ImageConstants.searchIcon))
                    ],
                  ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                  clipBehavior: Clip.hardEdge,
                  itemCount: songList.length + 1,
                  itemBuilder: ((context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(153, 153, 153, 1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(255, 255, 255, 1)),
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Icon(Icons.add_circle_outline,
                                    color: Color.fromRGBO(153, 153, 152, 1)),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '노래 추가하여 투표',
                                  style: TextStyle(
                                      color: Color.fromRGBO(153, 153, 153, 1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
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
                          padding: const EdgeInsets.only(bottom: 20),
                          child: GradientContainer(
                              height: 62,
                              edgetInsets: const EdgeInsets.all(1),
                              width: MediaQuery.of(context).size.width,
                              borderRadius: BorderRadius.circular(10),
                              type:
                                  clickedIndex == itemIndex ? "fill" : "border",
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, top: 8, bottom: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        songList[itemIndex]["song"],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: clickedIndex == itemIndex
                                                ? const Color.fromRGBO(
                                                    255, 255, 255, 1)
                                                : const Color.fromRGBO(
                                                    17, 17, 17, 1)),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        songList[itemIndex]["artist"],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: clickedIndex == itemIndex
                                                ? const Color.fromRGBO(
                                                    255, 255, 255, 1)
                                                : const Color.fromRGBO(
                                                    107, 114, 128, 1)),
                                      ),
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/constants/ui_constants.dart';
import 'package:tunefun_front/features/vote/viewModel/view_model.dart';
import 'package:tunefun_front/features/vote/widgets/bottom_buttons.dart';
import 'package:tunefun_front/features/vote/widgets/add_song_box.dart';
import 'package:tunefun_front/features/vote/widgets/gradient_container.dart';
import 'package:tunefun_front/features/vote/widgets/vote_card.dart';
import 'package:tunefun_front/theme/pallete.dart';

class VoteDetailScreen extends ConsumerWidget {
  const VoteDetailScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(voteViewModelProvider.notifier);
    final clickedIndex = ref.watch(clickedIndexProvider);
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
                    width: MediaQuery.of(context).size.width * 0.2,
                    backgroundColor: Colors.redAccent,
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
                width: MediaQuery.of(context).size.width,
                backgroundColor: Colors.white,
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
                  controller: viewModel.scrollController,
                  clipBehavior: Clip.hardEdge,
                  itemCount: viewModel.dummy.length + 1,
                  itemBuilder: ((context, index) {
                    if (viewModel.dummy.length == index) {
                      return const AddSongBox();
                    }
                    return GestureDetector(
                      onTap: () {
                        ref.read(clickedIndexProvider.notifier).state =
                            clickedIndex == index ? null : index;
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: GradientContainer(
                          width: MediaQuery.of(context).size.width,
                          backgroundColor: clickedIndex == index
                              ? Colors.redAccent
                              : Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: VoteBox(
                              index: index,
                              data: viewModel.dummy[index],
                            ),
                          ),
                        ),
                      ),
                    );
                  })),
            ),
            const BottomButtons()
          ],
        ),
      ),
    );
  }
}

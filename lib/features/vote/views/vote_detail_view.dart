import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/constants/ui_constants.dart';
import 'package:tunefun_front/features/vote/viewModel/view_model.dart';
import 'package:tunefun_front/features/vote/widgets/bottom_buttons.dart';
import 'package:tunefun_front/features/vote/widgets/dotted_box.dart';
import 'package:tunefun_front/features/vote/widgets/vote_card.dart';
import 'package:tunefun_front/theme/pallete.dart';

class VoteDetailScreen extends ConsumerWidget {
  const VoteDetailScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('rebuild');
    final viewModel = ref.watch(voteViewModelProvider.notifier);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: UIConstants.appBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
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
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(right: 10, bottom: 15),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text(
                    "1일 남음",
                    style: TextStyle(
                      color: Pallete.textMainColor,
                      fontSize: 15,
                    ),
                  ),
                ),
                const Text(
                  "2023. 10. 04 ~ 2023. 10. 05",
                  style: TextStyle(
                    color: Pallete.textMainColor,
                    fontSize: 15,
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(5)),
              child: const Text("내용"),
            ),
            const SizedBox(
              height: 15,
            ),
            const Center(
              child: Text("List"),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(onTap: () {}, child: const DottedBorderBox()),
            Expanded(
              child: ListView.builder(
                  clipBehavior: Clip.hardEdge,
                  itemCount: viewModel.dummy.length,
                  itemBuilder: ((context, index) {
                    return VoteCard(
                      index: index,
                      data: viewModel.dummy[index],
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

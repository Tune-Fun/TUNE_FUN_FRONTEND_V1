import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/features/vote/viewModel/view_model.dart';
import 'package:tunefun_front/features/vote/widgets/tune_track.dart';
import 'package:tunefun_front/features/vote/widgets/vote_card.dart';

class BottomButtons extends ConsumerWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isClicked = ref.watch(clickedIndexProvider) == null ? false : true;
    final viewModel = ref.watch(voteViewModelProvider.notifier);
    final buttonHeight = MediaQuery.of(context).size.height * 0.1;
    return SizedBox(
      height: buttonHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.ios_share_outlined)),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Votes"), Text("321")],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.heart_broken), Text("321")],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 40),
                  backgroundColor: Colors.green,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: () {
                isClicked
                    ? print("vote")
                    : showModalBottomSheet(
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        context: context,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child:
                                const TuneTrackContainer(buttonType: "search"),
                          );
                        }).then((value) {
                        ref.watch(voteViewModelProvider).isExist = false;
                      }).whenComplete(() {
                        viewModel.scrollController.animateTo(
                            viewModel.resultSongIndex * 60.0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut);
                      });
              },
              child: isClicked ? const Text("투표하기") : const Text("노래검색"))
        ],
      ),
    );
  }
}

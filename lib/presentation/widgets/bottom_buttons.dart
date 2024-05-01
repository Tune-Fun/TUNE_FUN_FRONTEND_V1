import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/features/vote/presentation/widgets/gradient_container.dart';

class BottomButtons extends ConsumerWidget {
  final bool isClicked;
  const BottomButtons({required this.isClicked, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          GestureDetector(
            onTap: () {
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
                          child: Container(),
                        );
                      }).then((value) {
                      // ref.watch(voteViewModelProvider).isExist = false;
                    }).whenComplete(() {
                      // viewModel.scrollController.animateTo(
                      //     viewModel.resultSongIndex * 60.0,
                      //     duration: const Duration(milliseconds: 500),
                      //     curve: Curves.easeOut);
                    });
            },
            child: SizedBox(
                height: 50,
                child: GradientContainer(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.4,
                    borderRadius: BorderRadius.circular(12),
                    type: "fill",
                    child: isClicked
                        ? const Text(
                            textAlign: TextAlign.center,
                            "투표하기",
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          )
                        : const Text(
                            textAlign: TextAlign.center,
                            "노래검색",
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ))),
          )
        ],
      ),
    );
  }
}

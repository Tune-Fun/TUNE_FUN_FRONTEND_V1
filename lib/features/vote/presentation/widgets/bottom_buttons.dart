import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tunefun_front/constants/image_constants.dart';
import 'package:tunefun_front/features/vote/presentation/widgets/gradient_container.dart';

class BottomButtons extends ConsumerWidget {
  final bool isClicked;
  const BottomButtons({required this.isClicked, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonHeight = MediaQuery.of(context).size.height * 0.1;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: SizedBox(
        height: buttonHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(ImageConstants.shareNetworkIcon),
                const SizedBox(height: 10),
                const Text("공유하기")
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(ImageConstants.pollIcon),
                const SizedBox(height: 10),
                const Text("321")
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(ImageConstants.heartIcon),
                const SizedBox(height: 10),
                const Text("321")
              ],
            ),
            GestureDetector(
                onTap: () {
                  // isClicked ? print("vote")
                  // : showModalBottomSheet(
                  //     isScrollControlled: true,
                  //     shape: const RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.zero),
                  //     context: context,
                  //     builder: (BuildContext context) {
                  //       return Padding(
                  //         padding: MediaQuery.of(context).viewInsets,
                  //         child:
                  //             const TuneTrackContainer(buttonType: "search"),
                  //       );
                  //     }).then((value) {
                  //     // ref.watch(voteViewModelProvider).isExist = false;
                  //   }).whenComplete(() {
                  //     // viewModel.scrollController.animateTo(
                  //     //     viewModel.resultSongIndex * 60.0,
                  //     //     duration: const Duration(milliseconds: 500),
                  //     //     curve: Curves.easeOut);
                  //   });
                },
                child: SizedBox(
                    height: 50,
                    child: GradientContainer(
                        edgetInsets: const EdgeInsets.all(2),
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 50,
                        borderRadius: BorderRadius.circular(12),
                        type: isClicked ? "fill" : "border",
                        child: Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            "투표",
                            style: TextStyle(
                                color: isClicked
                                    ? const Color.fromRGBO(255, 255, 255, 1)
                                    : const Color.fromRGBO(251, 92, 102, 1),
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        )))),
          ],
        ),
      ),
    );
  }
}

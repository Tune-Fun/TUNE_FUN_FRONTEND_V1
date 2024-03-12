import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/features/vote/viewModel/view_model.dart';

class TuneTrackContainer extends ConsumerStatefulWidget {
  final String buttonType;
  const TuneTrackContainer({required this.buttonType, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TuneTrackContainerState();
}

class _TuneTrackContainerState extends ConsumerState<TuneTrackContainer> {
  final artistTextController = TextEditingController();
  final songTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final boxWidth = MediaQuery.of(context).size.width * 0.35;
    final viewModel = ref.watch(voteViewModelProvider);
    return Container(
        padding: const EdgeInsets.only(top: 30),
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Expanded(flex: 1, child: SizedBox()),
                const Expanded(
                  flex: 2,
                  child: Text(
                    textAlign: TextAlign.center,
                    "노래검색",
                    style: TextStyle(
                        color: Color.fromRGBO(17, 17, 17, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (!viewModel.isExist) return;
                            songTextController.text = ref
                                .read(voteViewModelProvider.notifier)
                                .nextSong;
                            // ref.read(clickedIndexProvider.notifier).state =
                            //     viewModel.resultSongIndex;
                          },
                          icon: const Icon(Icons.arrow_circle_left_outlined),
                        ),
                        IconButton(
                            onPressed: () {
                              if (!viewModel.isExist) return;
                              songTextController.text = ref
                                  .read(voteViewModelProvider.notifier)
                                  .nextSong;
                              // ref.read(clickedIndexProvider.notifier).state =
                              //     viewModel.resultSongIndex;
                            },
                            icon:
                                const Icon(Icons.arrow_circle_right_outlined)),
                      ],
                    )),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: boxWidth,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: TextFormField(
                      controller: artistTextController,
                      textInputAction: TextInputAction.search,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(255, 242, 242, 1),
                        hintText: "아티스트 이름",
                        contentPadding: EdgeInsets.all(8),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(234, 234, 234, 1))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(251, 92, 102, 1))),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1)),
                      ),
                      onFieldSubmitted: (value) {
                        ref
                            .read(voteViewModelProvider.notifier)
                            .searchSongsByArtist(value);
                        if (!ref.read(voteViewModelProvider.notifier).isExist) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                    content: const Text(
                                      "검색된 아티스트가 없습니다.",
                                      textAlign: TextAlign.center,
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8)));
                              });
                          songTextController.clear();
                        } else {
                          artistTextController.text = value;
                          viewModel.searchSongsByArtist(value);
                          songTextController.text = viewModel.currentSong;
                          // ref.read(clickedIndexProvider.notifier).state =
                          //     viewModel.resultSongIndex;
                        }
                      },
                    )),
                SizedBox(
                  width: boxWidth,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: TextFormField(
                    controller: songTextController,
                    textInputAction: TextInputAction.search,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(255, 242, 242, 1),
                      hintText: "노래 제목",
                      contentPadding: EdgeInsets.all(8),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(234, 234, 234, 1))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(251, 92, 102, 1))),
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1)),
                    ),
                    onFieldSubmitted: (value) {},
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

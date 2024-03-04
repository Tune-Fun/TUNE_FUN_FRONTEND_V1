import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/features/vote/viewModel/view_model.dart';
import 'package:tunefun_front/features/vote/widgets/vote_card.dart';

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "노래검색",
                  style: TextStyle(color: Colors.green, fontSize: 18),
                ),
                viewModel.isExist
                    ? IconButton(
                        onPressed: () {
                          songTextController.text =
                              ref.read(voteViewModelProvider.notifier).nextSong;
                          ref.read(clickedIndexProvider.notifier).state =
                              viewModel.resultSongIndex;
                        },
                        icon: const Icon(Icons.keyboard_arrow_left_outlined),
                      )
                    : const SizedBox(),
                viewModel.isExist
                    ? IconButton(
                        onPressed: () {
                          songTextController.text =
                              ref.read(voteViewModelProvider.notifier).nextSong;
                          ref.read(clickedIndexProvider.notifier).state =
                              viewModel.resultSongIndex;
                        },
                        icon: const Icon(Icons.keyboard_arrow_right_outlined))
                    : const SizedBox(),
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
                    child: SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: artistTextController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: "아티스트 이름",
                          contentPadding: EdgeInsets.all(8),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                        ),
                        onFieldSubmitted: (value) {
                          ref
                              .read(voteViewModelProvider.notifier)
                              .searchSongsByArtist(value);
                          if (!ref
                              .read(voteViewModelProvider.notifier)
                              .isExist) {
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
                            ref.read(clickedIndexProvider.notifier).state =
                                viewModel.resultSongIndex;
                          }
                        },
                      ),
                    )),
                SizedBox(
                  width: boxWidth,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: TextFormField(
                    controller: songTextController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: "노래 제목",
                      contentPadding: EdgeInsets.all(8),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                    onFieldSubmitted: (value) {
                      // ref
                      //     .read(voteViewModelProvider.notifier)
                      //     .selectArtist(value);
                      // if (ref
                      //         .read(voteViewModelProvider.notifier)
                      //         .selectedArtistIndex ==
                      //     -1) {
                      //   showDialog(
                      //       context: context,
                      //       builder: (context) {
                      //         return AlertDialog(
                      //             content: const Text(
                      //               "검색된 아티스트가 없습니다.",
                      //               textAlign: TextAlign.center,
                      //             ),
                      //             shape: RoundedRectangleBorder(
                      //                 borderRadius: BorderRadius.circular(8)));
                      //       });
                      //   songTextController.clear();
                      // } else {
                      //   artistTextController.text = value;
                      //   dynamic test = viewModel.searchSongsByArtist(value);
                      //   print(test);
                      // }
                    },
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

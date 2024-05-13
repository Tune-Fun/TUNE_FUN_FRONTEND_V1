import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tunefun_front/features/vote/presentation/%08controller/vote_controller.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_test_model.dart';

class UploadAddSongWidget extends ConsumerWidget {
  const UploadAddSongWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<SongInfo> songs = ref.watch(songListProvider);

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        for (int i = 0; i < songs.length; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      showSearch(
                        context: context,
                        delegate: SongSearchDelegate((result) {
                          var parts = result.split(' - ');
                          ref
                              .read(songListProvider.notifier)
                              .updateSongEntry(i, parts[0], parts[1]);
                        }),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.green)),
                      child: Text(songs[i].artistName.isNotEmpty &&
                              songs[i].songName.isNotEmpty
                          ? '${songs[i].artistName} - ${songs[i].songName}'
                          : '아티스트 명 또는 노래 제목 입력'),
                    ),
                  )),
              if (songs.length > 2)
                IconButton(
                  onPressed: () =>
                      ref.read(songListProvider.notifier).removeSongEntry(i),
                  icon: const Icon(Icons.remove_circle),
                ),
            ],
          ),
        IconButton(
          onPressed: () => ref.read(songListProvider.notifier).addSongEntry(
              SongInfo(artistName: '', songName: '', songImage: '')),
          icon: const Icon(Icons.add_circle_outline_outlined),
        ),
      ],
    );
  }
}

class SongSearchDelegate extends SearchDelegate {
  final Function(String) onResultSelect;

  SongSearchDelegate(this.onResultSelect);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return const Center(child: Text("검색어를 입력해 주세요"));
    }
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(songSearchProvider);

        if (state is SongSearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SongSearchSuccess) {
          return ListView.builder(
            itemCount: state.songs.length,
            itemBuilder: (context, index) {
              final song = state.songs[index];
              return ListTile(
                leading: Image.network(song.songImage),
                title: Text(song.songName),
                subtitle: Text(song.artistName),
                onTap: () {
                  if (ref
                      .read(songListProvider.notifier)
                      .checkDuplicate(song)) {
                    onResultSelect('${song.artistName} - ${song.songName}');
                    close(context, null);
                  } else {
                    Fluttertoast.showToast(msg: "이미 추가된 노래입니다.");
                  }
                },
              );
            },
          );
        } else if (state is SongSearchError) {
          return Text(state.message);
        } else {
          return TextButton(
            onPressed: () {
              ref.read(songSearchProvider.notifier).searchSongs(query);
            },
            child: Text('Search Songs'),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox();
  }
}

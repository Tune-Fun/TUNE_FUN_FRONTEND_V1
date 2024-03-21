import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tunefun_front/core/failure.dart';
import 'package:tunefun_front/features/vote/%08controller/upload_controller.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_test_model.dart';

class UploadAddSongWidget extends ConsumerWidget {
  const UploadAddSongWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<SongInfo> songs = ref.watch(uploadSongListProvider);

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
                              .read(uploadSongListProvider.notifier)
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
                  onPressed: () => ref
                      .read(uploadSongListProvider.notifier)
                      .removeSongEntry(i),
                  icon: const Icon(Icons.remove_circle),
                ),
            ],
          ),
        IconButton(
          onPressed: () =>
              ref.read(uploadSongListProvider.notifier).addSongEntry(),
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
        return FutureBuilder<Either<Failure, List<SongInfo>>>(
          future: ref.read(uploadSongListProvider.notifier).searchList(query),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('오류가 발생했습니다: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return snapshot.data!.fold(
                (left) {
                  return Text('검색 실패: ${left.toString()}');
                },
                (right) {
                  final songs = right;
                  return ListView.builder(
                    itemCount: songs.length,
                    itemBuilder: (context, index) {
                      final song = songs[index];
                      return ListTile(
                        title: Text('${song.artistName} - ${song.songName}'),
                        onTap: () => onResultSelect(
                            '${song.artistName} - ${song.songName}'),
                      );
                    },
                  );
                },
              );
            } else {
              return const Text('검색 결과가 없습니다.');
            }
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox();
  }
}

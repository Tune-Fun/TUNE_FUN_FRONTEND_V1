import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_test_model.dart';
import 'package:tunefun_front/features/vote/presentation/%08controller/vote_controller.dart';
import 'package:tunefun_front/features/vote/presentation/widgets/gradient_container.dart';
import 'package:tunefun_front/features/vote/presentation/widgets/search_spotify_widget.dart';

class UploadSongWidget extends ConsumerWidget {
  const UploadSongWidget({super.key});

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
                      onTap: () async {
                        final SongInfo? result = await Navigator.push<SongInfo>(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const SearchFromSpotifyWidget(type: 'upload'),
                          ),
                        );
                        if (result != null) {
                          ref
                              .read(songListProvider.notifier)
                              .updateSongEntry(i, result);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: GradientContainer(
                          type: "contentBox",
                          width: MediaQuery.of(context).size.width,
                          height: songs[i].artist_name.isEmpty ? 60 : 70,
                          borderRadius: BorderRadius.circular(10),
                          child: ListTile(
                            contentPadding: const EdgeInsets.only(left: 12),
                            leading: songs[i].music_image.isEmpty
                                ? null
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(songs[i].music_image)),
                            title: Text(
                              songs[i].artist_name.isNotEmpty
                                  ? songs[i].music
                                  : "아티스트 이름 또는 노래 제목 입력",
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(102, 102, 102, 1)),
                            ),
                            subtitle: Text(
                              songs[i].artist_name.isNotEmpty
                                  ? songs[i].artist_name
                                  : "",
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(102, 102, 102, 1)),
                            ),
                            trailing: songs.length > 2
                                ? IconButton(
                                    onPressed: () => ref
                                        .read(songListProvider.notifier)
                                        .removeSongEntry(i),
                                    icon: const Icon(
                                      Icons.remove_circle_outline,
                                      color: Color.fromRGBO(102, 102, 102, 1),
                                    ),
                                    padding: EdgeInsets.zero,
                                  )
                                : null,
                          ),
                        ),
                      ))),
            ],
          ),
        Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(color: const Color.fromRGBO(229, 231, 235, 1))),
            child: IconButton(
              onPressed: () => ref.read(songListProvider.notifier).addSongEntry(
                    SongInfo(
                        id: '', artist_name: '', music: '', music_image: ''),
                  ),
              icon: const Icon(
                Icons.add,
                color: Color.fromRGBO(102, 102, 102, 1),
              ),
            )),
      ],
    );
  }
}

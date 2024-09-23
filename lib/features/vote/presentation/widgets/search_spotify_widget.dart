import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/constants/ui_constants.dart';
import 'package:tunefun_front/features/vote/presentation/%08controller/vote_controller.dart';
import 'package:tunefun_front/theme/pallete.dart';

class SearchFromSpotifyWidget extends ConsumerWidget {
  final String type;
  const SearchFromSpotifyWidget({required this.type, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songSearchState = ref.watch(songSearchProvider);

    return Scaffold(
      appBar: UIConstants.basicAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: Column(
            children: [
              SizedBox(
                height: 40,
                child: TextField(
                  autofocus: false,
                  onChanged: (query) {
                    ref.read(songSearchProvider.notifier).searchSongs(query);
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "검색",
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 12),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Pallete.borderColor,
                        width: 3,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Pallete.borderColor,
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (songSearchState is SongSearchSuccess)
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Pallete.bgSubColor,
                    ),
                    child: ListView.separated(
                      itemCount: songSearchState.songs.length,
                      itemBuilder: ((context, index) {
                        final song = songSearchState.songs[index];
                        return ListTile(
                          leading: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(song.music_image)),
                          title: Text(song.music),
                          subtitle: Text(song.artist_name),
                          onTap: () {
                            if (type == 'voteDetail') {
                              print('222');
                              ref
                                  .read(voteViewModelProvider.notifier)
                                  .addVoteSong(song);
                            } else if (type == 'upload') {
                              Navigator.pop(context, song);
                            }
                          },
                        );
                      }),
                      separatorBuilder: (context, index) => const Divider(
                        color: Colors.white,
                      ),
                    ))
              else
                songSearchState is SongSearchLoading
                    ? const CircularProgressIndicator()
                    : songSearchState is SongSearchError
                        ? Text(songSearchState.message)
                        : const Text('검색어를 입력해 주세요.'),
            ],
          ),
        ),
      ),
    );
  }
}

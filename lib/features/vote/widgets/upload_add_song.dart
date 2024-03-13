import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/features/vote/viewModel/upload_controller.dart';

class UploadAddSongWidget extends ConsumerWidget {
  const UploadAddSongWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songs = ref.watch(songsProvider);
    return Column(
      children: [
        ...songs.asMap().entries.map((entry) {
          int index = entry.key;
          SongEntry songEntry = entry.value;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.05,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: songEntry.artistController,
                  decoration: const InputDecoration(
                    hintText: '아티스트 이름',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.05,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: songEntry.songController,
                  decoration: const InputDecoration(
                    hintText: '노래 제목',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                  ),
                ),
              ),
              if (songs.length > 2)
                Expanded(
                  child: IconButton(
                    icon: const Icon(
                      Icons.remove_circle,
                      color: Colors.red,
                    ),
                    onPressed: () =>
                        ref.read(songsProvider.notifier).removeSongEntry(index),
                  ),
                ),
            ],
          );
        }).toList(),
        Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
          ),
          child: IconButton(
            onPressed: () => ref.read(songsProvider.notifier).addSongEntry(),
            icon: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}

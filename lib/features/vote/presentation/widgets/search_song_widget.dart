import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/features/vote/presentation/%08controller/view_model.dart';
import 'package:tunefun_front/theme/pallete.dart';

class SearchSongWidget extends ConsumerWidget {
  const SearchSongWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchTextController = TextEditingController();
    return SizedBox(
      height: 50,
      child: TextField(
        controller: searchTextController,
        onChanged: (value) {
          ref.read(voteViewModelProvider).searchSong(searchTextController.text);
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            onPressed: () {
              searchTextController.clear();
              ref
                  .read(voteViewModelProvider)
                  .searchSong(searchTextController.text);
            },
            icon: const Icon(Icons.cancel),
          ),
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
    );
  }
}

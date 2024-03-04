import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clickedIndexProvider = StateProvider<int?>((ref) => null);

class VoteCard extends ConsumerWidget {
  final int index;
  final Map<String, dynamic> data;
  const VoteCard({required this.index, required this.data, super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clickedIndex = ref.watch(clickedIndexProvider);
    return Material(
      child: GestureDetector(
          onTap: () {
            ref.read(clickedIndexProvider.notifier).state =
                clickedIndex == index ? null : index;
          },
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width,
            child: Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(data["artist"]),
                    const Text(" - "),
                    Text(data["song"]),
                    const Spacer(),
                    clickedIndex == index
                        ? const Icon(Icons.check)
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

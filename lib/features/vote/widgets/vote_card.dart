import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clickedIndexProvider = StateProvider<int?>((ref) => null);

class VoteBox extends ConsumerWidget {
  final int index;
  final Map<String, dynamic> data;
  const VoteBox({required this.index, required this.data, super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clickedIndex = ref.watch(clickedIndexProvider);
    return Row(
      children: [
        Text(
          data["artist"],
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: clickedIndex == index
                  ? const Color.fromRGBO(255, 255, 255, 1)
                  : const Color.fromRGBO(17, 17, 17, 1)),
        ),
        Text(
          " - ",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: clickedIndex == index
                  ? const Color.fromRGBO(255, 255, 255, 1)
                  : const Color.fromRGBO(17, 17, 17, 1)),
        ),
        Text(
          data["song"],
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: clickedIndex == index
                  ? const Color.fromRGBO(255, 255, 255, 1)
                  : const Color.fromRGBO(17, 17, 17, 1)),
        ),
        const Spacer(),
        Icon(
          Icons.check_circle_outline_outlined,
          color: clickedIndex == index ? Colors.white : Colors.redAccent,
        )
      ],
    );
  }
}

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:tunefun_front/features/vote/widgets/tune_track.dart';

class DottedBorderBox extends StatelessWidget {
  const DottedBorderBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            context: context,
            builder: (BuildContext context) {
              return const TuneTrackContainer(buttonType: "add");
            });
      },
      child: Card(
        color: Colors.white,
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(5),
          padding: const EdgeInsets.all(6),
          dashPattern: const [8, 4],
          strokeWidth: 2,
          color: Colors.black,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Container(
              padding: const EdgeInsets.only(top: 10, left: 10),
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: const Text('노래 추가하여 투표...'),
            ),
          ),
        ),
      ),
    );
  }
}

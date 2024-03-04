import 'package:flutter/material.dart';
import 'package:tunefun_front/features/vote/widgets/gradient_container.dart';
import 'package:tunefun_front/features/vote/widgets/tune_track.dart';

class AddSongBox extends StatelessWidget {
  const AddSongBox({super.key});

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
      child: GradientContainer(
        width: MediaQuery.of(context).size.width,
        backgroundColor: Colors.white,
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [
              Icon(Icons.add_circle_outline,
                  color: Color.fromRGBO(153, 153, 152, 1)),
              SizedBox(
                width: 5,
              ),
              Text(
                '원하는 곡이 없다면 추가해주세요!',
                style: TextStyle(
                    color: Color.fromRGBO(153, 153, 152, 1),
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

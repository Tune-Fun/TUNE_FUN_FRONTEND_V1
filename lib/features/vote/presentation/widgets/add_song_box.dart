import 'package:flutter/material.dart';
import 'package:tunefun_front/features/vote/presentation/widgets/gradient_container.dart';

class AddSongContainer extends StatelessWidget {
  const AddSongContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            context: context,
            builder: (BuildContext context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(),
              );
            });
      },
      child: GradientContainer(
        height: 50,
        edgetInsets: const EdgeInsets.all(2),
        width: MediaQuery.of(context).size.width,
        borderRadius: BorderRadius.circular(10),
        type: "border",
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

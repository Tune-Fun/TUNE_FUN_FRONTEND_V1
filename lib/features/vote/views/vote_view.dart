import 'package:flutter/material.dart';
import 'package:tunefun_front/constants/ui_constants.dart';
import 'package:tunefun_front/features/vote/widgets/bottom_buttons.dart';
import 'package:tunefun_front/theme/pallete.dart';

class VoteDetailScreen extends StatefulWidget {
  const VoteDetailScreen({super.key});

  @override
  State<VoteDetailScreen> createState() => _VoteDetailScreenState();
}

class _VoteDetailScreenState extends State<VoteDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIConstants.appBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        CircleAvatar(),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'name',
                          style: TextStyle(
                            color: Pallete.textMainColor,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      '제목',
                      style: TextStyle(
                        color: Pallete.textMainColor,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(right: 10, bottom: 15),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Text(
                            "1일 남음",
                            style: TextStyle(
                              color: Pallete.textMainColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const Text(
                          "2023. 10. 04 ~ 2023. 10. 05",
                          style: TextStyle(
                            color: Pallete.textMainColor,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(5)),
                      child: const Text("내용"),
                    ),
                  ]),
            )),
            const BottomButtons()
          ],
        ),
      ),
    );
  }
}

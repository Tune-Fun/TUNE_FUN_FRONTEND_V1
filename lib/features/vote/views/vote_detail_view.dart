import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/constants/ui_constants.dart';
import 'package:tunefun_front/features/vote/widgets/bottom_buttons.dart';
import 'package:tunefun_front/features/vote/widgets/dotted_box.dart';
import 'package:tunefun_front/theme/pallete.dart';

final selectedListItemProvider = StateProvider<int?>((ref) => null);

class VoteDetailScreen extends StatefulWidget {
  const VoteDetailScreen({super.key});

  @override
  State<VoteDetailScreen> createState() => _VoteDetailScreenState();
}

final dummyData = [
  "정승환 - 눈사람",
  "이소정 - 우린 이제 남이니까",
  "10cm - 폰서트",
  "Lauv - Paris in the rain"
];

class _VoteDetailScreenState extends State<VoteDetailScreen> {
  int? clickedIndex;
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      appBar: UIConstants.appBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
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
                    const SizedBox(
                      height: 15,
                    ),
                    const Center(
                      child: Text("List"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                        onTap: () {}, child: const DottedBorderBox()),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: dummyData.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (clickedIndex == index) {
                                  isClicked = false;
                                  clickedIndex = null;
                                  return;
                                }
                                isClicked = true;
                                clickedIndex = index;
                              });
                            },
                            child: ListTile(
                              title: Text(dummyData[index]),
                              trailing: clickedIndex == index
                                  ? const Icon(Icons.check)
                                  : null,
                            ),
                          );
                        }))
                  ]),
            )),
            BottomButtons(isClicked: isClicked)
          ],
        ),
      ),
    );
  }
}

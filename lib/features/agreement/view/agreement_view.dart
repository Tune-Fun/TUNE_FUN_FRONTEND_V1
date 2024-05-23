import 'package:flutter/material.dart';
import 'package:tunefun_front/constants/dummy_data.dart';

class AgreementScreen extends StatelessWidget {
  const AgreementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double containerHeight = MediaQuery.of(context).size.height * 0.2;
    const int itemCount = 3;
    const double paddingVertical = 1.0;
    const double dividerHeight = 1.0;

    final double itemHeight = (containerHeight -
            (paddingVertical * 2 * itemCount) -
            (dividerHeight * (itemCount - 1))) /
        itemCount;
    List agreementData = DummyData.agreementData;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "약관 및 정책",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Container(
          height: containerHeight,
          decoration: BoxDecoration(
              border: Border.all(color: const Color.fromRGBO(234, 234, 234, 1)),
              borderRadius: BorderRadius.circular(8)),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  print(agreementData[index]["id"]);
                },
                child: SizedBox(
                  height: itemHeight,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(agreementData[index]["title"],
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400)),
                        const Icon(Icons.arrow_forward_ios_outlined)
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Divider(height: dividerHeight),
            ),
            itemCount: itemCount,
          ),
        ),
      ),
    );
  }
}

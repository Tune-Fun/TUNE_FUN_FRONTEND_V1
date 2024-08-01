import 'package:flutter/material.dart';
import 'package:tunefun_front/constants/setting_data.dart';
import 'package:tunefun_front/features/setting/view/inquiry/inquiry_detail_view.dart';

class InquiryScreen extends StatelessWidget {
  const InquiryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List inquiryData = SettingData.inquiryData;
    return Scaffold(
        backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
        appBar: AppBar(
          title: const Text(
            "이용 문의",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 110,
          color: const Color.fromRGBO(255, 255, 255, 1),
          child: Column(
            children: [
              const SizedBox(height: 20),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            InquiryDetailView(data: inquiryData[0]))),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "문의 작성",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(17, 17, 17, 1)),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Color.fromRGBO(102, 102, 102, 1),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "문의 내역",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(17, 17, 17, 1)),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Color.fromRGBO(102, 102, 102, 1),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

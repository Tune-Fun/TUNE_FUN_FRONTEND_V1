import 'package:flutter/material.dart';

class CustomerServiceView extends StatelessWidget {
  const CustomerServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
        appBar: AppBar(
          title: const Text(
            "고객센터",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "고객센터 이메일",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color.fromRGBO(17, 17, 17, 1)),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: const Color.fromRGBO(234, 234, 234, 1))),
                child: const Text(
                  "qwer@email",
                  style: TextStyle(
                      color: Color.fromRGBO(102, 102, 102, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ));
  }
}

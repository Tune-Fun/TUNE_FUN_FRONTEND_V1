import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InquiryDetailScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const InquiryDetailScreen({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          data['title'],
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    switch (data['type']) {
      case 'writeInquiry':
        return _writeInquiry(context);
      case 'inquiryList':
        return _inquiryList();
      default:
        return const SizedBox();
    }
  }

  Widget _writeInquiry(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "카테고리",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            const SizedBox(height: 100),
            const Text(
              "문의 내용",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextField(
              textInputAction: TextInputAction.done,
              maxLines: 8,
              maxLength: 100,
              decoration: InputDecoration(
                hintText: '문의 내용',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.05,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: const Color.fromRGBO(75, 85, 99, 1)),
                    onPressed: () {},
                    child: const Text(
                      "문의 등록",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )))
          ],
        ),
      ),
    );
  }

  Widget _inquiryList() {
    return Container();
  }
}

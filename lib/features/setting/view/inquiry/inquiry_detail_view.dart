import 'package:flutter/material.dart';
import 'package:tunefun_front/common/radius_square_button.dart';

class InquiryDetailView extends StatefulWidget {
  final Map<String, dynamic> data;
  const InquiryDetailView({required this.data, super.key});

  @override
  State<InquiryDetailView> createState() => _InquiryDetailViewState();
}

class _InquiryDetailViewState extends State<InquiryDetailView> {
  List<String> inquiryCategories = [
    '투표 게재 관련',
    '투표 참여 관련',
    '결제/구독/환불 관련',
    '회원 정보 관련',
    '이용 불편 사항',
    '기타'
  ];
  String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      appBar: AppBar(
        title: Text(
          widget.data['title'],
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    switch (widget.data['type']) {
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
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Color.fromRGBO(17, 17, 17, 1)),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () async {
                // categoryList(context);
                final category = await _showInquiryDialog(
                    context, inquiryCategories, selectedCategory);
                if (category != null) {
                  setState(() {
                    selectedCategory = category;
                  });
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(color: const Color.fromRGBO(234, 234, 234, 1)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedCategory ?? "카테고리 선택",
                      style: const TextStyle(
                          color: Color.fromRGBO(102, 102, 102, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Color.fromRGBO(102, 102, 102, 1),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "문의 내용",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Color.fromRGBO(17, 17, 17, 1)),
            ),
            const SizedBox(height: 10),
            TextField(
              textInputAction: TextInputAction.done,
              maxLines: 8,
              maxLength: 100,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromRGBO(255, 255, 255, 1),
                hintText: '문의 내용',
                enabledBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromRGBO(234, 234, 234, 1)),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 100),
            RadiusSquareButton(
                buttonState: true, onTap: () {}, buttonText: "문의등록"),
          ],
        ),
      ),
    );
  }

  Future<String?> _showInquiryDialog(BuildContext context,
      List<String> inquiryCategories, String? selectedString) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        String selectedCategory = selectedString ?? inquiryCategories[0];
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
              content: SingleChildScrollView(
                child: ListBody(
                  children: inquiryCategories.map((category) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RadioListTile<String>(
                          activeColor: const Color.fromRGBO(102, 102, 102, 1),
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            category,
                            style: const TextStyle(
                                color: Color.fromRGBO(17, 17, 17, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.trailing,
                          value: category,
                          groupValue: selectedCategory,
                          onChanged: (String? value) {
                            setState(() {
                              selectedCategory = value!;
                              Navigator.of(context).pop(selectedCategory);
                            });
                          },
                        ),
                        if (category != inquiryCategories.last)
                          const Divider(
                            height: 1.0,
                            thickness: 1.0,
                          ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _inquiryList() {
    return Container();
  }
}

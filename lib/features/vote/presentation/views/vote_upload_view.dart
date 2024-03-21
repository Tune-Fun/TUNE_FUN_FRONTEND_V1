import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/constants/ui_constants.dart';
import 'package:tunefun_front/features/vote/%08controller/upload_controller.dart';
import 'package:tunefun_front/features/vote/presentation/widgets/upload_add_song.dart';

class VoteUploadScreen extends ConsumerStatefulWidget {
  const VoteUploadScreen({super.key});

  @override
  ConsumerState<VoteUploadScreen> createState() => VoteUploadScreenState();
}

class VoteUploadScreenState extends ConsumerState<VoteUploadScreen> {
  final titleTextController = TextEditingController();
  final contentTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool option = false;
  DateTime initialDay = DateTime.now();
  @override
  void dispose() {
    titleTextController.dispose();
    contentTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final uploadController = ref.read(uploadSongListProvider.notifier);
    return Scaffold(
      appBar: UIConstants.appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("제목"),
                TextFormField(
                  controller: titleTextController,
                  maxLength: 20,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "제목을 입력해 주세요";
                    }
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(234, 234, 234, 1))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 1)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: contentTextController,
                  maxLines: 4,
                  maxLength: 100,
                  decoration: const InputDecoration(
                    hintText: "문구를 작성하세요..",
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(234, 234, 234, 1))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 1)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("옵션 선택"),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      option = false;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 12, right: 4, top: 12),
                    height: 140,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: option
                                ? const Color.fromRGBO(170, 170, 170, 1)
                                : const Color.fromRGBO(152, 234, 122, 1)),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(1)),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "참여자가 직접 추가",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Text(
                            "1. 아티스트가 사전에 리스트 추가 불가능 \n2. 참여자가 노래 추가 가능 \n3. 참여자는 리스트에 올라와 있는 노래 중 투표를 진행하거나 직접 노래를 추가하여 투표 진행")
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      option = true;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 12, right: 4, top: 12),
                    height: 140,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: option
                                ? const Color.fromRGBO(152, 234, 122, 1)
                                : const Color.fromRGBO(170, 170, 170, 1)),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(1)),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "아티스트가 사전 추가",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Text(
                            "1. 아티스트가 사전에 리스트 추가 가능 \n2. 참여자가 노래 추가 불가능 \n3. 참여자는 아티스트가 사전에 리스트에 올려놓은 노래 중 투표 진행")
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                if (option) const UploadAddSongWidget(),
                Column(
                  children: [
                    const Text("투표 진행 시간"),
                    const Text("종료 일자 / 시간"),
                    TextButton(
                        onPressed: () async {
                          final DateTime? dateTime = await showDatePicker(
                              context: context,
                              initialDate: initialDay,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(3000));
                          if (dateTime != null) {
                            setState(() {
                              initialDay = dateTime;
                            });
                          }
                        },
                        child: Text(
                            '${initialDay.year} - ${initialDay.month} - ${initialDay.day}'))
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        uploadController.uploadVote(
                          titleTextController.text,
                          contentTextController.text,
                          option,
                          ref.read(uploadSongListProvider),
                          initialDay,
                        );
                      }
                    },
                    child: const Text("투표 게재"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

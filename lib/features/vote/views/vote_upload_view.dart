import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/constants/ui_constants.dart';
import 'package:tunefun_front/features/vote/viewModel/upload_controller.dart';
import 'package:tunefun_front/features/vote/widgets/upload_add_song.dart';

class VoteUploadScreen extends ConsumerWidget {
  const VoteUploadScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final option = ref.watch(optionProvider);
    return Scaffold(
      appBar: UIConstants.appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("제목"),
              TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  // fillColor: Color.fromRGBO(255, 242, 242, 1),
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(234, 234, 234, 1))),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(251, 92, 102, 1))),
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: "문구를 작성하세요..",
                  filled: true,
                  // fillColor: Color.fromRGBO(255, 242, 242, 1),
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(234, 234, 234, 1))),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(251, 92, 102, 1))),
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
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
                onTap: () => ref.read(optionProvider.notifier).state = false,
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
                onTap: () => ref.read(optionProvider.notifier).state = true,
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
              if (option)
                Visibility(
                    visible: option,
                    maintainState: true,
                    child: const UploadAddSongWidget()),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text("1234"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

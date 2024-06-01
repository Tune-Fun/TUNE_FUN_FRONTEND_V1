import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tunefun_front/constants/ui_constants.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_test_model.dart';
import 'package:tunefun_front/features/vote/presentation/%08controller/vote_controller.dart';
import 'package:tunefun_front/features/vote/presentation/widgets/gradient_container.dart';
import 'package:tunefun_front/features/vote/presentation/widgets/upload_add_song.dart';

class VoteUploadScreen extends ConsumerStatefulWidget {
  const VoteUploadScreen({super.key});

  @override
  ConsumerState<VoteUploadScreen> createState() => _VoteUploadScreenState();
}

class _VoteUploadScreenState extends ConsumerState<VoteUploadScreen> {
  final titleTextController = TextEditingController();
  final contentTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool option = false;
  bool musicCountValid = true;
  DateTime initialDay = DateTime.now();
  TimeOfDay initialTime = TimeOfDay.now();

  @override
  void dispose() {
    titleTextController.dispose();
    contentTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: UIConstants.appBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: _buildForm(context),
          ),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    final songs = ref.watch(songListProvider);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(titleTextController, "제목", "제목을 입력해 주세요", 20),
          const SizedBox(height: 20),
          _buildTextField(contentTextController, "문구를 작성하세요..", null, 100,
              maxLines: 4),
          const SizedBox(height: 20),
          _buildOptionSelection(),
          const SizedBox(height: 20),
          if (option) const UploadSongWidget(),
          if (!musicCountValid) _buildValidationMessage(),
          const SizedBox(height: 20),
          _buildDateSection(),
          const SizedBox(height: 15),
          _buildPostButton(songs),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText,
      String? validationMessage, int maxLength,
      {int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      maxLength: maxLength,
      maxLines: maxLines,
      autofocus: false,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(8),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Color.fromRGBO(234, 234, 234, 1)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      validator: (value) => value!.isEmpty ? validationMessage : null,
    );
  }

  Widget _buildOptionSelection() {
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() {
            option = false;
            musicCountValid = true;
          }),
          child: GradientContainer(
            type: "uploadTypeBox",
            option: option,
            edgetInsets: !option ? const EdgeInsets.all(1) : null,
            borderRadius: BorderRadius.circular(8),
            height: 140,
            width: MediaQuery.of(context).size.width,
            child: _optionText("참여자가 직접 추가",
                "1. 아티스트가 사전에 리스트 추가 불가능 \n2. 참여자가 노래 추가 가능 \n3. 참여자는 리스트에 올라와 있는 노래 중 투표를 진행하거나 직접 노래를 추가하여 투표 진행"),
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () => setState(() {
            option = true;
          }),
          child: GradientContainer(
            type: 'uploadTypeBox',
            option: !option,
            edgetInsets: option ? const EdgeInsets.all(1) : null,
            borderRadius: BorderRadius.circular(8),
            height: 140,
            width: MediaQuery.of(context).size.width,
            child: _optionText("아티스트가 사전 추가",
                "1. 아티스트가 사전에 리스트 추가 가능 \n2. 참여자가 노래 추가 불가능 \n3. 참여자는 아티스트가 사전에 리스트에 올려놓은 노래 중 투표 진행"),
          ),
        ),
      ],
    );
  }

  Widget _optionText(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500)),
          const SizedBox(height: 5),
          Text(content,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(102, 102, 102, 1))),
        ],
      ),
    );
  }

  Widget _buildValidationMessage() {
    return const Align(
      alignment: Alignment.topRight,
      child: Text(
        "최소 2개의 노래를 입력해주세요",
        style: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w500, color: Colors.red),
      ),
    );
  }

  Widget _buildDateSection() {
    String formatDate(DateTime date) {
      return DateFormat('yy.MM.dd').format(date);
    }

    String formatTime(TimeOfDay time) {
      final localizations = MaterialLocalizations.of(context);
      return localizations.formatTimeOfDay(time, alwaysUse24HourFormat: false);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "투표 진행 기간",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.12,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: const Color.fromRGBO(229, 231, 235, 1))),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 12, left: 12, right: 14),
                    width: 60,
                    height: 20,
                    child: const Text(
                      "종료 일자",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    height: 30,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                              color: Color.fromRGBO(156, 163, 175, 1)),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          final DateTime? dateTime = await showDatePicker(
                              context: context,
                              initialDate: initialDay,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(3000));
                          if (dateTime != null) {
                            setState(() {
                              initialDay = dateTime;
                            });
                          }
                        },
                        child: Row(
                          children: [
                            Text(
                              formatDate(initialDay),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Colors.black),
                            ),
                            const SizedBox(width: 10),
                            const Icon(Icons.keyboard_arrow_down,
                                color: Colors.black)
                          ],
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 12, left: 12, right: 14),
                    width: 60,
                    height: 20,
                    child: const Text(
                      "시간",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 12, bottom: 10),
                    height: 30,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                              color: Color.fromRGBO(156, 163, 175, 1)),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          final TimeOfDay? pickedTime = await showTimePicker(
                              context: context, initialTime: initialTime);
                          if (pickedTime != null) {
                            setState(() {
                              initialTime = pickedTime;
                            });
                          }
                        },
                        child: Row(
                          children: [
                            Text(
                              formatTime(initialTime),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Colors.black),
                            ),
                            const SizedBox(width: 10),
                            const Icon(Icons.keyboard_arrow_down,
                                color: Colors.black)
                          ],
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPostButton(List<SongInfo> songs) {
    return GestureDetector(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          if (!validateSongListCount(songs)) {
            setState(() {
              musicCountValid = false;
            });
          } else {
            setState(() {
              musicCountValid = true;
            });
            showUploadDialog(songs);
          }
        }
      },
      child: GradientContainer(
        width: MediaQuery.of(context).size.width,
        height: 40,
        borderRadius: BorderRadius.circular(10),
        type: "fill",
        child: const Center(
          child: Text(
            "투표 게재",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
      ),
    );
  }

  void showUploadDialog(final songs) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(
            '투표를 게재하시겠습니까?',
            style: TextStyle(fontSize: 14, height: 3),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextButton(
                    child:
                        const Text('취소', style: TextStyle(color: Colors.black)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Expanded(
                  child: TextButton(
                    child:
                        const Text('계속', style: TextStyle(color: Colors.red)),
                    onPressed: () {
                      DateTime fullDateTime = DateTime(
                        initialDay.year,
                        initialDay.month,
                        initialDay.day,
                        initialTime.hour,
                        initialTime.minute,
                      );
                      String endedAt = DateFormat('yyyy-MM-dd HH:mm:ss')
                          .format(fullDateTime);
                      String startedAt = DateFormat('yyyy-MM-dd HH:mm:ss')
                          .format(DateTime.now());
                      String options =
                          option ? "deny-add-choices" : "allow-add-choices";
                      ref.read(uploadProvider.notifier).uploadVote(
                          titleTextController.text,
                          contentTextController.text,
                          options,
                          songs,
                          startedAt,
                          endedAt);
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  bool validateSongListCount(List<SongInfo> songs) {
    if (songs
            .where((song) =>
                song.id.isNotEmpty &&
                song.artist_name.isNotEmpty &&
                song.music.isNotEmpty)
            .length <
        2) {
      return false;
    }
    return true;
  }
}

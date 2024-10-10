import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tunefun_front/constants/image_constants.dart';
import 'package:tunefun_front/constants/ui_constants.dart';
import 'package:tunefun_front/features/vote/domain/model/upload_test_model.dart';
import 'package:tunefun_front/features/vote/presentation/manager/vote_upload_manager.dart';
import 'package:tunefun_front/features/vote/presentation/widgets/bottom_buttons.dart';
import 'package:tunefun_front/features/vote/presentation/widgets/gradient_container.dart';
import 'package:tunefun_front/features/vote/presentation/widgets/search_song_widget.dart';
import 'package:tunefun_front/features/vote/presentation/widgets/search_spotify_widget.dart';
import 'package:tunefun_front/theme/pallete.dart';

List<SongInfo> dummy = [
  SongInfo(
      id: '',
      artist_name: '10cm',
      music: 'gogogo',
      music_image:
          'https://i.scdn.co/image/ab67616d00004851dae4a1ab4a717a3341a47ff6'),
  SongInfo(
      id: '',
      artist_name: '정승환',
      music: '눈사람',
      music_image:
          'https://i.scdn.co/image/ab67616d00004851dae4a1ab4a717a3341a47ff6'),
  SongInfo(
      id: '',
      artist_name: '10cm',
      music: '스토커',
      music_image:
          'https://i.scdn.co/image/ab67616d00004851dae4a1ab4a717a3341a47ff6'),
  SongInfo(
      id: '',
      artist_name: '이소정',
      music: '우린 이제 남이니까',
      music_image:
          'https://i.scdn.co/image/ab67616d00004851dae4a1ab4a717a3341a47ff6'),
  SongInfo(
      id: '',
      artist_name: '10cm',
      music: '폰서트',
      music_image:
          'https://i.scdn.co/image/ab67616d00004851dae4a1ab4a717a3341a47ff6'),
  SongInfo(
      id: '',
      artist_name: '노라조',
      music: '카레',
      music_image:
          'https://i.scdn.co/image/ab67616d00004851dae4a1ab4a717a3341a47ff6'),
];

class VoteDetailScreen extends ConsumerStatefulWidget {
  const VoteDetailScreen({super.key});

  @override
  ConsumerState<VoteDetailScreen> createState() => _VoteDetailScreenState();
}

class _VoteDetailScreenState extends ConsumerState<VoteDetailScreen> {
  int clickedIndex = -1;
  bool isClicked = false;
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    final songList = ref.watch(voteViewModelProvider).filteredSongs;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: UIConstants.basicAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildHeader(),
                    const SizedBox(height: 12),
                    buildTitle(),
                    const SizedBox(height: 12),
                    buildCountdownRow(),
                    const SizedBox(height: 12),
                    buildDescription(),
                    const SizedBox(height: 12),
                    buildSearchToggle(),
                    const SizedBox(height: 12),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      padding: const EdgeInsets.only(bottom: 60),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: songList.length + 1,
                        itemBuilder: (context, index) => index == 0
                            ? buildAddSongButton()
                            : buildSongListItem(songList[index - 1], index - 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomButtons(isClicked: isClicked)
        ],
      ),
    );
  }

  Widget buildHeader() {
    return const Row(
      children: [
        CircleAvatar(),
        SizedBox(width: 10),
        Text('name',
            style: TextStyle(
                color: Pallete.textMainColor,
                fontWeight: FontWeight.w500,
                fontSize: 18))
      ],
    );
  }

  Widget buildTitle() {
    return const Text(
      '봄이 다가올 때 듣고 싶은 노래',
      style: TextStyle(
          color: Pallete.textMainColor,
          fontWeight: FontWeight.w700,
          fontSize: 22),
    );
  }

  Widget buildCountdownRow() {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.2,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(55, 65, 81, 1),
              borderRadius: BorderRadius.circular(12)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Text("13일 남음",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
          ),
        ),
        const SizedBox(width: 12),
        const Text("2024.03.03~2024.03.16",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(102, 102, 102, 1)))
      ],
    );
  }

  Widget buildDescription() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(234, 234, 234, 1)),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white),
      child: const Padding(
        padding: EdgeInsets.all(14),
        child: Text(
          '꽃이 새롭게 피는 계절 마음을 설레게 만드는 산뜻한 봄날! 백예린님의 목소리를 통해 봄을 미리 느끼고 싶은 곡에 투표해 주세요!',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(17, 17, 17, 1)),
        ),
      ),
    );
  }

  Widget buildSearchToggle() {
    return isSearch
        ? const SearchSongWidget()
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("List",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(17, 17, 17, 1))),
              IconButton(
                  onPressed: () => setState(() => isSearch = true),
                  icon: SvgPicture.asset(ImageConstants.searchIcon))
            ],
          );
  }

  Widget buildSongList(List<SongInfo> songList) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: songList.length + 1,
      itemBuilder: (context, index) => index == 0
          ? buildAddSongButton()
          : buildSongListItem(songList[index - 1], index - 1),
    );
  }

  Widget buildAddSongButton() {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const SearchFromSpotifyWidget(type: 'voteDetail'))),
      child: Container(
        height: 50,
        margin: const EdgeInsets.only(bottom: 12),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(153, 153, 153, 1)),
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(255, 255, 255, 1)),
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [
              Icon(Icons.add_circle_outline,
                  color: Color.fromRGBO(153, 153, 152, 1)),
              SizedBox(width: 5),
              Text('노래 추가하여 투표',
                  style: TextStyle(
                      color: Color.fromRGBO(153, 153, 153, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSongListItem(SongInfo song, int index) {
    bool isSelected = clickedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          clickedIndex = clickedIndex == index ? -1 : index;
          isClicked = clickedIndex == index ? true : false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: isSelected
            ? selectedSongContainer(song)
            : unselectedSongContainer(song),
      ),
    );
  }

  Widget selectedSongContainer(SongInfo song) {
    return GradientContainer(
      height: 70,
      edgetInsets: const EdgeInsets.all(1),
      width: MediaQuery.of(context).size.width,
      borderRadius: BorderRadius.circular(10),
      type: "votePaperClicked",
      child: songListTile(song),
    );
  }

  Widget unselectedSongContainer(SongInfo song) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(234, 234, 234, 1)),
          borderRadius: BorderRadius.circular(10)),
      child: songListTile(song),
    );
  }

  ListTile songListTile(SongInfo song) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(song.music_image),
      ),
      title: Text(song.music,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(17, 17, 17, 1))),
      subtitle: Text(song.artist_name,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(107, 114, 128, 1))),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tunefun_front/constants/dummy_data.dart';
import 'package:tunefun_front/constants/image_constants.dart';
import 'package:tunefun_front/features/article/widgets/article_card.dart';
import 'package:tunefun_front/features/profile/views/edit_profile_view.dart';
import 'package:tunefun_front/features/setting/view/setting_main_view.dart';
import 'package:tunefun_front/models/article_model.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/user_manager.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const ProfileScreen());
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    final isArtist = ref.read(userManagerProvider).roles!.contains("ARTIST");
    _tabController = TabController(length: isArtist ? 4 : 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = ref.watch(userManagerProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            profileCard(context),
            const SizedBox(
              height: 30,
            ),
            TabBar(
              unselectedLabelColor: const Color.fromRGBO(102, 102, 102, 1),
              labelColor: Colors.black,
              controller: _tabController,
              tabs: [
                const Tab(
                  icon: Icon(Icons.chrome_reader_mode_outlined),
                ),
                if (userInfo.roles!.contains("ARTIST"))
                  Tab(
                    child: SvgPicture.asset(ImageConstants.pollIcon),
                  ),
                const Tab(icon: Icon(Icons.check_circle_outline)),
                const Tab(icon: Icon(Icons.favorite_border)),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      List<ArticleModel> articles = DummyData.articles;
                      return ArticleCard(article: articles[index]);
                    },
                  ),
                  Container(),
                  Container(),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget profileCard(BuildContext context) {
    final userInfo = ref.watch(userManagerProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(
                    'https://ichef.bbci.co.uk/ace/ws/640/cpsprodpb/7036/production/_111162782__313.jpg'),
              ),
              IconButton(
                  onPressed: () {
                    print(userInfo.emailverify);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const SettingMainView()));
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: Color.fromRGBO(102, 102, 102, 1),
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${userInfo.nickname}",
                style: const TextStyle(
                    color: Color.fromRGBO(17, 17, 17, 1),
                    fontWeight: FontWeight.w700,
                    fontSize: 22),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromRGBO(102, 102, 102, 1)),
                          borderRadius: BorderRadius.circular(100))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfileView()));
                  },
                  child: const Text(
                    "프로필 수정",
                    style: TextStyle(
                        color: Color.fromRGBO(102, 102, 102, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ))
            ],
          ),
          const SizedBox(height: 10),
          // 계정 연동 된 플랫폼 위젯
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromRGBO(234, 234, 234, 1),
                          ),
                          borderRadius: BorderRadius.circular(100)),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: SvgPicture.asset(
                          width: 20,
                          height: 20,
                          ImageConstants.ticktokIcon,
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

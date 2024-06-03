import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tunefun_front/common/show_snack_bar.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/constants/image_constants.dart';
import 'package:tunefun_front/features/auth/controllers/auth_controller.dart';
import 'package:tunefun_front/theme/theme.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static MaterialPageRoute route() => MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _page = 0;
  String iconState = '';

  void onPageChanged(int index) {
    setState(() {
      _page = index;
    });

    if (index == 3 && ref.read(userControllerProvider) == null) {
      showSnackBar(context, '로그인을 먼저 해야 합니다.');
      // 페이지 변경을 막기 위해 이전 페이지로 돌아갑니다.
      setState(() {
        _page = 0;
      });
    }
  }

  void onIconStateChanged(String state) {
    setState(() {
      iconState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIConstants.appBar(),
      body: IndexedStack(
        index: _page,
        children: UIConstants.bottomTapBarPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        onTap: onPageChanged,
        backgroundColor: Pallete.bgMainColor,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _page == 0
                    ? ImageConstants.homeActiveIcon
                    : ImageConstants.homeIcon,
              ),
              label: "홈화면"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _page == 1
                    ? ImageConstants.addActiveIcon
                    : ImageConstants.uploadIcon,
              ),
              label: "업로드"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _page == 2
                    ? ImageConstants.followActiveIcon
                    : ImageConstants.followIcon,
              ),
              label: "팔로우"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _page == 3
                    ? ImageConstants.profileActiveIcon
                    : ImageConstants.profileIcon,
              ),
              label: "프로필"),
        ],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

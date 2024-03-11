import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/common/show_snack_bar.dart';
import 'package:tunefun_front/constants/constants.dart';
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
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _page,
        onTap: onPageChanged,
        backgroundColor: Pallete.bgMainColor,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
            ),
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
            ),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                onPageChanged(3);
              },
              icon: const Icon(
                Icons.person,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

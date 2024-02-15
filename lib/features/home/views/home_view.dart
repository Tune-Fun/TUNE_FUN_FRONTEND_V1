import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tunefun_front/constants/image_constants.dart';
import 'package:tunefun_front/constants/ui_constants.dart';
import 'package:tunefun_front/theme/pallete.dart';

class HomeScreen extends StatefulWidget {
  static MaterialPageRoute route() => MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;

  void onPageChanged(int index) {
    setState(() {
      _page = index;
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
          BottomNavigationBarItem(
            icon: SvgPicture.asset(ImageConstants.peopleOutlinedIcon),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(ImageConstants.profileOutlinedIcon),
          ),
        ],
      ),
    );
  }
}

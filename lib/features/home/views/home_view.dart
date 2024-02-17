import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/theme/theme.dart';

class HomeScreen extends StatefulWidget {
  static MaterialPageRoute route() => MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  String iconState = '';

  void onPageChanged(int index) {
    setState(() {
      _page = index;
    });
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
          ),
        ],
      ),
    );
  }
}

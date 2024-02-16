import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tunefun_front/constants/image_constants.dart';
import 'package:tunefun_front/constants/ui_constants.dart';
import 'package:tunefun_front/features/home/widgets/search_text_field.dart';
import 'package:tunefun_front/theme/pallete.dart';

class HomeScreen extends StatefulWidget {
  static MaterialPageRoute route() => MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String iconState = '';
  int _page = 0;

  void onPageChanged(int index) {
    setState(() {
      _page = index;
    });
  }

  void onButtonClicked(String state) {
    setState(() {
      iconState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIConstants.appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    onButtonClicked('search');
                  },
                  icon: SvgPicture.asset(
                    ImageConstants.searchIcon,
                    height: 18,
                    width: 18,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    onButtonClicked('sort');
                  },
                  icon: SvgPicture.asset(
                    ImageConstants.sortIcon,
                    height: 18,
                    width: 12,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: _page,
              children: UIConstants.bottomTapBarPages,
            ),
          ),
        ],
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

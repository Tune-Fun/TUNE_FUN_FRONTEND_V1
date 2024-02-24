import 'package:flutter/material.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonHeight = MediaQuery.of(context).size.height * 0.1;
    return SizedBox(
      height: buttonHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.ios_share_outlined)),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Votes"), Text("321")],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.heart_broken), Text("321")],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 40),
                  backgroundColor: Colors.green,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: () {},
              child: Text("노래검색"))
        ],
      ),
    );
  }
}

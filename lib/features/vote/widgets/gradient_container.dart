import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final double width;
  final Widget child;
  final Color backgroundColor;
  const GradientContainer(
      {required this.width,
      required this.child,
      required this.backgroundColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(250, 92, 102, 1),
            Color.fromRGBO(250, 35, 48, 1)
          ]),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.all(2),
        width: width,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: child,
      ),
    );
  }
}

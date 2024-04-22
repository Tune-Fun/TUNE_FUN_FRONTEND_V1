import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final double width;
  final BorderRadius borderRadius;
  final Widget child;
  final String type;
  const GradientContainer(
      {required this.width,
      required this.borderRadius,
      required this.child,
      required this.type,
      super.key});

  @override
  Widget build(BuildContext context) {
    Widget innerContainer;
    switch (type) {
      case "fill":
        innerContainer = Container(
          margin: const EdgeInsets.all(2),
          width: width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: child,
        );
        break;
      case "contentBox":
        innerContainer = Container(
          margin: const EdgeInsets.all(2),
          width: width,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 242, 242, 1),
            borderRadius: borderRadius,
          ),
          child: child,
        );
        break;
      case "border":
        innerContainer = Container(
          margin: const EdgeInsets.all(2),
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: borderRadius,
          ),
          child: child,
        );
        break;
      default:
        innerContainer = Container();
        break;
    }

    return Container(
      width: width,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Color.fromRGBO(250, 92, 102, 1),
          Color.fromRGBO(250, 35, 48, 1),
        ]),
        borderRadius: borderRadius,
      ),
      alignment: Alignment.center,
      child: innerContainer,
    );
  }
}

import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final Widget child;
  final String type;
  final EdgeInsetsGeometry? edgetInsets;
  final bool? option;
  const GradientContainer(
      {required this.width,
      required this.height,
      required this.borderRadius,
      required this.child,
      required this.type,
      this.edgetInsets,
      this.option,
      super.key});

  @override
  Widget build(BuildContext context) {
    Widget innerContainer;
    switch (type) {
      case "votePaperClicked":
        innerContainer = Container(
          height: height,
          margin: edgetInsets,
          width: width,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 242, 242, 1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: child,
        );
        break;
      case "fill":
        innerContainer = Container(
          height: height,
          margin: edgetInsets,
          width: width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: child,
        );
        break;
      case "contentBox":
        innerContainer = Container(
          height: height,
          margin: edgetInsets,
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
          height: height,
          margin: edgetInsets,
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: borderRadius,
          ),
          child: child,
        );
        break;
      case "uploadTypeBox":
        innerContainer = Container(
          height: height,
          margin: edgetInsets,
          width: width,
          decoration: BoxDecoration(
              border: option!
                  ? Border.all(color: const Color.fromRGBO(156, 163, 175, 1))
                  : null,
              color: Colors.white,
              borderRadius: borderRadius),
          child: child,
        );
      default:
        innerContainer = Container();
        break;
    }

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Color.fromRGBO(251, 92, 102, 1),
          Color.fromRGBO(250, 35, 48, 1),
        ]),
        borderRadius: borderRadius,
      ),
      alignment: Alignment.center,
      child: innerContainer,
    );
  }
}

import 'package:flutter/material.dart';

class CircleCheckButton extends StatefulWidget {
  final bool isChecked;
  final Function(bool)? onChanged;

  const CircleCheckButton({
    super.key,
    required this.isChecked,
    this.onChanged,
  });

  @override
  State<CircleCheckButton> createState() => _CircleCheckButtonState();
}

class _CircleCheckButtonState extends State<CircleCheckButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.onChanged != null) {
          widget.onChanged!(!widget.isChecked);
        }
      },
      child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: widget.isChecked ? Colors.red : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.red,
              width: 2,
            ),
          ),
          child: Icon(
            Icons.check,
            size: 16,
            color: widget.isChecked ? Colors.white : Colors.red,
          )),
    );
  }
}

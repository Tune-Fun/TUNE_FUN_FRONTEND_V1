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
          shape: BoxShape.circle,
          border: Border.all(
            color: widget.isChecked ? Colors.green : Colors.grey,
            width: 2,
          ),
        ),
        child: widget.isChecked
            ? const Icon(
                Icons.check,
                size: 16,
                color: Colors.green,
              )
            : SizedBox(), // 체크되지 않은 경우 빈 SizedBox 반환
      ),
    );
  }
}

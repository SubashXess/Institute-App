import 'package:flutter/material.dart';
import '../constants/boxshadow.dart';

class RoundedButtonWidget extends StatelessWidget {
  const RoundedButtonWidget({
    Key? key,
    required this.size,
    this.color,
    required this.label,
     this.onTap,
  }) : super(key: key);

  final Size size;

  final Color? color;
  final Widget label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        width: size.width,
        height: size.height * 0.064,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: color,
            boxShadow: [
              AppBoxShadow.s0BoxShadow(color: Colors.black.withOpacity(0.08)),
            ]),
        child: Center(
          child: label,
        ),
      ),
    );
  }
}

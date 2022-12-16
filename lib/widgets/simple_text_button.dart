import 'package:flutter/material.dart';

import '../constants/textstyles.dart';
import '../constants/themes.dart';

class SimpleTextButton extends StatelessWidget {
  const SimpleTextButton({
    Key? key,
    required this.size,
    required this.label,
    required this.onTap, required this.alignment,
  }) : super(key: key);

  final Size size;
  final String label;
  final VoidCallback onTap;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Text(
          label,
          style: AppTextStyle.h4TextStyle(
            color: AppTheme.appThemeColor,
            fontWeight: FontWeight.w500,
            size: 14.0,
          ),
        ),
      ),
    );
  }
}

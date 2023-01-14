import 'package:flutter/material.dart';
import 'package:institute_app/constants/textstyles.dart';

import '../constants/themes.dart';

class CustomRadioButton<T> extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.value,
    this.groupValue,
    required this.title,
    required this.onChanged,
    required this.selected,
  });

  final T value;
  final T? groupValue;
  final String title;
  final Function(T?) onChanged;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<T>(
      value: value,
      groupValue: groupValue,
      activeColor: AppTheme.appThemeColor,
      contentPadding: EdgeInsets.zero,
      dense: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      title: Text(title,
          style: AppTextStyle.h4TextStyle(fontWeight: FontWeight.w500)),
      onChanged: onChanged,
    );
  }
}

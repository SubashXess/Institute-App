import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:institute_app/constants/textstyles.dart';
import '../constants/themes.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    Key? key,
    required this.hint,
    required this.controller,
    required this.node,
    this.maxLength,
    required this.autovalidateMode,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.autofillHints,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType,
    this.onChanged,
    this.validator,
    this.textInputAction,
    required this.fillColor,
  }) : super(key: key);

  final String hint;
  final TextEditingController controller;
  final FocusNode node;
  final int? maxLength;
  final AutovalidateMode autovalidateMode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final List<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppTheme.appThemeColor,
      controller: controller,
      focusNode: node,
      autovalidateMode: autovalidateMode,
      autofillHints: autofillHints,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      obscuringCharacter: '\u25CF',
      maxLength: maxLength,
      textInputAction: textInputAction,
      style: AppTextStyle.h4TextStyle(fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        hintText: hint,
        isDense: true,
        counterText: '',
        filled: true,
        fillColor: fillColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle: AppTextStyle.h4TextStyle(
            color: Colors.grey.shade400, fontWeight: FontWeight.w500),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(width: 1.0, color: Colors.red.shade200),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(width: 1.0, color: Colors.red.shade600),
        ),
      ),
    );
  }
}

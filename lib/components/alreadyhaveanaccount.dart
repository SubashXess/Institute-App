import 'package:flutter/material.dart';
import 'package:institute_app/constants/textstyles.dart';
import 'package:institute_app/constants/themes.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function() onTap;
  const AlreadyHaveAnAccountCheck(
      {Key? key, this.login = true, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(login ? 'Don\'t have an account? ' : 'Already have an account? ',
            style: AppTextStyle.h4TextStyle(fontWeight: FontWeight.w400)),
        GestureDetector(
          onTap: onTap,
          child: Text(login ? 'Sign up' : 'Sign in',
              style: AppTextStyle.h4TextStyle(
                  fontWeight: FontWeight.w700, color: AppTheme.appThemeColor)),
        ),
      ],
    );
  }
}

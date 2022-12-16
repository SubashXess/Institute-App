import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/dimensions.dart';
import '../../constants/textstyles.dart';
import '../../constants/themes.dart';
import '../../utilities/validators.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/textform_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late FocusNode _emailNode;
  bool _autovalidateMode = false;
  bool _isLoading = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _emailNode = FocusNode()..addListener(onListen);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _emailNode.dispose();
    super.dispose();
  }

  void onListen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverSafeArea(
            sliver: SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: size.width,
                      height: size.height / 2.8,
                      child: SvgPicture.asset(
                        'assets/svg/questions-bro.svg',
                        fit: BoxFit.contain,
                        placeholderBuilder: (BuildContext context) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                    ),
                    SizedBox(
                      width: size.width,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Forgot\nPassword?',
                                style: AppTextStyle.h0TextStyle()),
                            SizedBox(height: size.height * 0.012),
                            Text(
                                'Don\'t worry! It happens. Please enter the email address associated with your account.',
                                style: AppTextStyle.h4TextStyle(
                                    size: 15.0,
                                    fontWeight: FontWeight.w400,
                                    color: AppTextTheme.appTextThemeLight)),
                            SizedBox(height: size.height * 0.026),
                            TextFormWidget(
                              hint: 'Email ID',
                              controller: _emailController,
                              node: _emailNode,
                              autofillHints: const [AutofillHints.email],
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              maxLength: 60,
                              fillColor: _emailNode.hasFocus
                                  ? AppTheme.appThemeColor.withOpacity(0.08)
                                  : AppTextFieldTheme.appTextFieldTheme,
                              autovalidateMode: _autovalidateMode
                                  ? AutovalidateMode.onUserInteraction
                                  : AutovalidateMode.disabled,
                              prefixIcon: Icon(
                                Icons.email_rounded,
                                size: AppIconDimensions.appIconSystemSize,
                                color: _emailNode.hasFocus
                                    ? AppTheme.appThemeColor
                                    : Colors.grey.shade400,
                              ),
                              validator: (value) =>
                                  FormValidators.emailValidation(value!.trim()),
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                            SizedBox(height: size.height * 0.024),
                            RoundedButtonWidget(
                              size: size,
                              label: _isLoading
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          width: 16.0,
                                          height: 16.0,
                                          child: CircularProgressIndicator
                                              .adaptive(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.white),
                                          ),
                                        ),
                                        const SizedBox(width: 10.0),
                                        Text(
                                          'Submitting...',
                                          style: AppTextStyle.h3TextStyle(
                                            size: 14.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Text(
                                      'Submit',
                                      style: AppTextStyle.h3TextStyle(
                                        size: 14.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                              color: AppTheme.appThemeColor,
                              onTap: _isLoading
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        log('Success');
                                        _emailNode.unfocus();
                                        setState(() {
                                          _autovalidateMode = false;
                                          _isLoading = true;
                                        });
                                        Navigator.pushNamed(context,
                                                '/email_forgot_password_verification_page')
                                            .then((value) => setState(
                                                () => _isLoading = false));
                                      } else {
                                        log('Error');
                                        setState(() {
                                          _autovalidateMode = true;
                                        });
                                      }
                                    },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.064),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text('I remember the password',
                          style: AppTextStyle.h4TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppTheme.appThemeColor.withOpacity(0.8))),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

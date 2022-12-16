// ignore_for_file: avoid_print

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:institute_app/components/alreadyhaveanaccount.dart';
import 'package:institute_app/constants/dimensions.dart';
import 'package:institute_app/constants/textstyles.dart';
import 'package:institute_app/constants/themes.dart';
import 'package:institute_app/utilities/validators.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/simple_text_button.dart';
import '../../widgets/textform_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  late FocusNode _emailNode;
  late FocusNode _passwordNode;

  bool _isPasswordVisible = true;
  bool _isLoading = false;
  bool _autovalidateMode = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailNode = FocusNode()..addListener(onListen);
    _passwordNode = FocusNode()..addListener(onListen);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailNode.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  void onListen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('reload page');
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverSafeArea(
              bottom: true,
              top: true,
              sliver: SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: size.width,
                        height: size.height / 2.8,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: SvgPicture.asset(
                          'assets/svg/book-lover-bro.svg',
                          fit: BoxFit.contain,
                          placeholderBuilder: (BuildContext context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                      ),
                      Container(
                        width: size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Sign in',
                                  style: AppTextStyle.h0TextStyle()),
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
                                    FormValidators.emailValidation(
                                        value!.trim()),
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ),
                              SizedBox(height: size.height * 0.016),
                              TextFormWidget(
                                hint: 'Password',
                                controller: _passwordController,
                                node: _passwordNode,
                                obscureText: _isPasswordVisible,
                                autofillHints: const [AutofillHints.password],
                                keyboardType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.done,
                                maxLength: 16,
                                fillColor: _passwordNode.hasFocus
                                    ? AppTheme.appThemeColor.withOpacity(0.08)
                                    : AppTextFieldTheme.appTextFieldTheme,
                                autovalidateMode: _autovalidateMode
                                    ? AutovalidateMode.onUserInteraction
                                    : AutovalidateMode.disabled,
                                prefixIcon: Icon(
                                  Icons.lock_rounded,
                                  size: AppIconDimensions.appIconSystemSize,
                                  color: _passwordNode.hasFocus
                                      ? AppTheme.appThemeColor
                                      : Colors.grey.shade400,
                                ),
                                suffixIcon: _passwordController.text.isEmpty
                                    ? Container(width: 0.0)
                                    : GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _isPasswordVisible =
                                                !_isPasswordVisible;
                                          });
                                        },
                                        child: Icon(
                                          _isPasswordVisible
                                              ? Icons.visibility_off
                                              : Icons.visibility_rounded,
                                          size: AppIconDimensions
                                              .appIconSystemSize,
                                          color: _passwordNode.hasFocus
                                              ? AppTheme.appThemeColor
                                              : Colors.grey.shade400,
                                        ),
                                      ),
                                validator: (value) =>
                                    FormValidators.passwordValidation(value!),
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ),
                              SizedBox(height: size.height * 0.024),
                              SimpleTextButton(
                                alignment: Alignment.centerRight,
                                size: size,
                                label: 'Forgot password?',
                                onTap: () => Navigator.pushNamed(
                                    context, '/forgot_password_page'),
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
                                            'Sign in',
                                            style: AppTextStyle.h3TextStyle(
                                              size: 14.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      )
                                    : Text(
                                        'Sign in',
                                        style: AppTextStyle.h3TextStyle(
                                          size: 14.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                color: AppTheme.appThemeColor,
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    log('Success');
                                    _emailNode.unfocus();
                                    _passwordNode.unfocus();
                                    setState(() {
                                      _autovalidateMode = false;
                                      _isLoading = !_isLoading;
                                    });
                                  } else {
                                    log('Error');
                                    setState(() {
                                      _autovalidateMode = true;
                                    });
                                  }
                                },
                              ),
                              SizedBox(height: size.height * 0.016),
                              RoundedButtonWidget(
                                size: size,
                                color: AppContainerTheme.appContainerGreyTheme,
                                label: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: 20.0,
                                        height: 20.0,
                                        child: SvgPicture.asset(
                                            'assets/svg/google.svg')),
                                    const SizedBox(width: 10.0),
                                    Text(
                                      'Sign in with Google',
                                      style: AppTextStyle.h3TextStyle(
                                        size: 14.0,
                                        color: Colors.grey.shade700,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.064),
                      AlreadyHaveAnAccountCheck(
                        login: true,
                        onTap: () =>
                            Navigator.pushNamed(context, '/signup_page'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

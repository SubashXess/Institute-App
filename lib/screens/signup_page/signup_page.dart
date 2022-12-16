import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:institute_app/constants/textstyles.dart';
import '../../components/alreadyhaveanaccount.dart';
import '../../constants/dimensions.dart';
import '../../constants/themes.dart';
import '../../utilities/validators.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/textform_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  late FocusNode _nameNode;
  late FocusNode _emailNode;
  late FocusNode _passwordNode;

  bool _isPasswordVisible = true;
  bool _isLoading = false;
  bool _autovalidateMode = false;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameNode = FocusNode()..addListener(onListen);
    _emailNode = FocusNode()..addListener(onListen);
    _passwordNode = FocusNode()..addListener(onListen);
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameNode.dispose();
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverSafeArea(
              sliver: SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: size.width,
                        height: size.height / 2.8,
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: SvgPicture.asset(
                          'assets/svg/student-amico.svg',
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
                              Text('Sign Up',
                                  style: AppTextStyle.h0TextStyle()),
                              SizedBox(height: size.height * 0.026),
                              TextFormWidget(
                                hint: 'Full Name',
                                controller: _nameController,
                                node: _nameNode,
                                autofillHints: const [
                                  AutofillHints.name,
                                  AutofillHints.namePrefix,
                                  AutofillHints.nameSuffix,
                                  AutofillHints.middleName,
                                ],
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                maxLength: 100,
                                textCapitalization: TextCapitalization.words,
                                fillColor: _nameNode.hasFocus
                                    ? AppTheme.appThemeColor.withOpacity(0.08)
                                    : AppTextFieldTheme.appTextFieldTheme,
                                autovalidateMode: _autovalidateMode
                                    ? AutovalidateMode.onUserInteraction
                                    : AutovalidateMode.disabled,
                                prefixIcon: Icon(
                                  Icons.person_rounded,
                                  size: AppIconDimensions.appIconSystemSize,
                                  color: _nameNode.hasFocus
                                      ? AppTheme.appThemeColor
                                      : Colors.grey.shade400,
                                ),
                                validator: (value) =>
                                    FormValidators.nameValidation(
                                        value!.trim()),
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ),
                              SizedBox(height: size.height * 0.016),
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
                                autofillHints: const [
                                  AutofillHints.newPassword
                                ],
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
                                            'Sign up',
                                            style: AppTextStyle.h3TextStyle(
                                              size: 14.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      )
                                    : Text(
                                        'Sign up',
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
                                          _nameNode.unfocus();
                                          _emailNode.unfocus();
                                          _passwordNode.unfocus();
                                          setState(() {
                                            _autovalidateMode = false;
                                            _isLoading = true;
                                          });
                                          Navigator.pushNamed(context,
                                                  '/email_verification_page')
                                              .then((_) {
                                            setState(() => _isLoading = false);
                                            _nameController.clear();
                                            _emailController.clear();
                                            _passwordController.clear();
                                          });
                                        } else {
                                          log('Error');
                                          setState(() {
                                            _autovalidateMode = true;
                                          });
                                        }
                                      },
                              ),
                              SizedBox(height: size.height * 0.026),
                              Text.rich(
                                textAlign: TextAlign.center,
                                TextSpan(
                                  style: AppTextStyle.h4TextStyle(
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.w400),
                                  children: [
                                    const TextSpan(
                                        text:
                                            'By signing up, you\'re agree to our'),
                                    TextSpan(
                                      text: ' Terms & Conditions',
                                      style: AppTextStyle.h4TextStyle(
                                          color: AppTheme.appThemeColor,
                                          fontWeight: FontWeight.w500),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {},
                                    ),
                                    const TextSpan(text: ' and '),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: AppTextStyle.h4TextStyle(
                                          color: AppTheme.appThemeColor,
                                          fontWeight: FontWeight.w500),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {},
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.064),
                      AlreadyHaveAnAccountCheck(
                          login: false, onTap: () => Navigator.pop(context)),
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

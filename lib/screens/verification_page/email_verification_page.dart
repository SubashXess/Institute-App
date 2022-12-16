import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:institute_app/constants/textstyles.dart';
import 'package:institute_app/constants/themes.dart';
import 'package:institute_app/widgets/simple_text_button.dart';
import '../../widgets/rounded_button.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverSafeArea(
              sliver: SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: size.width,
                        height: size.height / 2.8,
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: SvgPicture.asset(
                          'assets/svg/sent-message-rafiki.svg',
                          fit: BoxFit.contain,
                          placeholderBuilder: (BuildContext context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                      ),
                      Text(
                        'Verify your\nemail address',
                        style: AppTextStyle.h0TextStyle(),
                      ),
                      SizedBox(height: size.height * 0.012),
                      Text.rich(
                        TextSpan(
                          style: AppTextStyle.h4TextStyle(size: 15.0),
                          children: [
                            const TextSpan(text: 'We\'ve sent an email to'),
                            TextSpan(
                              text: ' abc@gmail.com ',
                              style: AppTextStyle.h4TextStyle(
                                  size: 15.0,
                                  color: AppTheme.appThemeColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            const TextSpan(
                                text: 'to verify your email address.'),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.024),
                      RoundedButtonWidget(
                        size: size,
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 16.0,
                              height: 16.0,
                              child: CircularProgressIndicator.adaptive(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              'Verifying...',
                              style: AppTextStyle.h3TextStyle(
                                size: 14.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        color: AppTheme.appThemeColor,
                        onTap: null,
                      ),
                      SizedBox(height: size.height * 0.026),
                      SimpleTextButton(
                        alignment: Alignment.center,
                        size: size,
                        label: 'Cancel',
                        onTap: () => Navigator.pop(context),
                      ),
                      SizedBox(height: size.height * 0.064),
                      Container(
                        width: size.width,
                        alignment: Alignment.center,
                        child: Text.rich(
                          TextSpan(
                            style: AppTextStyle.h4TextStyle(size: 15.0),
                            children: [
                              const TextSpan(
                                  text: 'Didn\'t receive the link? '),
                              TextSpan(
                                text: 'Resend',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                                style: AppTextStyle.h4TextStyle(
                                    size: 15.0,
                                    fontWeight: FontWeight.w500,
                                    color: AppTheme.appThemeColor),
                              ),
                            ],
                          ),
                        ),
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

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/textstyles.dart';
import '../../constants/themes.dart';
import '../../widgets/rounded_button.dart';

class EmailForgotPasswordVerificationWaitingPage extends StatefulWidget {
  const EmailForgotPasswordVerificationWaitingPage({super.key});

  @override
  State<EmailForgotPasswordVerificationWaitingPage> createState() =>
      _EmailForgotPasswordVerificationWaitingPageState();
}

class _EmailForgotPasswordVerificationWaitingPageState
    extends State<EmailForgotPasswordVerificationWaitingPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        await Navigator.pushNamedAndRemoveUntil(
            context, '/signin_page', (route) => false);
        return true;
      },
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
                          'assets/svg/mailbox-rafiki.svg',
                          fit: BoxFit.contain,
                          placeholderBuilder: (BuildContext context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                      ),
                      Text(
                        'Check your\nemail address',
                        style: AppTextStyle.h0TextStyle(),
                      ),
                      SizedBox(height: size.height * 0.012),
                      Text.rich(
                        TextSpan(
                          style: AppTextStyle.h4TextStyle(size: 15.0),
                          children: [
                            const TextSpan(text: 'If an account exists for a'),
                            TextSpan(
                              text: ' abc@gmail.com ',
                              style: AppTextStyle.h4TextStyle(
                                  size: 15.0,
                                  color: AppTheme.appThemeColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            const TextSpan(
                                text:
                                    'you\'ll receive an email with a forgot password link.'),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.024),
                      Text(
                        'Check your inbox and follow the forgot password link.',
                        style: AppTextStyle.h4TextStyle(size: 15.0),
                      ),
                      SizedBox(height: size.height * 0.024),
                      RoundedButtonWidget(
                        size: size,
                        label: Text(
                          'Return to sign in',
                          style: AppTextStyle.h3TextStyle(
                            size: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        color: AppTheme.appThemeColor,
                        onTap: () => Navigator.pushNamedAndRemoveUntil(
                            context, '/signin_page', (route) => false),
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

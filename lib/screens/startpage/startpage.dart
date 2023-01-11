import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:institute_app/constants/dimensions.dart';
import 'package:institute_app/widgets/rounded_button.dart';

import '../../constants/textstyles.dart';
import '../../constants/themes.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.appThemeLightColor,
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              Image.asset(
                'assets/temp/icons8-lego-250.png',
                color: AppTheme.appThemeColor,
                height: 60.0,
              ),
              const SizedBox(height: 5.0),
              Text(
                'Institute App'.toUpperCase(),
                style: AppTextStyle.h3TextStyle(
                    color: AppTextTheme.appTextThemeDark,
                    fontWeight: FontWeight.w600,
                    size: 15.0),
              ),
              SizedBox(height: size.height * 0.12),
              SizedBox(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Discover\nyour next skill\nLearn anything you want',
                      style: AppTextStyle.h0TextStyle(),
                    ),
                    SizedBox(height: size.height * 0.030),
                    Text(
                      'We will teach you to really understand and get work-ready skills for your future career',
                      style: AppTextStyle.h4TextStyle(
                          fontWeight: FontWeight.w500,
                          size: 15.0,
                          color:
                              AppTextTheme.appTextThemeLight.withOpacity(0.56)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: size.width,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        bottom: -86.0,
                        left: 0,
                        right: 0,
                        child: SvgPicture.asset(
                          'assets/illustrations/lover-bro.svg',
                          fit: BoxFit.contain,
                          width: size.width,
                        ),
                      ),
                      Container(
                        width: size.width / 2,
                        margin: EdgeInsets.only(top: size.height * 0.08),
                        child: RoundedButtonWidget(
                          size: size,
                          color: AppTheme.appThemeColor,
                          onTap: () =>
                              Navigator.pushNamed(context, '/login_type_page'),
                          label: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 25.0,
                                height: 25.0,
                                padding: const EdgeInsets.all(6.0),
                                decoration: const BoxDecoration(
                                  color: Colors.black38,
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/arrow_forward.svg',
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Start Learning',
                                style: AppTextStyle.h3TextStyle(
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Discover your next skill Learn anything you want
// Discover the things you want to learn and grow with them.

// Online learning\nis not the next\nbig thing,\nit is the now\nBIG THING!

// GROW TOGETHER TO BE BETTER
// We will teach you to really understand and get work-ready skills for your future career.
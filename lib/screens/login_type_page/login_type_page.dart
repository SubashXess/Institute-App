// ignore_for_file: avoid_print

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:institute_app/constants/boxshadow.dart';
import 'package:institute_app/constants/dimensions.dart';
import 'package:institute_app/constants/textstyles.dart';
import 'package:institute_app/constants/themes.dart';
import 'package:institute_app/widgets/rounded_button.dart';
import 'package:provider/provider.dart';
import '../../providers/selecting_boolean_provider.dart';
import 'components/container_widget.dart';

class LoginTypePage extends StatefulWidget {
  const LoginTypePage({super.key});

  @override
  State<LoginTypePage> createState() => _LoginTypePageState();
}

class _LoginTypePageState extends State<LoginTypePage> {
  final Duration duration = const Duration(milliseconds: 1200);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('loading');
    return WillPopScope(
      onWillPop: () async {
        final provider =
            Provider.of<UserLoginTypeSelectedProvider>(context, listen: false);
        if (provider.selected == null) {
          return true;
        } else {
          Provider.of<UserLoginTypeSelectedProvider>(context, listen: false)
              .selectedIndex();

          return false;
        }
      },
      child: Scaffold(
        bottomSheet: Consumer<UserLoginTypeSelectedProvider>(
            builder: (context, provider, child) {
          return provider.selected == null
              ? AnimatedSlide(
                  offset: provider.selected != null
                      ? const Offset(0.0, 0.0)
                      : const Offset(0.0, 1.0),
                  duration: duration,
                )
              : AnimatedSlide(
                  offset: provider.selected != null
                      ? const Offset(0.0, 0.0)
                      : const Offset(0.0, 1.0),
                  duration: duration,
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                    child: Container(
                      height: size.height,
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: size.width,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            AppBoxShadow.s1BoxShadow(
                                color: Colors.black.withOpacity(0.086))
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: size.width,
                                  height: size.height * 0.34,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: AppContainerTheme
                                        .appContainerDefaultTheme,
                                    boxShadow: [
                                      AppBoxShadow.s0BoxShadow(
                                          color:
                                              Colors.black.withOpacity(0.036))
                                    ],
                                  ),
                                  child: Image.network(
                                    provider.selectedImage!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: InkWell(
                                    onTap: () {
                                      provider.selectedIndex();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(6.0),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppTheme.appThemeColor,
                                      ),
                                      child: const Icon(
                                        Icons.close_rounded,
                                        size:
                                            AppIconDimensions.appIconMediumSize,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.036),
                            Text(
                              provider.selectedHeader!,
                              textAlign: TextAlign.center,
                              style: AppTextStyle.h1TextStyle(),
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              provider.selectedSubtitle!,
                              textAlign: TextAlign.center,
                              style: AppTextStyle.h4TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppTextTheme.appTextThemeLight
                                      .withOpacity(0.4)),
                            ),
                            SizedBox(height: size.height * 0.036),
                            RoundedButtonWidget(
                              size: size,
                              color: AppTheme.appThemeColor,
                              onTap: () {},
                              label: Text(
                                'Continue',
                                style: AppTextStyle.h3TextStyle(
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        }),
        body: SizedBox(
          width: size.width,
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
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
                    ],
                  ),
                  SizedBox(height: size.height * 0.040),
                  Text(
                    'Choose a Role',
                    style: AppTextStyle.h0TextStyle(),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Who do you want to registerd as?',
                    style: AppTextStyle.h3TextStyle(
                        color:
                            AppTextTheme.appTextThemeLight.withOpacity(0.45)),
                  ),
                  SizedBox(height: size.height * 0.040),
                  GridView.builder(
                    itemCount: _title.length,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    clipBehavior: Clip.none,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                    ),
                    itemBuilder: (context, index) {
                      return Consumer<UserLoginTypeSelectedProvider>(
                          builder: (context, provider, child) {
                        return InkWell(
                          onTap: () => provider.selectedIndex(
                            index: index,
                            image: _assets[index],
                            header: _header[index],
                            subtitle: _subtitle[index],
                          ),
                          child: ContainerWidget(
                            size: size,
                            title: _title[index],
                            assets: _assets[index],
                            provider: provider,
                            index: index,
                          ),
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  final List<String> _title = [
    'Students',
    'Parents',
    'Tutors',
    'Institutes',
  ];

  final List<String> _assets = [
    'https://cdn.dribbble.com/users/1626229/screenshots/4529072/media/832b067549da45994033dc83b242b0ff.jpg?compress=1&resize=800x600&vertical=top',
    'https://cdn.dribbble.com/users/1224589/screenshots/12186706/media/1183c6ba892333ba52605757318b3c88.jpg',
    'https://cdn.dribbble.com/users/3809802/screenshots/6827845/school_life.png',
    'https://cdn.dribbble.com/users/1361993/screenshots/16912836/media/79eb29d9f8f80aad26baa0d0190d96ec.png',
  ];

  final List<String> _header = [
    'Discover How To Be\nCreative',
    'We don\'t just\nteach we inspire',
    'For an improved learning and teaching experience!',
    'Beat the best and be the\nbest with us',
  ];

  final List<String> _subtitle = [
    'Explore all the most exiting courses based on your interest and study major.',
    'During these hard times the world is facing situation your kids don\'t miss out while you are away from school!',
    'Come, join us and together we can transform the way India learns.',
    'Helping students all over the world to step up their academic potential to the next level by mentoring and many approved teaching methods.',
  ];
}

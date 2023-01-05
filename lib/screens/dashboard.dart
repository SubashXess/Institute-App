// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:institute_app/constants/boxshadow.dart';
import 'package:institute_app/constants/dimensions.dart';
import 'package:institute_app/constants/textstyles.dart';
import 'package:institute_app/constants/themes.dart';
import 'package:institute_app/screens/coursepage/coursepage.dart';
import 'package:institute_app/screens/homepage/homepage.dart';
import 'package:institute_app/screens/profilepage/profilepage.dart';
import 'package:institute_app/screens/searchpage/searchpage.dart';
import 'package:provider/provider.dart';
import '../providers/navigationbar_providers.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
// Keeping State with the Bottom Navigation Bar in Flutter
  final PageStorageBucket _bucket = PageStorageBucket();

  final List<Widget> pages = [
    const HomePage(
      key: PageStorageKey('homepage_key'),
    ),
    const CoursePage(
      key: PageStorageKey('cousepage_key'),
    ),
    const SearchPage(
      key: PageStorageKey('searchpage_key'),
    ),
    const ProfilePage(
      key: PageStorageKey('profilepage_key'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('load');
    return WillPopScope(
      onWillPop: () async {
        final provider =
            Provider.of<BottomNavBarProvider>(context, listen: false);
        if (provider.currentIndex < 1) {
          return true;
        } else {
          Provider.of<BottomNavBarProvider>(context, listen: false)
              .setCurrentIndex(0);

          return false;
        }
      },
      child: Scaffold(
        bottomNavigationBar: NavigationBarWidget(
            size: size, iconFilled: iconFilled, label: label),
        body: PageStorage(
          bucket: _bucket,
          child: Consumer<BottomNavBarProvider>(
            builder: (context, value, child) => pages[value.currentIndex],
          ),
        ),
      ),
    );
  }

  final List<IconData> iconFilled = [
    Icons.home_rounded,
    Icons.menu_book_rounded,
    Icons.search_rounded,
    Icons.person_rounded,
  ];

  final List<String> label = [
    'Home',
    'Course',
    'Search',
    'Profile',
  ];
}

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({
    super.key,
    required this.size,
    required this.iconFilled,
    required this.label,
  });

  final Size size;
  final List<IconData> iconFilled;
  final List<String> label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size.width,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            boxShadow: [
              AppBoxShadow.s1BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 13.0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(iconFilled.length, (index) {
              return Consumer<BottomNavBarProvider>(
                  builder: (context, value, child) {
                return IconWidget(
                  iconData: iconFilled[index],
                  label: label[index],
                  provider: value,
                  index: index,
                  onTap: () {
                    // value.setcurrentIndex = index;
                    value.setCurrentIndex(index);
                  },
                );
              });
            }),
          ),
        ),
      ],
    );
  }
}

class IconWidget extends StatelessWidget {
  const IconWidget(
      {super.key,
      required this.iconData,
      required this.onTap,
      required this.label,
      required this.provider,
      required this.index});

  final IconData iconData;
  final VoidCallback onTap;
  final String label;
  final BottomNavBarProvider provider;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: AppIconDimensions.appIconSystemSize,
            color: provider.currentIndex == index
                ? AppTheme.appThemeColor
                : AppIconTheme.appIconThemeLight,
          ),
          const SizedBox(height: 5.0),
          Text(
            label,
            style: AppTextStyle.h4TextStyle(
              color: provider.currentIndex == index
                  ? AppTheme.appThemeColor
                  : AppIconTheme.appIconThemeLight,
              fontWeight: FontWeight.normal,
              size: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}

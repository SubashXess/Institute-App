// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:institute_app/constants/boxshadow.dart';
import 'package:institute_app/constants/dimensions.dart';
import 'package:institute_app/constants/textstyles.dart';
import 'package:institute_app/constants/themes.dart';
import 'package:institute_app/screens/coursepage/coursepage.dart';
import 'package:institute_app/screens/homepage/homepage.dart';
import 'package:institute_app/screens/profilepage/profilepage.dart';
import 'package:institute_app/screens/searchpage/searchpage.dart';
import 'package:provider/provider.dart';
import '../../providers/navigationbar_providers.dart';
import '../../widgets/navbar_widget.dart';
import 'components/icon_widget.dart';

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
            size: size,
            iconFilled: iconFilled,
            iconOutlined: iconOutlined,
            label: label),
        body: PageStorage(
          bucket: _bucket,
          child: Consumer<BottomNavBarProvider>(
            builder: (context, value, child) => pages[value.currentIndex],
          ),
        ),
      ),
    );
  }

  final List<String> iconFilled = [
    'assets/icons/home_rounded.svg',
    'assets/icons/course_rounded.svg',
    'assets/icons/search_rounded.svg',
    'assets/icons/person_rounded.svg',
  ];

  final List<String> iconOutlined = [
    'assets/icons/home_rounded_outlined.svg',
    'assets/icons/course_rounded_outlined.svg',
    'assets/icons/search_rounded_outlined.svg',
    'assets/icons/person_rounded_outlined.svg',
  ];

  final List<String> label = [
    'Home',
    'Course',
    'Search',
    'Profile',
  ];
}

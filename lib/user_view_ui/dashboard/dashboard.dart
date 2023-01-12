// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:institute_app/constants/constants.dart';
import 'package:provider/provider.dart';
import '../../models/app_content_model.dart';
import '../../providers/navigationbar_providers.dart';
import '../../widgets/navbar_widget.dart';
import '../coursepage/coursepage.dart';
import '../homepage/homepage.dart';
import '../profilepage/profilepage.dart';
import '../searchpage/searchpage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
// Keeping State with the Bottom Navigation Bar in Flutter
  final PageStorageBucket _bucket = PageStorageBucket();

  late UserViewNavItemsModel navItems;

  final List<Widget> pages = [
    const HomePage(
      key: PageStorageKey(PageKeyStore.userhomepage),
    ),
    const CoursePage(
      key: PageStorageKey(PageKeyStore.usercoursepage),
    ),
    const SearchPage(
      key: PageStorageKey(PageKeyStore.usersearchpage),
    ),
    const ProfilePage(
      key: PageStorageKey(PageKeyStore.userprofilepage),
    ),
  ];

  @override
  void initState() {
    super.initState();
    navItems = UserViewNavItemsModel.generatedNavItems;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('dashboard');
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
        bottomNavigationBar: NavigationBarWidget(size: size, items: navItems),
        body: PageStorage(
          bucket: _bucket,
          child: Consumer<BottomNavBarProvider>(
            builder: (context, value, child) => pages[value.currentIndex],
          ),
        ),
      ),
    );
  }
}

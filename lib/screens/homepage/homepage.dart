// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:institute_app/constants/themes.dart';
import '../../widgets/dashboard_appbar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverSafeArea(
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  DashboardAppBarWidget(
                      size: size,
                      title: 'Home',
                      city: 'Bhubaneswar',
                      isHomePage: true),
                  Container(
                    width: size.width,
                    height: size.height * 0.36,
                    margin: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppTheme.appThemeColor,
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: size.height * 0.36,
                    margin: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppTheme.appThemeColor,
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: size.height * 0.36,
                    margin: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppTheme.appThemeColor,
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: size.height * 0.36,
                    margin: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppTheme.appThemeColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

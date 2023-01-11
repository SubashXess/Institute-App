// ignore_for_file: avoid_print

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:institute_app/constants/boxshadow.dart';
import 'package:institute_app/constants/themes.dart';
import 'package:institute_app/widgets/textform_widget.dart';
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
          SliverToBoxAdapter(
            child: Container(
              width: size.width,
              height: size.height * 0.36,
              alignment: Alignment.topCenter,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration:
                  BoxDecoration(color: AppTheme.appThemeColor, boxShadow: [
                AppBoxShadow.s0BoxShadow(color: Colors.black.withOpacity(0.12)),
              ]),
              child: Stack(
                children: [
                  SvgPicture.asset(
                    'assets/background/sun-tornado.svg',
                    fit: BoxFit.cover,
                  ),
                  SafeArea(
                    child: DashboardAppBarWidget(
                      size: size,
                      title: 'Home',
                      city: 'Bhubaneswar',
                      isHomePage: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.36,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
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
        ],
      ),
    );
  }
}

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:institute_app/constants/boxshadow.dart';
import 'package:institute_app/constants/dimensions.dart';
import 'package:institute_app/constants/textstyles.dart';
import 'package:institute_app/constants/themes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                width: size.width,
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Home Page',
                            style: AppTextStyle.h0TextStyle(
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              Text(
                                'Current City ',
                                style: AppTextStyle.h4TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppTextTheme.appTextThemeDark
                                      .withOpacity(0.56),
                                  size: 13.0,
                                ),
                              ),
                              Flexible(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {},
                                  child: Text(
                                    'Bhubaneswar',
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                    style: AppTextStyle.h4TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppTheme.appThemeColor,
                                      size: 13.0,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 2.0),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 14.0,
                                color: Colors.grey.shade500,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 32.0),
                    Badge(
                      position: BadgePosition.topEnd(end: -4),
                      badgeColor: Colors.redAccent,
                      elevation: 0.0,
                      padding: const EdgeInsets.all(5.0),
                      showBadge: true,
                      badgeContent: Text(
                        '5',
                        style: AppTextStyle.h4TextStyle(
                            size: 10.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          boxShadow: [
                            AppBoxShadow.s0BoxShadow(
                                color: Colors.black.withOpacity(0.06))
                          ],
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/bell.svg',
                          height: AppIconDimensions.appIconMediumSize,
                          width: AppIconDimensions.appIconMediumSize,
                          color: AppTheme.appThemeColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: size.width,
                height: size.height * 0.36,
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppTheme.appThemeColor,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: size.width,
                height: size.height * 0.36,
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppTheme.appThemeColor,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: size.width,
                height: size.height * 0.36,
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppTheme.appThemeColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:institute_app/constants/constants.dart';
import '../constants/boxshadow.dart';
import '../constants/dimensions.dart';
import '../constants/textstyles.dart';
import '../constants/themes.dart';

class DashboardAppBarWidget extends StatelessWidget {
  const DashboardAppBarWidget({
    super.key,
    required this.size,
    required this.title,
    required this.city,
    this.isSearchPage = false,
    this.isHomePage = false,
  });

  final Size size;
  final String title;
  final String city;
  final bool isSearchPage;
  final bool isHomePage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isSearchPage
              ? Text(
                  title,
                  style: AppTextStyle.h0TextStyle(fontWeight: FontWeight.w600),
                )
              : Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: AppTextStyle.h0TextStyle(
                            color: AppTextTheme.appTextThemeDark,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Text(
                            'Current City ',
                            style: AppTextStyle.h4TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppTextTheme.appTextThemeDark,
                              size: 13.0,
                            ),
                          ),
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: AppTheme.appThemeLightColor,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {},
                                    child: Text(
                                      city,
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      style: AppTextStyle.h4TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: AppTheme.appThemeColor,
                                        size: 13.0,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 2.0),
                                  const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 14.0,
                                    color: AppTheme.appThemeColorShade1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
          SizedBox(width: isSearchPage ? 0.0 : 32.0),
          isSearchPage
              ? Container()
              : Row(
                  children: [
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
        ],
      ),
    );
  }
}

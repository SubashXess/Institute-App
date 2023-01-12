import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants/textstyles.dart';
import '../../../constants/themes.dart';
import '../../../providers/navigationbar_providers.dart';

class IconWidget extends StatelessWidget {
  const IconWidget(
      {super.key,
      required this.iconFilled,
      required this.onTap,
      required this.label,
      required this.provider,
      required this.index,
      required this.iconOutlined});

  final String iconFilled;
  final String iconOutlined;
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            provider.currentIndex == index ? iconFilled : iconOutlined,
            height: 17.0,
            color: provider.currentIndex == index
                ? AppTheme.appThemeColor
                : Colors.grey.shade400,
          ),
          const SizedBox(height: 6.0),
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

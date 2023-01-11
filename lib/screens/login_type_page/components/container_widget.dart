import 'package:flutter/material.dart';

import '../../../constants/boxshadow.dart';
import '../../../constants/dimensions.dart';
import '../../../constants/textstyles.dart';
import '../../../constants/themes.dart';
import '../../../providers/selecting_boolean_provider.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    Key? key,
    required this.size,
    required this.title,
    required this.provider,
    required this.index,
    required this.assets,
  }) : super(key: key);

  final Size size;
  final String title;
  final String assets;
  final int index;
  final UserLoginTypeSelectedProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.4,
      padding: const EdgeInsets.all(16.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.defaultBorderRadius,
        color: Colors.white,
        border: provider.selected == index
            ? Border.all(width: 2.5, color: AppTheme.appThemeColor)
            : Border.all(
                width: 2.5, color: AppContainerTheme.appContainerGreyTheme),
        boxShadow: [
          AppBoxShadow.s0BoxShadow(color: Colors.black.withOpacity(0.086))
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: size.width,
                height: size.height * 0.10,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: const BoxDecoration(
                  color: AppContainerTheme.appContainerDefaultTheme,
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  assets,
                  fit: BoxFit.cover,
                ),
              ),
              Text(title, style: AppTextStyle.h3TextStyle()),
            ],
          ),
          Positioned(
            right: -8.0,
            top: -8.0,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppContainerTheme.appContainerDefaultTheme,
              ),
              child: provider.selected == index
                  ? const Icon(
                      Icons.check_circle_rounded,
                      color: AppTheme.appThemeColor,
                      size: 26.0,
                    )
                  : Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppContainerTheme.appContainerDefaultTheme,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

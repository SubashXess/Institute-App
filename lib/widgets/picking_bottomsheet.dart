import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:institute_app/constants/dimensions.dart';
import 'package:institute_app/constants/textstyles.dart';
import 'package:institute_app/constants/themes.dart';

Future pickImageBottomSheet(BuildContext context,
    {required VoidCallback onTapCamera, required onTapGallery}) {
  Size size = MediaQuery.of(context).size;
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Container(
            width: size.width,
            padding: const EdgeInsets.all(16.0),
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Choose an action', style: AppTextStyle.h2TextStyle()),
                const Divider(height: 32.0),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: onTapCamera,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: size.height * 0.024,
                        backgroundColor: AppTheme.appThemeLightColor,
                        child: const Icon(
                          Icons.camera_alt_rounded,
                          color: AppTheme.appThemeColor,
                          size: AppIconDimensions.appIconMediumSize,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Text(
                        'Open Camera',
                        style: AppTextStyle.h4TextStyle(
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: onTapGallery,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: size.height * 0.024,
                        backgroundColor: AppTheme.appThemeLightColor,
                        child: const Icon(
                          Icons.image_rounded,
                          color: AppTheme.appThemeColor,
                          size: AppIconDimensions.appIconMediumSize,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Text(
                        'Choose from Gallery',
                        style: AppTextStyle.h4TextStyle(
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:institute_app/constants/dimensions.dart';
import 'package:institute_app/constants/themes.dart';

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  const StarRating(
      {super.key,
      this.starCount = 5,
      this.initialRating = 0.0,
      required this.onRatingChanged,
      this.color = AppTheme.appThemeColor,
      this.iconSize = AppIconDimensions.appIconMediumSize,
      required this.readOnly,
      this.selected = false,
      this.defaultColor = Colors.grey});

  final int starCount;
  final double initialRating;
  final RatingChangeCallback onRatingChanged;
  final Color color;
  final Color defaultColor;
  final double iconSize;
  final bool readOnly;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }

  Widget buildStar(BuildContext context, int index) {
    Icon icon;

    if (index >= initialRating) {
      icon = Icon(
        Icons.star_border_rounded,
        color: color,
        size: iconSize,
      );
    } else if (index > initialRating - 1.0 && index < initialRating) {
      icon = Icon(
        Icons.star_half_rounded,
        color: color,
        size: iconSize,
      );
    } else {
      icon = Icon(
        Icons.star_rounded,
        color: color,
        size: iconSize,
      );
    }
    return InkResponse(
      radius: 20.0,
      highlightColor: Colors.transparent,
      onTap: readOnly
          ? null
          : () {
              onRatingChanged(index + 1.0);
            },
      child: icon,
    );
  }
}

class StarDisplayWidget extends StatelessWidget {
  const StarDisplayWidget(
      {super.key,
      this.initialRatings = 0.0,
      this.size = AppIconDimensions.appIconSystemSize,
      this.color = AppTheme.appThemeColor});

  final double initialRatings;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index >= initialRatings) {
          return Icon(
            Icons.star_border_rounded,
            size: size,
            color: color,
          );
        } else if (index > initialRatings - 1 && index < initialRatings) {
          return Icon(
            Icons.star_half_rounded,
            size: size,
            color: color,
          );
        } else {
          return Icon(
            Icons.star_rounded,
            size: size,
            color: color,
          );
        }
      }),
    );
  }
}

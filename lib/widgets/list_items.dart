import 'package:flutter/material.dart';
import '../constants/symbols.dart';
import '../constants/textstyles.dart';
import '../constants/themes.dart';
import 'star_ratings.dart';

class VerticalListItemOne extends StatelessWidget {
  const VerticalListItemOne({
    Key? key,
    required this.size,
    required this.img,
    required this.title,
    required this.name,
    required this.ratings,
  }) : super(key: key);

  final Size size;
  final String img;
  final String title;
  final String name;
  final double ratings;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                constraints: BoxConstraints(
                    maxHeight: size.height * 0.126,
                    minHeight: size.height * 0.12,
                    maxWidth: size.width * 0.226,
                    minWidth: size.width * 0.20),
                margin: const EdgeInsets.only(right: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppContainerTheme.appContainerGreyTheme,
                ),
                child: Image.network(
                  img,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.titleTextStyle()),
                    const SizedBox(height: 4.0),
                    Text(name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.subtitleTextStyle()),
                    const SizedBox(height: 4.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        StarDisplayWidget(initialRatings: ratings, size: 15.0),
                        const SizedBox(width: 6.0),
                        Text(
                          ratings.toString(),
                          style: AppTextStyle.h4TextStyle(
                            color: AppTheme.appThemeColor,
                            fontWeight: FontWeight.w600,
                            size: 12.0,
                          ),
                        ),
                        const SizedBox(width: 6.0),
                        Text(
                          '(1K+)',
                          style: AppTextStyle.h4TextStyle(
                            color: AppTheme.appThemeColor,
                            fontWeight: FontWeight.w600,
                            size: 12.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6.0),
                    Text('${AppUnicode.rupeeUnicode}3,499',
                        style: AppTextStyle.h3TextStyle()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

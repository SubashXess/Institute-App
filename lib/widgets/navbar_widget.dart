import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/boxshadow.dart';
import '../models/app_content_model.dart';
import '../providers/navigationbar_providers.dart';
import '../user_view_ui/dashboard/components/icon_widget.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({
    super.key,
    required this.size,
    required this.items,
  });

  final Size size;
  final UserViewNavItemsModel items;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size.width,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            boxShadow: [
              AppBoxShadow.s1BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 13.0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(items.navitems.length, (index) {
              return Consumer<BottomNavBarProvider>(
                  builder: (context, value, child) {
                return IconWidget(
                  iconOutlined: items.navitems[index].iconOutlined,
                  iconFilled: items.navitems[index].iconFilled,
                  label: items.navitems[index].title,
                  provider: value,
                  index: index,
                  onTap: () => value.setCurrentIndex(index),
                );
              });
            }),
          ),
        ),
      ],
    );
  }
}

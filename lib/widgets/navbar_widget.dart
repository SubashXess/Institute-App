import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/boxshadow.dart';
import '../providers/navigationbar_providers.dart';
import '../screens/dashboard/components/icon_widget.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({
    super.key,
    required this.size,
    required this.iconFilled,
    required this.label,
    required this.iconOutlined,
  });

  final Size size;
  final List<String> iconFilled;
  final List<String> iconOutlined;
  final List<String> label;

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
            children: List.generate(iconFilled.length, (index) {
              return Consumer<BottomNavBarProvider>(
                  builder: (context, value, child) {
                return IconWidget(
                  iconOutlined: iconOutlined[index],
                  iconFilled: iconFilled[index],
                  label: label[index],
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

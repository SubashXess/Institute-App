import 'package:flutter/material.dart';
import 'package:institute_app/constants/boxshadow.dart';
import 'package:institute_app/constants/dimensions.dart';
import 'package:institute_app/constants/textstyles.dart';

class LoginTypePage extends StatefulWidget {
  const LoginTypePage({super.key});

  @override
  State<LoginTypePage> createState() => _LoginTypePageState();
}

class _LoginTypePageState extends State<LoginTypePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Select\nuser type',
                  style: AppTextStyle.h0TextStyle(),
                ),
                const SizedBox(height: 32.0),
                GridView.builder(
                  itemCount: _title.length,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      width: size.width,
                      height: size.height * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: AppBorderRadius.defaultBorderRadius,
                        color: Colors.white,
                        boxShadow: [
                          AppBoxShadow.s0BoxShadow(
                              color: Colors.black.withOpacity(0.086))
                        ],
                      ),
                      child: Text(_title[index],
                          style: AppTextStyle.h3TextStyle()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final List<String> _title = [
    'Students',
    'Parents',
    'Tutors',
    'Institutes',
  ];
}

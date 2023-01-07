import 'package:flutter/material.dart';
import 'package:institute_app/constants/textstyles.dart';

class TestPage1 extends StatefulWidget {
  const TestPage1({super.key});

  @override
  State<TestPage1> createState() => _TestPage1State();
}

class _TestPage1State extends State<TestPage1> {
  bool selected = false;
  double opacityLevel = 1.0;
  Duration duration = const Duration(seconds: 2);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
            child: AnimatedContainer(
              width: size.width,
              duration: duration,
              curve: Curves.fastLinearToSlowEaseIn,
              margin: EdgeInsets.only(
                  top: selected ? kToolbarHeight * 2.0 : kToolbarHeight * 2.68),
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    height: size.height * 0.36,
                    margin: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.deepPurple,
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: size.height * 0.36,
                    margin: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.deepPurple,
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: size.height * 0.36,
                    margin: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.deepPurple,
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: size.height * 0.36,
                    margin: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.deepPurple,
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: size.height * 0.36,
                    margin: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: AnimatedContainer(
              width: size.width,
              // height: selected ? 72.0 : 112.0,
              height: selected ? kToolbarHeight * 2.0 : kToolbarHeight * 2.68,
              duration: duration,
              curve: Curves.fastLinearToSlowEaseIn,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade200,
              ),
              child: SafeArea(
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    AnimatedPositioned(
                      width: size.width,
                      duration: duration,
                      curve: Curves.fastLinearToSlowEaseIn,
                      top: selected ? -32.0 : 0.0,
                      child: AnimatedOpacity(
                        opacity: opacityLevel,
                        duration: duration,
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                          child: Text(
                            'Search',
                            style: AppTextStyle.h0TextStyle(),
                          ),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      height: 40.0,
                      width: selected ? size.width / 1.24 : size.width, // 1.4
                      bottom: selected ? 16.0 : 16.0,
                      duration: duration,
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: InkWell(
                        onTap: () {
                          setState(
                            () {
                              selected = true;
                              // opacityLevel = opacityLevel == 0.0 ? 1.0 : 0.0;
                              opacityLevel = 0.0;
                            },
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.deepPurple.shade600,
                          ),
                          child: Center(
                            child: Text(
                              'Search',
                              style:
                                  AppTextStyle.h3TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      height: 40.0,
                      // width: selected ? size.width / 3.0 - 48.0 : 0.0, // 2.6
                      bottom: selected ? 16.0 : 16.0,
                      right: selected ? 16.0 : 0.0,
                      duration: duration,
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: AnimatedOpacity(
                        opacity: opacityLevel == 0.0 ? 1.0 : 0.0,
                        duration: duration,
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selected = false;
                              opacityLevel = 1.0;
                            });
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.red.shade200,
                            ),
                            child: Text(
                              'Cancel',
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              softWrap: true,
                              style:
                                  AppTextStyle.h3TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

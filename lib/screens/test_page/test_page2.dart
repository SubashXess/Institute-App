// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:institute_app/constants/textstyles.dart';

class TestPage2 extends StatefulWidget {
  const TestPage2({super.key});

  @override
  State<TestPage2> createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {
  late ScrollController _scrollController;
  Duration duration = const Duration(milliseconds: 1500);
  bool selected = false;
  bool isVisible = true;
  double opacityLevel = 1.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(onListen);
  }

  @override
  void dispose() {
    _scrollController.removeListener(onListen);
    _scrollController.dispose();
    super.dispose();
  }

  void onListen() {
    if (_scrollController.position.pixels >= 16.0) {
      onHide();
    } else {
      onShow();
    }
  }

  void onShow() {
    if (!isVisible) setState(() => isVisible = true);
  }

  void onHide() {
    if (isVisible) setState(() => isVisible = false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('Loads');
    return Scaffold(
      body: SizedBox(
        width: size.width,
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: AnimatedContainer(
                duration: duration,
                curve: Curves.fastLinearToSlowEaseIn,
                padding: EdgeInsets.only(
                    top: selected || !isVisible
                        ? size.height * 0.14
                        : size.height * 0.20),
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height * 0.36,
                      margin: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.deepPurple.shade300,
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: size.height * 0.36,
                      margin: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.deepPurple.shade300,
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: size.height * 0.36,
                      margin: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.deepPurple.shade300,
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: size.height * 0.36,
                      margin: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.deepPurple.shade300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedContainer(
              width: size.width,
              // height: selected ? size.height * 0.14 : size.height * 0.20,
              height: selected || !isVisible
                  ? size.height * 0.14
                  : size.height * 0.20,
              duration: duration,
              curve: Curves.fastLinearToSlowEaseIn,
              color: Colors.deepPurple,
              child: SafeArea(
                bottom: false,
                child: Stack(
                  children: [
                    AnimatedSlide(
                      duration: duration,
                      curve: Curves.fastLinearToSlowEaseIn,
                      offset: selected || !isVisible
                          ? const Offset(0.0, -2.0)
                          : const Offset(0.0, 0.0),
                      child: AnimatedOpacity(
                        opacity: selected ? 0.0 : 1.0,
                        duration: duration,
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 16.0),
                          child: Text(
                            'Search',
                            style:
                                AppTextStyle.h0TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: duration,
                      bottom: 0.0,
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: AnimatedContainer(
                        duration: duration,
                        width: size.width,
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selected = true;
                                  });
                                },
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.white30,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Search',
                                      style: AppTextStyle.h3TextStyle(
                                          color: Colors.white60),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            AnimatedContainer(
                              width: selected ? 80.0 : 0.0,
                              height: 40.0,
                              duration: duration,
                              curve: Curves.fastLinearToSlowEaseIn,
                              padding: const EdgeInsets.only(left: 16.0),
                              alignment: Alignment.centerRight,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                // color: Colors.red.shade100,
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    selected = false;
                                  });
                                },
                                child: Text(
                                  'Cancel',
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  style: AppTextStyle.h3TextStyle(
                                      color: Colors.red),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

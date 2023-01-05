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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SafeArea(
              child: AnimatedContainer(
                width: size.width,
                height: selected ? 72.0 : 112.0,
                duration: duration,
                curve: Curves.fastLinearToSlowEaseIn,
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
                      width: selected ? size.width / 1.4 : size.width,
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
                      width: selected ? size.width / 2.6 - 48.0 : 0.0,
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
                            width: size.width / 2.6 - 48.0, // 32.0
                            height: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
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
                    ),
                  ],
                ),
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
    );
  }
}

// SafeArea(
//   child: Container(
//     width: size.width,
//     height: 56.0,
//     color: Colors.red.shade200,
//     child: AnimatedOpacity(
//       opacity: opacityLevel,
//       duration: const Duration(seconds: 2),
//       curve: Curves.fastLinearToSlowEaseIn,
//       child: Stack(
//         children: [
//           AnimatedPositioned(
//             width: size.width,
//             duration: const Duration(seconds: 2),
//             curve: Curves.fastLinearToSlowEaseIn,
//             top: selected ? -32.0 : 0.0,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                   horizontal: 16.0, vertical: 16.0),
//               child: Text(
//                 'Search',
//                 style: AppTextStyle.h0TextStyle(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
// ),
// // const SizedBox(height: 16.0),
// InkWell(
//   onTap: () {
//     setState(
//       () {
//         selected = !selected;
//         opacityLevel = opacityLevel == 0.0 ? 1.0 : 0.0;
//       },
//     );
//   },
//   child: Container(
//     width: size.width,
//     height: 46.0,
//     margin: const EdgeInsets.symmetric(horizontal: 16.0),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(10.0),
//       color: Colors.deepPurple,
//     ),
//   ),
// ),
// Stack(
//   children: [
//     AnimatedPositioned(
//       width: selected ? size.width - 32.0 : size.width - 32.0,
//       height: selected ? 50.0 : 50.0,
//       top: selected ? 0.0 : 0.0,
//       duration: const Duration(seconds: 2),
//       curve: Curves.fastLinearToSlowEaseIn,
//       child: GestureDetector(
//         onTap: () {
//           setState(() {
//             selected = !selected;
//           });
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.deepPurple,
//           ),
//         ),
//       ),
//     ),
//   ],
// ),

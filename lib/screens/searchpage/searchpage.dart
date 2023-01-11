import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:institute_app/constants/dimensions.dart';
import '../../constants/boxshadow.dart';
import '../../constants/textstyles.dart';
import '../../widgets/dashboard_appbar_widget.dart';
import '../../widgets/list_items.dart';
import '../../widgets/star_ratings.dart';
import '../../widgets/textform_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late TextEditingController _searchController;
  late FocusNode _searchNode;

  Duration duration = const Duration(milliseconds: 1500);
  bool selected = false;
  bool isVisible = true;
  double opacityLevel = 1.0;
  bool autofocus = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchNode = FocusNode();
    _scrollController = ScrollController()..addListener(onListen);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchNode.dispose();
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

  double rat = 0.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: _scrollController,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: AnimatedContainer(
                  duration: duration,
                  curve: Curves.fastLinearToSlowEaseIn,
                  padding: EdgeInsets.only(
                      top: selected || !isVisible
                          ? size.height * 0.14 + 16.0
                          : size.height * 0.20 + 16.0),
                  child: Column(
                    children: [
                      VerticalListItemOne(
                        size: size,
                        img:
                            'https://miro.medium.com/max/1400/1*dWg4BLp4RwJCFZFFyNF2dA.jpeg',
                        title:
                            'Python Django Ecommerce | An Advanced Django Web Application',
                        name: 'Rathan Kumar',
                        ratings: 3.5,
                      ),
                      Container(
                        width: size.width,
                        // height: size.height * 0.36,
                        margin: const EdgeInsets.all(16.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          // color: Colors.deepPurple.shade300,
                        ),
                        child: Column(
                          children: [
                            StarRating(
                              readOnly: false,
                              initialRating: rat,
                              iconSize: 24.0,
                              onRatingChanged: (rating) {
                                setState(() {
                                  rat = rating;
                                });
                              },
                            ),
                            const SizedBox(height: 10.0),
                            const SizedBox(height: 10.0),
                          ],
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
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.grey.shade50.withOpacity(0.6),
                  boxShadow: !isVisible
                      ? [
                          AppBoxShadow.s1BoxShadow(
                              y: 0.0, color: Colors.black.withOpacity(0.12))
                        ]
                      : null,
                ),
                child: SafeArea(
                  bottom: false,
                  child: BackdropFilter(
                    filter: !isVisible
                        ? ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0)
                        : ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
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
                                style: AppTextStyle.h0TextStyle(
                                    fontWeight: FontWeight.w600),
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
                                  child: SearchFieldWidget2(
                                    controller: _searchController,
                                    node: _searchNode,
                                    autofocus: autofocus,
                                    onTap: () {
                                      setState(() {
                                        selected = true;
                                      });
                                    },
                                    hint: 'Institute, Tutor, Courses and More',
                                    icon: Icons.search_rounded,
                                    onChanged: (value) {},
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
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      setState(() {
                                        selected = false;
                                      });
                                    },
                                    child: Text(
                                      'Cancel',
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      style: AppTextStyle.h3TextStyle(
                                          color: Colors.redAccent),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  final RelativeRectTween relativeRectTween = RelativeRectTween(
    begin: const RelativeRect.fromLTRB(100, 100, 0, 0),
    end: const RelativeRect.fromLTRB(0, 0, 10, 10),
  );
}

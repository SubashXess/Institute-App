import 'package:flutter/material.dart';
import 'package:institute_app/constants/dimensions.dart';
import 'package:institute_app/constants/textstyles.dart';
import 'package:institute_app/constants/themes.dart';

import '../../widgets/dashboard_appbar_widget.dart';
import '../../widgets/textform_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late TextEditingController _searchController;
  late FocusNode _searchNode;

  bool _first = true;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _searchController = TextEditingController();
    _searchNode = FocusNode();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchNode.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: DashboardAppBarWidget(
                  size: size,
                  title: 'Search',
                  city: 'Bhubaneswar',
                  isSearchPage: true,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  width: size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SearchFieldWidget(
                    hint: 'Courses, Tutors, Institutes and More',
                    controller: _searchController,
                    node: _searchNode,
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      size: AppIconDimensions.appIconSystemSize,
                    ),
                    onTap: () {},
                    onChanged: (value) {},
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  width: size.width,
                  height: size.height * 0.36,
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.deepOrange,
                  ),
                  child: InkWell(
                    onTap: () {
                      if (_first) {
                        _animationController.forward();
                      } else {
                        _animationController.reverse();
                      }
                      _first = !_first;
                    },
                    child: Stack(
                      children: [
                        PositionedTransition(
                          rect: relativeRectTween.animate(_animationController),
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  width: size.width,
                  height: size.height * 0.36,
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.deepOrange,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  width: size.width,
                  height: size.height * 0.36,
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.deepOrange,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  width: size.width,
                  height: size.height * 0.36,
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.deepOrange,
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

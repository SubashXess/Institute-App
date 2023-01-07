import 'package:flutter/material.dart';
import 'package:institute_app/constants/textstyles.dart';

class TestPage2 extends StatefulWidget {
  const TestPage2({super.key});

  @override
  State<TestPage2> createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {
  Duration duration = const Duration(milliseconds: 1500);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.deepPurple,
            expandedHeight: 116.0,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              expandedTitleScale: 1.0,
              title: SafeArea(
                child: Container(
                  width: size.width,
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.deepPurple,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Search',
                          style: AppTextStyle.h0TextStyle(color: Colors.white)),
                      Container(
                        width: size.width,
                        height: 40.0,
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 16.0),
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white38,
                        ),
                        child: Text(
                          'Artists, Sings, Lyrics and More',
                          style: AppTextStyle.h4TextStyle(
                              color: Colors.white60,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.36,
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.deepPurple.shade200,
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.36,
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.deepPurple.shade200,
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.36,
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.deepPurple.shade200,
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.36,
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.deepPurple.shade200,
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.36,
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.deepPurple.shade200,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

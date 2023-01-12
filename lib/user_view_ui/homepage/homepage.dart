// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:institute_app/constants/constants.dart';
import '../../widgets/dashboard_appbar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String userType;

  @override
  void initState() {
    super.initState();
    userType = AppContentType.students;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
              child: DashboardAppBarWidget(
                size: size,
                title: 'Home',
                city: 'Bhubaneswar',
                isHomePage: true,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Container(
                //   width: size.width,
                //   height: size.height * 0.065,
                //   color: Colors.deepPurple.shade200,
                //   child: ListView.builder(
                //     itemCount: 10,
                //     shrinkWrap: true,
                //     clipBehavior: Clip.none,
                //     physics: const NeverScrollableScrollPhysics(),
                //     padding: const EdgeInsets.only(left: 16.0),
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (context, index) {
                //       return Consumer(
                //         builder: (context, provider, child) {},
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

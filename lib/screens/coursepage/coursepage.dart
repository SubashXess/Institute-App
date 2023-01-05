import 'package:flutter/material.dart';

import '../../widgets/dashboard_appbar_widget.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: DashboardAppBarWidget(
                    size: size, title: 'Course', city: 'Bhubaneswar')),
            SliverToBoxAdapter(
              child: Container(
                width: size.width,
                height: size.height * 0.36,
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.deepPurple,
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
                  color: Colors.deepPurple,
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
                  color: Colors.deepPurple,
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
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

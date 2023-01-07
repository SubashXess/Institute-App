import 'package:flutter/material.dart';
import 'package:institute_app/constants/routes.dart';
import 'package:provider/provider.dart';
import 'providers/navigationbar_providers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavBarProvider()),
      ],
      child: MaterialApp(
        title: 'Institute App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/testpage2', // signin_page   dashboard
        routes: routes,
      ),
    );
    // return
  }
}

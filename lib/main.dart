import 'package:flutter/material.dart';
import 'package:institute_app/constants/routes.dart';
import 'package:institute_app/providers/radio_button_providers.dart';
import 'package:institute_app/providers/selecting_boolean_provider.dart';
import 'package:provider/provider.dart';
import 'providers/course_insert_provider.dart';
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
        ChangeNotifierProvider(
            create: (context) => UserLoginTypeSelectedProvider()),
        ChangeNotifierProvider(create: (context) => RadioButtonProviders()),
        ChangeNotifierProvider(create: (context) => CourseInsertProvider()),
      ],
      child: MaterialApp(
        title: 'Institute App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            radioTheme: const RadioThemeData(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity(
                    vertical: VisualDensity.minimumDensity,
                    horizontal: VisualDensity.minimumDensity),
                splashRadius: 20.0),
            bottomSheetTheme: const BottomSheetThemeData(
                backgroundColor: Colors.transparent, elevation: 0.0)),
        initialRoute:
            '/dashboard', // signin_page   dashboard   //  insertcoursespage    // startpage
        routes: routes,
      ),
    );
  }
}


/*
  Start Page ----> Phone Login Page ----> User Type Page ----> Filter/Search Course/Tutor ----> Dashboard

  ** User Type Page --->  // Are you looking for tutor? or join as tutor?

 */
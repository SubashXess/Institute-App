import 'package:flutter/material.dart';
import 'package:institute_app/constants/routes.dart';
import 'package:institute_app/providers/selecting_boolean_provider.dart';
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
        ChangeNotifierProvider(
            create: (context) => UserLoginTypeSelectedProvider()),
      ],
      child: MaterialApp(
        title: 'Institute App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            bottomSheetTheme: const BottomSheetThemeData(
                backgroundColor: Colors.transparent, elevation: 0.0)),
        initialRoute:
            '/dashboard', // signin_page   dashboard    login_type_page   startpage
        routes: routes,
      ),
    );
  }
}

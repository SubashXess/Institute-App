import 'package:flutter/material.dart';
import 'package:institute_app/provider_view_ui/insert_courses_page/insert_courses_page.dart';
import 'package:institute_app/screens/forgot_password_page/forgot_password_page.dart';
import 'package:institute_app/screens/login_type_page/login_type_page.dart';
import 'package:institute_app/screens/signup_page/signup_page.dart';
import 'package:institute_app/screens/startpage/startpage.dart';
import 'package:institute_app/screens/test_page/test_page2.dart';
import 'package:institute_app/screens/test_page/testpage1.dart';
import 'package:institute_app/screens/verification_page/email_verification_page.dart';
import 'package:institute_app/screens/verification_page/forgot_password_verification_waiting_page.dart';

import '../screens/signin_page/signin_page.dart';
import '../user_view_ui/coursepage/coursepage.dart';
import '../user_view_ui/dashboard/dashboard.dart';
import '../user_view_ui/homepage/homepage.dart';
import '../user_view_ui/profilepage/profilepage.dart';
import '../user_view_ui/searchpage/searchpage.dart';

final Map<String, WidgetBuilder> routes = {
  '/startpage': (context) => const StartPage(),
  '/login_type_page': (context) => const LoginTypePage(),
  '/signin_page': (context) => const SignInPage(),
  '/signup_page': (context) => const SignUpPage(),
  '/forgot_password_page': (context) => const ForgotPasswordPage(),
  '/email_verification_page': (context) => const EmailVerificationPage(),
  '/email_forgot_password_verification_page': (context) =>
      const EmailForgotPasswordVerificationWaitingPage(),

  // ================ user routes ======================= //
  '/dashboard': (context) => const Dashboard(),
  '/homepage': (context) => const HomePage(),
  '/coursepage': (context) => const CoursePage(),
  '/searchpage': (context) => const SearchPage(),
  '/profilepage': (context) => const ProfilePage(),

  // App Test Page
  '/testpage1': (context) => const TestPage1(),
  '/testpage2': (context) => const TestPage2(),

  // ======================= provider routes ===================== //
  '/insertcoursespage': (context) => const InsertCoursesPage(),
};

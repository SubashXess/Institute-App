import 'package:flutter/material.dart';
import 'package:institute_app/screens/coursepage/coursepage.dart';
import 'package:institute_app/screens/dashboard.dart';
import 'package:institute_app/screens/forgot_password_page/forgot_password_page.dart';
import 'package:institute_app/screens/homepage/homepage.dart';
import 'package:institute_app/screens/profilepage/profilepage.dart';
import 'package:institute_app/screens/searchpage/searchpage.dart';
import 'package:institute_app/screens/signup_page/signup_page.dart';
import 'package:institute_app/screens/verification_page/email_verification_page.dart';
import 'package:institute_app/screens/verification_page/forgot_password_verification_waiting_page.dart';

import '../screens/signin_page/signin_page.dart';

final Map<String, WidgetBuilder> routes = {
  '/signin_page': (context) => const SignInPage(),
  '/signup_page': (context) => const SignUpPage(),
  '/forgot_password_page': (context) => const ForgotPasswordPage(),
  '/email_verification_page': (context) => const EmailVerificationPage(),
  '/email_forgot_password_verification_page': (context) =>
      const EmailForgotPasswordVerificationWaitingPage(),
  '/dashboard': (context) => const Dashboard(),
  '/homepage': (context) => const HomePage(),
  '/coursepage': (context) => const CoursePage(),
  '/searchpage': (context) => const SearchPage(),
  '/profilepage': (context) => const ProfilePage(),
};

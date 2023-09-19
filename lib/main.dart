import 'package:flutter/material.dart';
import 'pages/homepage.dart';
import 'pages/helpPage.dart';
import 'pages/searchPage.dart';
import 'pages/chatPage.dart';
import 'pages/agencyInfoPage.dart';
import 'pages/authpages/loginPage.dart';
import 'pages/authpages/registerPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/search': (context) => const Search(),
        '/chat': (context) => const Chat(),
        '/info':(context) => const AgencyInfo(),
        '/help':(context) => const Help(),
        '/login':(context) => const LoginPage(),
        'register':(context) => const RegisterPage()
      },
    ) ;
  }
}

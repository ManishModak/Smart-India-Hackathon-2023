import 'package:flutter/material.dart';
import 'package:smart_india_hackathon/pages/agencydetail_Page.dart';
import 'package:smart_india_hackathon/pages/helpPage.dart';
import 'package:smart_india_hackathon/pages/homePage.dart';
import 'package:smart_india_hackathon/pages/searchPage.dart';
import 'package:smart_india_hackathon/pages/chatPage.dart';

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
        '/agencydetail':(context) => const AgencyDetail(),
        '/help':(context) => const Help()
      },
    ) ;
  }
}


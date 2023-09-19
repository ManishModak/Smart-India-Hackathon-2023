import 'package:flutter/material.dart';
import 'pages/homepage.dart';

void main() {
  runApp(const trail12());
}


class Smart-India-Hackathon-2023 extends StatelessWidget {
  const Smart-India-Hackathon-2023({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        // '/search': (context) => const Search(),
        // '/chat': (context) => const Chat(),
        // '/agencydetail':(context) => const AgencyDetail(),
        // '/help':(context) => const Help()
      },
    ) ;
  }
}

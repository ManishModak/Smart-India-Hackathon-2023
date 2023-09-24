import 'package:flutter/material.dart';
import 'package:smart_india_hackathon/pages/resourcesPage.dart';
import 'package:smart_india_hackathon/pages/authpages/registerPage.dart';
import 'package:smart_india_hackathon/pages/authpages/successPage.dart';
import 'package:smart_india_hackathon/pages/helpPage.dart';
import 'package:smart_india_hackathon/pages/homePage.dart';
import 'package:smart_india_hackathon/pages/searchPage.dart';
import 'package:smart_india_hackathon/pages/chatPage.dart';
import 'package:smart_india_hackathon/pages/authpages/loginPage.dart';
import 'package:smart_india_hackathon/pages/navbar.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData.dark(),

      initialRoute: '/login',
      routes: {
        '/success' : (context) => const SuccessPage(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/search': (context) => const Search(),
        '/chat': (context) => const Chat(),
        '/agencydetail':(context) =>  const ResourcesPage(),
        '/help':(context) => const Help(),
        '/Nav':(context) => const Nav()
      },
    ) ;
  }
}


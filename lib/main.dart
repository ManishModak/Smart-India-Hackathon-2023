import 'package:flutter/material.dart';
import 'pages/homepage.dart';
import 'pages/helpPage.dart';
import 'pages/searchPage.dart';
import 'pages/chatPage.dart';
import 'pages/agencyInfoPage.dart';
import 'pages/authpages/loginPage.dart';
import 'pages/authpages/registerPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

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

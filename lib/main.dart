import 'package:flutter/material.dart';
import 'package:smart_india_hackathon/pages/agencydetail_Page.dart';
import 'package:smart_india_hackathon/pages/authpages/registerPage.dart';
import 'package:smart_india_hackathon/pages/helpPage.dart';
import 'package:smart_india_hackathon/pages/homePage.dart';
import 'package:smart_india_hackathon/pages/searchPage.dart';
import 'package:smart_india_hackathon/pages/chatPage.dart';
import 'package:smart_india_hackathon/pages/authpages/loginPage.dart';
import 'package:smart_india_hackathon/pages/navbar.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/agencyServices.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AgencyDatabase agencyDatabase = AgencyDatabase();
  agencyDatabase.addAgency(pass: "22", name: "Vector Hospital", type: "FireStation",
      address: "HPPM+3RF, Phase 1, Hinjawadi Rajiv Gandhi Infotech Park, Hinjawadi, Hinjewadi, Pimpri-Chinchwad, Maharashtra 411057",
      location: "18.586045322069047, 73.73495023819287", description: "A governmental agency");
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
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/search': (context) => const Search(),
        '/chat': (context) => const Chat(),
        '/agencydetail':(context) =>  AgencyDetail(String as String),
        '/help':(context) => const Help(),
        '/Nav':(context) => const Nav()
      },
    ) ;
  }
}


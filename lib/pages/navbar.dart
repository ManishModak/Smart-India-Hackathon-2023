import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_india_hackathon/pages/searchPage.dart';
import 'resourcesPage.dart';
import 'chatPage.dart';
import 'helpPage.dart';
import 'homePage.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  double screenHeight = 0;
  double screeenWidth = 0;

  Color primary = const Color(0xffeef4444c);

  int currentIndex = 2;

  List<IconData> navigationIcons = [
    FontAwesomeIcons.folder,
    FontAwesomeIcons.magnifyingGlass,
    FontAwesomeIcons.house,
    FontAwesomeIcons.comment,
    FontAwesomeIcons.circleQuestion,
  ];

  late String _id ;
  Map data = {} ;

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)!.settings.arguments as Map ;
    _id = data["agencyId"] ;

    screenHeight = MediaQuery.of(context).size.height;
    screeenWidth = MediaQuery.of(context).size.width;

    List<Widget> screens = [
      ResourcesPage(agencyId: _id,),
      const Search(),
      const HomePage(),
      const ChatPage(),
      const Help(),
    ];

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: IndexedStack(
              index: currentIndex,
              children: screens,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 70,
              margin: const EdgeInsets.only(
                left: 12,
                right: 12,
                bottom: 24,
              ),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 10,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < navigationIcons.length; i++) ...<Expanded>{
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              currentIndex = i;
                            });
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  navigationIcons[i],
                                  color:
                                  i == currentIndex ? primary : Colors.teal,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    }
                  ],
                ),
              ),
            ),
          ),
        ]
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_india_hackathon/pages/searchPage.dart';
import 'agencydetail_Page.dart';
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

  Color primary = const Color(0xFF303030);

  int currentIndex = 0;

  List<IconData> navigationIcons = [
    FontAwesomeIcons.addressBook,
    FontAwesomeIcons.magnifyingGlass,
    FontAwesomeIcons.house,
    FontAwesomeIcons.comment,
    FontAwesomeIcons.question,
  ];

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screeenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: currentIndex,
            children: const [
              //AgencyDetail(),
              Search(),
              HomePage(),
              Chat(),
              Help(),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildOverlayNavigationBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildOverlayNavigationBar() {
    return Container(
      height: 70,
      margin: const EdgeInsets.only(
        left: 12,
        right: 12,
        bottom: 24,
      ),
      decoration: const BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.all(Radius.circular(40)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Adjust this for spacing
          children: [
            for (int i = 0; i < navigationIcons.length; i++) ...<Widget>{
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = i;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0), // Adjust the padding
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), // Adjust the shape
                    color: i == currentIndex ? primary : Colors.black38,
                  ),
                  child: Icon(
                    navigationIcons[i],
                    color: i == currentIndex ? Colors.white : Colors.blueAccent,
                  ),
                ),
              ),
            }
          ],
        ),
      ),
    );
  }

}
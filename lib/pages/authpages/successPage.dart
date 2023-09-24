import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {

  Map data = {} ;
  late String agencyId ;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width ;
    data = ModalRoute.of(context)!.settings.arguments as Map;
    agencyId = data["agencyId"] ;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Your Registered Agency Id is:",style: TextStyle(fontSize: 20)),
                const SizedBox(height: 10,),
                Text(agencyId,style: const TextStyle(fontSize: 20,color: Colors.redAccent)),
              ],
            ),
            const SizedBox(height: 15,),
            Container(
              width: width-10,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.transparent
              ),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0
                  ),
                  onPressed: () => Navigator.popUntil(context, ModalRoute.withName("/login")),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Continue to Login",
                        style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 1.25,
                            color: Colors.white
                        ),
                      ),
                      Icon(FontAwesomeIcons.squareCaretRight)
                    ],
                  )
              ),
            )
          ],
        )
      ),
    );
  }
}




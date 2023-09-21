import 'package:flutter/material.dart';
import 'package:trail12/commons/commonCode.dart' ;


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formkey = GlobalKey<FormState>();
  final TextEditingController agencyName = TextEditingController() ;
  final TextEditingController agencyPassword = TextEditingController() ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            const SizedBox(height:150),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12
                ),
                decoration: textInputDecoration.copyWith(hintText: "Agency Name"),
                validator: (val) => val == null || val.isEmpty ? "Enter The Agency Name" : null,
                controller: agencyName,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
              ),
            )
          ],
        ),
      ),
    );
  }
}
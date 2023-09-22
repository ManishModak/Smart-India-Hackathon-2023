import 'package:flutter/material.dart';
import 'package:smart_india_hackathon/commons/commonCode.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final formkey = GlobalKey<FormState>() ;
  TextEditingController agencyName = TextEditingController();
  TextEditingController agencyPass = TextEditingController();

  final secureStorage = const FlutterSecureStorage();

  void saveLoginInfo() async{
    await secureStorage.write(key: "AgencyName", value: agencyName.text);
    await secureStorage.write(key: "Password", value: agencyPass.text);
    await secureStorage.write(key: "RememberMe", value: "true");
  }

  void retrieveLoginInfo() async{
    final password =  await secureStorage.read(key: 'Password');
    final name = await secureStorage.read(key: "AgencyName");

    if (password != null && name != null) {
      agencyPass.text = password;
      agencyName.text = name;
    }
  }

  @override
  void initState() {
    retrieveLoginInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal:15,vertical:200),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 1.25
                  ),
                  decoration: textInputDecoration.copyWith(hintText: "Agency Name"),
                  validator: (val) => val == null || val.isEmpty ? "Enter Agency Name" : null,
                  controller: agencyName,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 1.25
                  ),
                  decoration: textInputDecoration.copyWith(hintText: "Agency Password"),
                  validator: (val) => val == null || val.isEmpty ? "Enter Agency Password" : null ,
                  controller: agencyPass,
                ),
                const SizedBox(height: 30),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.teal
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0
                    ),
                    onPressed: saveLoginInfo,
                    child: const Center(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 1.25,
                          color: Colors.white
                        ),
                      ),
                    ),
                  )
                ),
                const SizedBox(height: 10),
                const Divider(
                  color: Colors.white,
                  height: 20,
                  thickness: 1.25,
                ),
                const SizedBox(height: 10),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.teal
                  ),
                  child: const Center(
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 1.25,
                          color: Colors.white
                      ),
                    ),
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

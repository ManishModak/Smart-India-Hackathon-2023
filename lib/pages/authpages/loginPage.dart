import 'package:flutter/material.dart';
import 'package:smart_india_hackathon/commons/commonCode.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:smart_india_hackathon/commons/loading.dart';
import 'package:smart_india_hackathon/services/authServices.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  LoginDatabase loginDatabase = LoginDatabase();
  bool loading = false ;
  String error = '' ;

  final formkey = GlobalKey<FormState>() ;
  TextEditingController agencyId = TextEditingController();
  TextEditingController agencyPass = TextEditingController();

  final secureStorage = const FlutterSecureStorage();

  void saveLoginInfo() async{
    await secureStorage.write(key: "AgencyId", value: agencyId.text );
    await secureStorage.write(key: "Password", value: agencyPass.text);
    await secureStorage.write(key: "RememberMe", value: "true");
  }

  Future<bool> retrieveLoginInfo() async{

    bool retrievalSuccess = false ;

    final rememberMe = await secureStorage.read(key: 'RememberMe');

    if(rememberMe == "true") {
      final id = await secureStorage.read(key: "AgencyId");
      final password = await secureStorage.read(key: "Password");

      if (id != null && password != null) {
        setState(() {
          agencyId.text = id;
          agencyPass.text = password;
        });
        retrievalSuccess = true;
      }
    }
    return retrievalSuccess;
  }

  void nextPage () {
    Navigator.pushReplacementNamed(context,"/Nav",arguments: {
      'agencyId': agencyId.text
    });
  }

  void agencyLogin() async{
    if(formkey.currentState!.validate()) {
      setState(() {
        loading = true ;
      });
      int valid = await loginDatabase.isValidUser(id: agencyId.text, pass: agencyPass.text) ;
      if(valid == 2){
        setState(() {
          loading = false ;
          error = "Incorrect Agency Password";
        });
      }
      else if(valid == 3) {
        setState(() {
          loading = false ;
          error = "Incorrect Agency Id";
        });
      }
      else{
        saveLoginInfo();
        nextPage();
      }
    }
  }

  Future<void> autoLogin() async {
    bool valid = await retrieveLoginInfo();

    if(valid) {
      agencyLogin();
    }
  }

  @override
  void initState() {
    autoLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading ? const loadingPage() : Scaffold(
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
                  decoration: textInputDecoration.copyWith(hintText: "Agency Id"),
                  validator: (val) => val == null || val.isEmpty ? "Enter Agency Id" : null,
                  controller: agencyId,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 1.25
                  ),
                  obscureText:true,
                  decoration: textInputDecoration.copyWith(hintText: "Agency Password"),
                  validator: (val) => val == null || val.isEmpty ? "Enter Agency Password" : null ,
                  controller: agencyPass,
                ),
                const SizedBox(height: 15),
                Center(child: Text(error,style: const TextStyle(color: Colors.red,letterSpacing: 1.25,fontSize: 15),)) ,
                const SizedBox(height: 15),
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
                    onPressed:agencyLogin ,
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
                      color: Colors.cyan,
                  ),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, "/register") ,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:Colors.transparent,
                      elevation: 0,
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

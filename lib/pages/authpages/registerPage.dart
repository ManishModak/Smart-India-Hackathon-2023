import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_india_hackathon/commons/commonCode.dart';
import 'package:smart_india_hackathon/commons/loading.dart';
import 'package:smart_india_hackathon/services/agencyServices.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  late String dropDownValue = "FireStation";
  final _formkey = GlobalKey<FormState>() ;
  bool loading = false ;
  AgencyDatabase agencyDatabase = AgencyDatabase();

  TextEditingController agencyName = TextEditingController();
  TextEditingController agencyPass = TextEditingController();
  TextEditingController agencyType = TextEditingController();
  TextEditingController agencyAddress = TextEditingController();
  TextEditingController agencyLocation = TextEditingController();
  TextEditingController agencyDescription = TextEditingController();

  void nextPage(agencyId) {
    Navigator.pushNamed(context,"/success",arguments: {
      'agencyId': agencyId
    });
  }

  void registerAgency() async {
    if(_formkey.currentState!.validate()) {
      setState(() {
        loading = true ;
      });
      String temp = 'empty' ;
      temp = await agencyDatabase.addAgency(
          pass: agencyPass.text,
          name: agencyName.text,
          type: dropDownValue,
          address: agencyAddress.text,
          location: agencyLocation.text,
          description: agencyDescription.text,
      );

      if(temp != 'empty') {
        nextPage(temp);
      }
    }
  }

  @override
  void dispose() {
    agencyName.dispose();
    agencyPass.dispose();
    agencyType.dispose();
    agencyAddress.dispose();
    agencyLocation.dispose();
    agencyDescription.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width ;

    return loading ? const loadingPage() : Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            FontAwesomeIcons.squareCaretLeft
          )
        ),
        title: Container(
          padding: EdgeInsets.fromLTRB((width/11), 0, 0, 0),
          child:const Text("Agency Registration",style: TextStyle(fontSize: 20))
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 45),
                TextFormField(
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 1.25
                  ),
                  decoration: textInputDecoration.copyWith(hintText: "Agency Name"),
                  validator: (val) => val == null || val.isEmpty ? "Enter Agency Id" : null,
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
                  validator: (val) => val == null || val.isEmpty ? "Enter Password" : null,
                  controller: agencyPass,
                ),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.all(1),
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black26,
                      border: Border.all(color: Colors.grey,width: 1)
                  ),
                  child: DropdownButton(
                      underline: const SizedBox(),
                      hint: const Text("Agency Type"),
                      isExpanded: true,
                      value: dropDownValue,
                      icon: const Icon(FontAwesomeIcons.chevronDown),
                      style: const TextStyle(color: Colors.white,fontSize: 18),
                      items: const [
                        DropdownMenuItem<String>(value:"FireStation",child:Text("Fire Station")),
                        DropdownMenuItem<String>(value:"Medical",child:Text("Medical")),
                        DropdownMenuItem<String>(value:"PoliceStation",child:Text("Police Station")),
                        DropdownMenuItem<String>(value:"RTO",child:Text("RTO")),
                      ],
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownValue = newValue! ;
                        });
                      }
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 1.25
                  ),
                  decoration: textInputDecoration.copyWith(hintText: "Agency Address"),
                  validator: (val) => val == null || val.isEmpty ? "Enter Agency Address" : null,
                  controller: agencyAddress,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 1.25
                  ),
                  decoration: textInputDecoration.copyWith(hintText: "Agency Loaction"),
                  validator: (val) => val == null || val.isEmpty ? "Enter Agency Loaction" : null,
                  controller: agencyLocation,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 1.25
                  ),
                  decoration: textInputDecoration.copyWith(hintText: "Agency Description"),
                  validator: (val) => val == null || val.isEmpty ? "Enter Agency Description" : null,
                  controller: agencyDescription,
                ),
                const SizedBox(height: 75),
                Container(
                  width: width-10,
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
                    onPressed: registerAgency,
                    child: const Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 1.25,
                          color: Colors.white
                      ),
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

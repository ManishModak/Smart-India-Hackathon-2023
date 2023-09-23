import "package:cloud_firestore/cloud_firestore.dart";

class LoginDatabase {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser({required String name, required String password}) async {
    Map<String, dynamic> data = {
      "name" : name,
      "password" : password
    };
    await _firestore.collection("Users").doc().set(data);
  }

  //Future<bool> isValidUser({}) async {

  //}

}
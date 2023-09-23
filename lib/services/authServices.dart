import "dart:html";

import "package:cloud_firestore/cloud_firestore.dart";

class LoginDatabase {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser({required String name, required String password}) async {
    DocumentReference doc = _firestore.collection("Users").doc();
    await _firestore.collection("Users").doc(doc.id).set({
      "name" : name,
      "password" : password,
      "id": doc.id
    });
  }

  Future<bool> isValidUser({required String name, required String pass, required String id}) async {
    QuerySnapshot Coll_ref = await _firestore.collection("Users").get();

    for (var doc in Coll_ref.docs){
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      if( data['name'] == name && data['password'] == pass && data['id'] == id){
        return true;
      }
    }
    return false;
  }

}
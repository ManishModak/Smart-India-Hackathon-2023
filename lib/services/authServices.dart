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

  Future<bool> isValidUser({required String id, required String pass}) async {

    CollectionReference collectionReference = _firestore.collection("Users");
    DocumentSnapshot documentSnapshot = await collectionReference.doc(id).get();

    if (documentSnapshot.exists) {

      Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

      if (data["password"] == pass) {
        return true;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  }


  /// Return values meaning:
  /// 1- Deleted Successfully
  /// 2- Password is wrong
  /// 3- User id is wrong

  Future<int> deleteUser({required String id, required String pass}) async {

    CollectionReference collectionReference = _firestore.collection("Users");
    DocumentSnapshot documentSnapshot = await collectionReference.doc(id).get();

    if (documentSnapshot.exists) {

      Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

      if (data["password"] == pass) {
        await collectionReference.doc(id).delete();
        return 1;
      }
      else {
        return 2;
      }
    }
    else {
      return 3;
    }
  }



}
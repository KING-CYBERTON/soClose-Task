import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../DataModel/UserModel.dart';
import 'FirebaseService.dart';

class FireRepo extends GetxController {
  static FireRepo instance = Get.find();

  final _db = FirebaseFirestore.instance;
  //final uid = FirebaseAuth.instance.currentUser?.uid;
  


  createUser(UserData user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar('success', 'Info has been updated',
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.greenAccent.withOpacity(0.2),
              colorText: Colors.black87),
        )
        // ignore: body_might_complete_normally_catch_error
        .catchError((e) {
      Get.snackbar('Error', 'Something went wrong',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.redAccent.withOpacity(0.2),
          colorText: Colors.black);
    });
  }
updateUser(String email, UserData user) {
  FirebaseFirestore.instance
      .collection("Users")
      .where('email', isEqualTo: email)
      .get()
      .then((QuerySnapshot querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          // There should be only one document with the specified email
          var documentID = querySnapshot.docs.first.id;
          
          FirebaseFirestore.instance
              .collection("Users")
              .doc(documentID)
              .update(user.toJson())
              .then((_) {
                Get.snackbar('success', 'Info has been updated',
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.greenAccent.withOpacity(0.2),
                    colorText: Colors.black87);
              })
              .catchError((e) {
                print('Error updating document: $e');
                Get.snackbar('Error', 'Something went wrong',
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.redAccent.withOpacity(0.2),
                    colorText: Colors.black);
              });
        } else {
          // Document with the specified email not found
          print('Document not found for email: $email');
          Get.snackbar('Error', 'Document not found',
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.redAccent.withOpacity(0.2),
              colorText: Colors.black);
        }
      })
      .catchError((e) {
        print('Error querying document: $e');
        Get.snackbar('Error', 'Something went wrong',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.redAccent.withOpacity(0.2),
            colorText: Colors.black);
      });
}

  Future<UserData> getUserData(String email) async {
    if (email == null) {
      throw Exception('Email is null');
    }
    final snapshot =
        await _db.collection('Users').where('email', isEqualTo: email).get();
    final userdetails =
        snapshot.docs.map((e) => UserData.fromSnapshot(e)).single;
         

    return userdetails;
  }



  Future<List<UserData>> allUser() async {
    final snapshot = await _db.collection('Users').get();
    final userdetails =
        snapshot.docs.map((e) => UserData.fromSnapshot(e)).toList();
    return userdetails;
  }

  getUserDetais() {
    var email = FirebaseAuth.instance.currentUser?.email;
    if (email != null) {
      return FireRepo().getUserData(email);
    } else {
      Get.snackbar('error', 'login');
    }
  }
}

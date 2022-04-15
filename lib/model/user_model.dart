import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User_model {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  String? number;

  User_model(
      {this.uid, this.email, this.firstName, this.lastName, this.number});

  //data from server
  factory User_model.fromMap(map) {
    return User_model(
        uid: map['uid'],
        email: map['email'],
        firstName: map['name'],
        lastName: map['last'],
        number: map['number']);
  }
  //sending data to our server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': lastName,
      'number': number,
    };
  }

  update() async {
    User? firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection("users").doc(uid).update({
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': lastName,
      'number': number,
    }).then((_) {
      print("success!");
    });
  }
}

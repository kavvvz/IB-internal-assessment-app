//imports the package and the library class that comes with it
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

///class that contains the functions for authentication using firebase
class FirebaseAuthService{
  //takes an instance of a library class - FirebaseAuth obtained from the package
  FirebaseAuth _auth = FirebaseAuth.instance;

  ///this signs up a new user
  Future<User?> signUpWithEmailAndPassword(String email, String password) async{
    try{
      //uses the function createUserWithEmailAndPassword in a library from the package
      UserCredential credential =
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }catch(e){
      print("failed due to ${e.toString()}"); //catches the error if there is any
    }
    return null;
  }
  ///signs the user in
  Future<User?> signInWithEmailAndPassword(String email, String password) async{
    try{
      //uses the function signInWithEmailAndPassword in a library from the package
      UserCredential credential =
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }catch(e){
      print("failed due to ${e.toString()}"); //catches the error if there is any
    }
    return null;
  }
}

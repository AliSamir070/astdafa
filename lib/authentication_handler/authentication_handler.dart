import 'package:firebase_auth/firebase_auth.dart';

class AuthHandler{
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static Future<UserCredential> register(String email , String password)async{
    return await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }
  static Future<UserCredential> login(String email , String password)async{
    return await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }
  static String? getUser(){
    return firebaseAuth.currentUser?.uid;
  }
}
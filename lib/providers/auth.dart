// ignore_for_file: constant_identifier_names, unused_import

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sbank/util/app_url.dart';
import 'package:sbank/util/shared_preference.dart';
import 'package:sbank/user_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthProvider with ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;
  Status get registeredInStatus => _registeredInStatus;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
User? _user;


  AuthProvider() {
    _auth.authStateChanges().listen((user) {
      _user = user;
      notifyListeners(); // Notify UI about changes
    });
  }

   User? get user => _user;

  bool get isAuthenticated => _user != null;
  // Login User
  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      
            return null; // Success
    } on FirebaseAuthException catch (e) {
      return e.message; // Return error message
    }
  }

  // Logout User
  Future<void> logoutUser() async {
    await _auth.signOut();
  }

  // Get Current User
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<String?> register(
    String name,  String email, String password) async{
 

    _registeredInStatus = Status.Registering;
    notifyListeners();

  
    try {
     UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

       User? user = userCredential.user;

      if (user != null) {
        await _firestore.collection("users").doc(user.uid).set({
          "uid": user.uid,
          "name": name,
          "email": email,
          "createdAt": FieldValue.serverTimestamp(),
        });}
      _registeredInStatus = Status.Registered;
      return null; // Success
    } on FirebaseAuthException catch (e) {
      _registeredInStatus = Status.NotRegistered;
      return e.message; // Return error message
    }
  
  }

 
}

// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:sbank/models/user.dart';

class UserPreferences {
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("userId", user.userId.toInt());
    prefs.setString("name", user.name.toString());
    prefs.setString("email", user.email.toString());
    prefs.setString("phone", user.phone.toString());

    prefs.setString("token", user.token.toString());
    prefs.setString("renewalToken", user.renewalToken.toString());

    return true;
  }

  Future<Map> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int userId = prefs.getInt("userId") ?? 0;
    String name = prefs.getString("name") ?? '';
    String email = prefs.getString("email") ?? '';
    String phone = prefs.getString("phone") ?? '';

    String token = prefs.getString("token") ?? '';
    String renewalToken = prefs.getString("renewalToken") ?? '';
    final Map<String, User> someMap = {
      "user": User(
          userId: userId,
          name: name,
          email: email,
          phone: phone,
          token: token,
          renewalToken: renewalToken)
    };
    return someMap;
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("name");
    prefs.remove("email");
    prefs.remove("phone");
    prefs.remove("type");
    prefs.remove("token");
  }

  Future<String> getToken(args) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return token!.toString();
  }
}

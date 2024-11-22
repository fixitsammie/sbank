// ignore_for_file: constant_identifier_names, unused_import

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sbank/models/user.dart';
import 'package:sbank/util/app_url.dart';
import 'package:sbank/util/shared_preference.dart';
import 'package:sbank/user_preferences.dart';

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

  Future<Map<String, dynamic>> login(String username, String password) async {
    Map<String, dynamic> result = {};
    Map<String, dynamic> responseData = {};
    result = {'status': false};
    final Map<String, dynamic> loginData = {
      'username': username,
      'password': password
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    final response = await post(Uri.parse(AppUrl.login),
        body: json.encode(loginData),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      responseData = json.decode(response.body);
      //print(response.body);

      if (responseData['access'] != null) {
        _loggedInStatus = Status.LoggedIn;
        notifyListeners();
        String jwtAccess = 'JWT ' + responseData['access'];
        final res = await get(
          Uri.parse(AppUrl.profile),
          headers: {
            'Content-Type': 'application/json',
            "Authorization": jwtAccess
          },
        );
        if (res.statusCode == 200) {
          print(json.decode(res.body));
          final Map<String, dynamic> tempUser = json.decode(res.body);

          var userData = tempUser['data'];
          print(tempUser['username']);
          const int nu = 12;
          responseData['id'] = nu;
          //TODO: change ID to string
          responseData['name'] = tempUser['username'];
          responseData['email'] = tempUser['email'];
          responseData['phone'] = '';
          responseData['type'] = '';
          responseData['access_token'] = responseData['access'];

          responseData['renewal_token'] = responseData['refresh'];

          User authUser = User.fromJson(responseData);
          print('Next line is auth user');
          print(authUser);
          UserPreferences().saveUser(authUser);
          _loggedInStatus = Status.LoggedIn;
          notifyListeners();
          //  result = {'status': true, 'message': 'Successful', 'user': authUser};
          result = {'status': true, 'message': 'Successful', 'user': authUser};
        } else {
          result = {'status': false, 'message': 'unsuccessful'};
        }
      } else {
        result = {'status': false, 'message': 'unsuccessful'};
      }
    }
    print(result);
    return result;
  }

  Future<Map<String, dynamic>> register(
      String username, String password, String passwordConfirmation) {
    final Map<String, dynamic> registrationData = {
      'username': username,
      'password': password,
      're_password': passwordConfirmation
    };

    _registeredInStatus = Status.Registering;
    notifyListeners();

    final resp = post(Uri.parse(AppUrl.register),
            body: json.encode(registrationData),
            headers: {'Content-Type': 'application/json'})
        .then(onValue)
        .catchError(onError);
    return resp;
  }

  Future<Map<String, dynamic>> onValue(Response response) async {
    final Map<String, Object> result;
    //   final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 201) {
      //  var userData = responseData['data'];

      //  User authUser = User.fromJson(userData);

      //  UserPreferences().saveUser(authUser);
      result = {
        'status': true,
        'message': 'Successfully registered',
      };
      _loggedInStatus = Status.Registered;
      notifyListeners();
    } else {
      result = {
        'status': false,
        'message': 'Registration failed',
        //    'data': responseData
      };
    }

    return result;
  }

  static onError(error) {
    // ignore: avoid_print
    print("the error is onError ");
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}

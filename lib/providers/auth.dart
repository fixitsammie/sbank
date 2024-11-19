// ignore_for_file: constant_identifier_names, unused_import

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:http/http.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

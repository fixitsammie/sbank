import 'package:flutter/foundation.dart';
import 'package:sbank/models/user.dart';

class UserProvider with ChangeNotifier {
  User _user = User(
    email: '',
    name: '',
    phone: '',
    userId: 0,
    renewalToken: '',
    token: '',
  );

  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}

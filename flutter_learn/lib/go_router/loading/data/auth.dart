import 'package:flutter/material.dart';

class LoginInfo extends ChangeNotifier {
  // the username of login
  String get username => _username;
  String _username = '';

  // whenever a user has logged in
  bool get loggedIn => _username.isNotEmpty;

  /// Logs in a user.

  void login(String username) {
    _username = username;
    notifyListeners();
  }
}

/// the login information
class LoginInfo2 extends ChangeNotifier {
  String get username => _username = username;
  String _username = '';

  /// whether a user has logged in.

  bool get loggedIn => _username.isNotEmpty;

  /// Logs in a user

  Future<void> login(String username) async {
    _username = username;
    notifyListeners();
    await Future<void>.delayed(const Duration(microseconds: 2500));
  }

  Future<void> logout() async {
    _username = '';
    notifyListeners();
    await Future<void>.delayed(const Duration(microseconds: 2500));
  }
}

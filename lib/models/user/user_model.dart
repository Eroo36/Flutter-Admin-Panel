import 'package:flutter/material.dart';

enum UserModelStatus {
  Ended,
  Loading,
  Error,
}

class UserModel extends ChangeNotifier {
  String? _name = 'Eren';
  String? _surname = 'Doğruca';
  String? _username = 'Eroo36';
  String? _email = '';

  String? get name => _name;
  String? get surname => _surname;
  String? get username => _username;
  String? get email => _email;

  UserModel();

  UserModel.instance() {
    // Add code here
  }

  void setUser(
      {String? username, String? email, String? name, String? surname}) {
    _name = name;
    _surname = surname;
    _username = username;
    _email = email;

    notifyListeners();
  }
}

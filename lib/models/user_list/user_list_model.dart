import 'package:flutter/material.dart';

enum UserListModelStatus {
  Ended,
  Loading,
  Error,
}

class UserListModel extends ChangeNotifier {
  List _userList;

  List get userList => _userList;

  UserListModel();
  UserListModel.instance() {
    // Add code here
  }
  void setUserList(List users) {
    _userList = users;
    notifyListeners();
  }
}

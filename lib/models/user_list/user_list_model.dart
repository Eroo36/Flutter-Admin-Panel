import 'package:flutter/material.dart';

enum UserListModelStatus {
  Ended,
  Loading,
  Error,
}

class AUserModel {
  // ignore: prefer_final_fields
  String? name = 'Eren';
  // ignore: prefer_final_fields
  String? surname = 'Doğruca';
  // ignore: prefer_final_fields
  String? username = 'Eroo36';
  // ignore: prefer_final_fields
  String? email = '';

  AUserModel(this.email, this.name, this.surname, this.username);

  AUserModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        surname = json['surname'],
        username = json['username'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'surname': surname,
        'email': email,
      };
}

class UserListModel extends ChangeNotifier {
  List<AUserModel>? _userList;

  List? get userList => _userList;

  UserListModel();
  UserListModel.instance() {
    // Add code here
  }
  void setUserList(List<AUserModel>? users) {
    _userList = users;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'package:admin_panel_flutter/models/user_list/user_list_model.dart';

class UserListController {
  UserListController();

  void setUsers(BuildContext context, List users) {
    var viewModel = Provider.of<UserListModel>(context, listen: false);
    viewModel.setUserList(users);
  }

  List<dynamic> getUsers(BuildContext context) {
    var viewModel = Provider.of<UserListModel>(context, listen: false);
    return viewModel.userList;
  }
}

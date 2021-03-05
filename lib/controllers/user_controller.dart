import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'package:admin_panel_flutter/models/user/user_model.dart';

class UserController {
  UserController();

  void setUserDetail(BuildContext context, String username, String email,
      String name, String surname) {
    var viewModel = Provider.of<UserModel>(context, listen: false);

    viewModel.setUser(
        username: username, email: email, name: name, surname: surname);
  }

  void setUsername(BuildContext context, String username) {
    var viewModel = Provider.of<UserModel>(context, listen: false);

    viewModel.setUser(username: username);
  }
}

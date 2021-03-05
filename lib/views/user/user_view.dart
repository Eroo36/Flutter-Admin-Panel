import 'package:admin_panel_flutter/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'package:admin_panel_flutter/models/user/user_model.dart';
// import controller

class UserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _userController = UserController();
    
    return ChangeNotifierProvider<UserModel>(
      create: (context) => UserModel.instance(),
      child: Consumer<UserModel>(
        builder: (context, viewModel, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              columnWidths: {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(1),
              },
              border: TableBorder.all(color: Colors.grey[500]),
              children: [
                TableRow(children: [Text('a'), Text('a')]),
                TableRow(children: [Text('a'), Text('a')])
              ],
            ),
          );
        },
      ),
    );
  }
}

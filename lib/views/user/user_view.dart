import 'package:admin_panel_flutter/controllers/user_controller.dart';
import 'package:admin_panel_flutter/controllers/user_list/user_list_controller.dart';
import 'package:admin_panel_flutter/helper/api.dart';
import 'package:admin_panel_flutter/models/user_list/user_list_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'package:admin_panel_flutter/models/user/user_model.dart';

var api = ApiBaseHelper();

class UserView extends StatefulWidget {
  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final ScrollController _controllerOne = ScrollController();
  List? userList;
  var userListController = UserListController();

  Future<List?> getUsersList() async {
    var newUserList = await api.getUsers();

    return newUserList;
  }

  @override
  void initState() {
    getUsersList().then((newUserList) {
      userListController.setUsers(context, newUserList);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserListModel>(
      builder: (context, viewModel, child) {
        final rows = <TableRow>[
          TableRow(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText('Username'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText('Name'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText('Surname'),
            )
          ]),
        ];
        if (viewModel.userList != null) {
          for (var rowData in viewModel.userList!) {
            rows.add(TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(rowData['name']),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(rowData['surname']),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(rowData['email']),
              )
            ]));
          }
          return Scrollbar(
            controller: _controllerOne,
            isAlwaysShown: true,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                controller: _controllerOne,
                children: [
                  Table(
                    columnWidths: {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(1),
                    },
                    border: TableBorder.all(color: Colors.grey[500]!),
                    children: rows,
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

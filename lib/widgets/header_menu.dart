import 'package:admin_panel_flutter/controllers/user_controller.dart';
import 'package:admin_panel_flutter/helper/api.dart';
import 'package:admin_panel_flutter/helper/shared_preferences.dart';
import 'package:admin_panel_flutter/helper/sizes.dart';
import 'package:admin_panel_flutter/models/user/user_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var api = ApiBaseHelper();
    return Consumer<UserModel>(
      builder: (context, user, a) {
        var userController = UserController();
        return Container(
          constraints: BoxConstraints(minHeight: 58),
          height: displayHeight(context) / 12,
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.red[300], Colors.orange])),
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [AutoSizeText(user.username)],
            ),
          ),
        );
      },
    );
  }
}

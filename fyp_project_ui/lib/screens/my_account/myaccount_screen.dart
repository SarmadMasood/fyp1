import 'package:flutter/material.dart';
import 'package:fyp_project_ui/components/coustom_bottom_nav_bar.dart';
import 'package:fyp_project_ui/enums.dart';
import 'package:fyp_project_ui/models/LocalUser.dart';

import 'components/body.dart';

class AccountScreen extends StatelessWidget {
  final Map<String, dynamic>? localUser;

  AccountScreen({this.localUser});

  static String routeName = "/account";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}

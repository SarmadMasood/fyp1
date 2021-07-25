import 'package:flutter/material.dart';
import 'package:fyp_project_ui/screens/settings/settings_screen.dart';

import 'account_menu.dart';
import 'account_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          AccountPic(),
          SizedBox(height: 20),
          AccountMenu(
            text: "Arslan Warraich",
            icon: "assets/icons/user-icon.svg",
            press: () => {},
          ),
          AccountMenu(
            text: "arslan@gmail.com",
            icon: "assets/icons/Mail.svg",
            press: () {},
          ),
          AccountMenu(
            text: "14 August 1998",
            icon: "assets/icons/calendar.svg",
            press: () {},
          ),
          AccountMenu(
            text: "O Negative",
            icon: "assets/icons/blood-type.svg",
            press: () {},
          ),
          AccountMenu(
            text: "Schizopherinia",
            icon: "assets/icons/ailment.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

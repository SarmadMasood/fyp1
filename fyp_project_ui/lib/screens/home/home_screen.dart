import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp_project_ui/components/coustom_bottom_nav_bar.dart';
import 'package:fyp_project_ui/components/my_bottom_nav_bar.dart';
import 'package:fyp_project_ui/enums.dart';
import 'package:fyp_project_ui/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
    );
  }
}

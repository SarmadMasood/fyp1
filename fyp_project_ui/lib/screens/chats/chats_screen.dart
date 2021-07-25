import 'package:flutter/material.dart';
import 'package:fyp_project_ui/components/coustom_bottom_nav_bar.dart';
import 'package:fyp_project_ui/constants.dart';
import 'package:fyp_project_ui/enums.dart';

import 'components/body.dart';

class ChatsScreen extends StatefulWidget {
  static String routeName = "/chats";
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        child: Icon(
          Icons.person_add_alt_1,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.message),
    );
  }

  // BottomNavigationBar buildBottomNavigationBar() {
  //   return BottomNavigationBar(
  //     type: BottomNavigationBarType.fixed,
  //     currentIndex: _selectedIndex,
  //     onTap: (value) {
  //       setState(() {
  //         _selectedIndex = value;
  //       });
  //     },
  //     items: [
  //       BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chats"),
  //       BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
  //       BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
  //       BottomNavigationBarItem(
  //         icon: CircleAvatar(
  //           radius: 14,
  //           backgroundImage: AssetImage("assets/images/user_2.png"),
  //         ),
  //         label: "Profile",
  //       ),
  //     ],
  //   );
  // }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text("Chats"),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }
}

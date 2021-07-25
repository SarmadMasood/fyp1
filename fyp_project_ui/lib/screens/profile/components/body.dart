import 'package:flutter/material.dart';
import 'package:fyp_project_ui/screens/my_account/myaccount_screen.dart';
import 'package:fyp_project_ui/screens/settings/settings_screen.dart';
import 'package:fyp_project_ui/screens/sign_in/sign_in_screen.dart';
import 'package:fyp_project_ui/services/auth_service.dart';
import 'package:fyp_project_ui/models/LocalUser.dart';
import 'package:fyp_project_ui/screens/settings/settings_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  final AuthService service = AuthService();
  FirebaseAuth auth = FirebaseAuth.instance;
  final usersRef = FirebaseDatabase.instance.reference().child('Users');
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/user-icon.svg",
            press: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AccountScreen(),
                ),
              )
            },
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(),
                ),
              );
            },
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              dynamic status = service.signOut();
              if (status == null) {
                print("Signout unsuccessful");
              } else {
                LocalUser? localUser;
                User? currentUser = auth.currentUser;
                usersRef
                    .child(currentUser!.uid)
                    .once()
                    .then((DataSnapshot snapshot) {
                  Map<String, dynamic> localUser = snapshot.value;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AccountScreen(
                              localUser: localUser,
                            )),
                  );
                });
              }
            },
          ),
        ],
      ),
    );
  }
}

// @dart=2.9
import 'package:flutter/material.dart';
import 'package:fyp_project_ui/constants.dart';
import 'package:fyp_project_ui/routes.dart';
import 'package:fyp_project_ui/screens/home/home_screen.dart';
import 'package:fyp_project_ui/screens/sign_in/sign_in_screen.dart';
import 'package:fyp_project_ui/screens/sign_up/sign_up_screen.dart';
import 'package:fyp_project_ui/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FYP Flutter UI',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
      ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}

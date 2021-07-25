import 'package:flutter/widgets.dart';
import 'package:fyp_project_ui/screens/chats/chats_screen.dart';
// import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
// import 'package:shop_app/screens/details/details_screen.dart';
import 'package:fyp_project_ui/screens/forgot_password/forgot_password_screen.dart';
import 'package:fyp_project_ui/screens/home/home_screen.dart';
// import 'package:fyp_project_ui/screens/login_success/login_success_screen.dart';
import 'package:fyp_project_ui/screens/otp/otp_screen.dart';
import 'package:fyp_project_ui/screens/profile/profile_screen.dart';
import 'package:fyp_project_ui/screens/sign_in/sign_in_screen.dart';
import 'package:fyp_project_ui/screens/splash/splash_screen.dart';
import 'package:fyp_project_ui/screens/patient_details/patient_details_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  // CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  // DetailsScreen.routeName: (context) => DetailsScreen(),
  ChatsScreen.routeName: (context) => ChatsScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  PatientDetailsScreen.routeName: (context) => PatientDetailsScreen(),
};

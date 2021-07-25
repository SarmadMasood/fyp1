import 'package:flutter/material.dart';
import 'package:fyp_project_ui/helper/phoneNumberArgs.dart';
import 'package:fyp_project_ui/size_config.dart';

import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PhoneArguments;
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: Body(args.phone),
    );
  }
}

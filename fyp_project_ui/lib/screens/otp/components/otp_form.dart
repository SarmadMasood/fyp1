import 'package:flutter/material.dart';
import 'package:fyp_project_ui/components/default_button.dart';
import 'package:fyp_project_ui/helper/phoneNumberArgs.dart';
import 'package:fyp_project_ui/services/auth_service.dart';
import 'package:fyp_project_ui/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_project_ui/helper/keyboard.dart';
import 'package:fyp_project_ui/screens/home/home_screen.dart';

import '../../../constants.dart';

Future<String>? verificationId;

class OtpForm extends StatefulWidget {
  final String phoneNumber;
  const OtpForm({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  FocusNode? pin5FocusNode;
  FocusNode? pin6FocusNode;

  @override
  void initState() {
    super.initState();
    final AuthService service = AuthService();
    verificationId = service.verifyPhoneNumber(context, widget.phoneNumber);
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    pin5FocusNode!.dispose();
    pin6FocusNode!.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    String? code;
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight! * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  autofocus: true,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode!);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin3FocusNode!),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin4FocusNode!),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin5FocusNode!),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  focusNode: pin5FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin6FocusNode!),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  focusNode: pin6FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) async {
                    if (value.length == 1) {
                      pin6FocusNode!.unfocus();
                      // Then you need to check is the code is correct or not
                      code = value;
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: verificationId!.toString(),
                              smsCode: value);
                      if (credential.smsCode == value) {
                        KeyboardUtil.hideKeyboard(context);
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      } else {
                        // Navigator.pushNamed(context, HomeScreen.routeName);
                      }
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.15),
          SizedBox(
            width: double.infinity,
            height: getProportionateScreenHeight(56),
            child: TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor: kPrimaryColor),
              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              // color: kPrimaryColor,
              onPressed: () {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: verificationId!.toString(), smsCode: code!);
                if (credential.smsCode == code) {
                  KeyboardUtil.hideKeyboard(context);
                  Navigator.pushNamed(context, HomeScreen.routeName);
                } else {
                  // Navigator.pushNamed(context, HomeScreen.routeName);
                }
              },
              child: Text(
                "Continue",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.1),
          GestureDetector(
            onTap: () async {
              await FirebaseAuth.instance.verifyPhoneNumber(
                phoneNumber: widget.phoneNumber,
                verificationCompleted: (PhoneAuthCredential credential) {},
                verificationFailed: (FirebaseAuthException e) {},
                codeSent: (String verificationId, int? resendToken) {},
                codeAutoRetrievalTimeout: (String verificationId) {},
              );
            },
            child: Text(
              "Resend OTP Code",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }
}

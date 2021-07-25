import 'package:flutter/material.dart';
import 'package:fyp_project_ui/components/custom_surfix_icon.dart';
import 'package:fyp_project_ui/components/default_button.dart';
import 'package:fyp_project_ui/components/form_error.dart';
import 'package:fyp_project_ui/constants.dart';
import 'package:fyp_project_ui/helper/phoneNumberArgs.dart';
import 'package:fyp_project_ui/models/LocalUser.dart';
import 'package:fyp_project_ui/screens/home/home_screen.dart';
import 'package:fyp_project_ui/screens/otp/otp_screen.dart';
import 'package:fyp_project_ui/size_config.dart';
import 'package:fyp_project_ui/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class PatientDetailsForm extends StatefulWidget {
  @override
  _PatientDetailsFormState createState() => _PatientDetailsFormState();
}

class _PatientDetailsFormState extends State<PatientDetailsForm> {
  final AuthService service = AuthService();
  final usersRef = FirebaseDatabase.instance.reference().child('Users');
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? dob;
  String? bloodtype;
  String? ailment;
  String? password;
  String? confirm_password;
  bool remember = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  final List<String> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error!);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PhoneArguments;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildDOBFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildBloodFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAilmentFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
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
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  User? currentuser = auth.currentUser;
                  // LocalUser localUser = LocalUser(
                  //     currentuser!.uid,
                  //     name!,
                  //     currentuser.email!,
                  //     args.phone,
                  //     dob!,
                  //     bloodtype!,
                  //     ailment!);
                  // print(localUser);
                  usersRef.child(currentuser!.uid).set({
                    'name': name!,
                    'email': currentuser.email,
                    'phone': args.phone,
                    'dob': dob,
                    'bloodtype': bloodtype,
                    'ailment': ailment
                  }).whenComplete(() => {
                        Navigator.pushNamed(context, OtpScreen.routeName,
                            arguments: PhoneArguments(args.phone))
                      });
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
          // DefaultButton(
          //   text: "Continue",
          //   press: () {
          //     if (_formKey.currentState!.validate()) {
          //       _formKey.currentState!.save();
          //       // if all are valid then go to success screen
          //       Navigator.pushNamed(context, HomeScreen.routeName);
          //     }
          //   },
          // ),
        ],
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          name = value;
        }
      },
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Enter patient's name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/user-icon.svg"),
      ),
    );
  }

  TextFormField buildBloodFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => bloodtype = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          bloodtype = value;
        }
      },
      decoration: InputDecoration(
        labelText: "Blood Type",
        hintText: "Enter patient's blood group",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/blood-type.svg"),
      ),
    );
  }

  TextFormField buildAilmentFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => ailment = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          ailment = value;
        }
      },
      decoration: InputDecoration(
        labelText: "Ailment",
        hintText: "Enter patient's ailment",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/ailment.svg"),
      ),
    );
  }

  TextFormField buildDOBFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => dob = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          dob = value;
        }
      },
      decoration: InputDecoration(
        labelText: "Date of Birth",
        hintText: "Enter patient's date of birth",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/calendar.svg"),
      ),
    );
  }
}

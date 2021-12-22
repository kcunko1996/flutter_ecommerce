import 'package:flutter/material.dart';
import 'package:flutter_exommerce/components/deafult_button.dart';
import 'package:flutter_exommerce/components/form_error.dart';
import 'package:flutter_exommerce/constants.dart';
import 'package:flutter_exommerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_exommerce/screens/login_success/login_success_screen.dart';
import 'package:flutter_exommerce/screens/otp/otp_screen.dart';
import 'package:flutter_exommerce/size_config.dart';
import 'package:flutter_svg/svg.dart';

class CompleteProfileForm extends StatefulWidget {
  CompleteProfileForm({Key? key}) : super(key: key);

  @override
  State<CompleteProfileForm> createState() => _SignFormState();
}

class _SignFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();

  final List<String> errors = [];
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildFirstName(),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              buildLastName(),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              buildPhoneFromField(),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              buildAddressFromField(),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              FormError(
                errors: errors,
              ),
              SizedBox(
                height: getProportionateScreenHeight(32),
              ),
              DeafultButton(
                  text: "Continue",
                  press: () {
                    // if (_formKey.currentState!.validate()) {
                    //   _formKey.currentState!.save();
                    // }
                    Navigator.of(context).pushNamed(OtpScreen.routeNmae);
                  }),
            ],
          )),
    );
  }

  TextFormField buildFirstName() {
    return TextFormField(
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
        }

        return null;
      },
      decoration: InputDecoration(
          hintText: "Enter your first name",
          labelText: "First Name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: EdgeInsets.fromLTRB(
                0,
                getProportionateScreenWidth(20),
                getProportionateScreenWidth(20),
                getProportionateScreenWidth(20)),
            child: SvgPicture.asset(
              "assets/icons/User.svg",
              height: getProportionateScreenHeight(18),
            ),
          )),
    );
  }

  TextFormField buildLastName() {
    return TextFormField(
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
        }

        return null;
      },
      decoration: InputDecoration(
          hintText: "Enter your last name",
          labelText: "Last Name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: EdgeInsets.fromLTRB(
                0,
                getProportionateScreenWidth(20),
                getProportionateScreenWidth(20),
                getProportionateScreenWidth(20)),
            child: SvgPicture.asset(
              "assets/icons/User.svg",
              height: getProportionateScreenHeight(18),
            ),
          )),
    );
  }

  TextFormField buildPhoneFromField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: "Enter your phone number",
          labelText: "Phone Number",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: EdgeInsets.fromLTRB(
                0,
                getProportionateScreenWidth(20),
                getProportionateScreenWidth(20),
                getProportionateScreenWidth(20)),
            child: SvgPicture.asset(
              "assets/icons/Phone.svg",
              height: getProportionateScreenHeight(18),
            ),
          )),
    );
  }

  TextFormField buildAddressFromField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: "Enter your address",
          labelText: "Address",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: EdgeInsets.fromLTRB(
                0,
                getProportionateScreenWidth(20),
                getProportionateScreenWidth(20),
                getProportionateScreenWidth(20)),
            child: SvgPicture.asset(
              "assets/icons/Phone.svg",
              height: getProportionateScreenHeight(18),
            ),
          )),
    );
  }
}

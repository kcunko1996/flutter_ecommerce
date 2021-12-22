import 'package:flutter/material.dart';
import 'package:flutter_exommerce/components/deafult_button.dart';
import 'package:flutter_exommerce/components/form_error.dart';
import 'package:flutter_exommerce/constants.dart';
import 'package:flutter_exommerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_exommerce/screens/login_success/login_success_screen.dart';
import 'package:flutter_exommerce/size_config.dart';
import 'package:flutter_svg/svg.dart';

class SignForm extends StatefulWidget {
  SignForm({Key? key}) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();

  final List<String> errors = [];
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildEmailFromField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            buildPasswordFromField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            FormError(
              errors: errors,
            ),
            Row(
              children: [
                Checkbox(
                    value: remember,
                    activeColor: kPrimaryColor,
                    onChanged: (onChanged) {
                      setState(() {
                        remember = !remember;
                      });
                    }),
                Text("Remember me"),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(ForgotPassword.rotuteName);
                  },
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            DeafultButton(
                text: "Continue",
                press: () {
                  // if (_formKey.currentState!.validate()) {
                  //   _formKey.currentState!.save();
                  // }
                  Navigator.of(context).pushNamed(LoginSuccess.rotuteName);
                }),
          ],
        ));
  }

  TextFormField buildPasswordFromField() {
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
          hintText: "Enter your password",
          labelText: "Password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: EdgeInsets.fromLTRB(
                0,
                getProportionateScreenWidth(20),
                getProportionateScreenWidth(20),
                getProportionateScreenWidth(20)),
            child: SvgPicture.asset(
              "assets/icons/Lock.svg",
              height: getProportionateScreenHeight(18),
            ),
          )),
    );
  }

  TextFormField buildEmailFromField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
        }

        return null;
      },
      decoration: InputDecoration(
          hintText: "Enter your email",
          labelText: "Email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: EdgeInsets.fromLTRB(
                0,
                getProportionateScreenWidth(20),
                getProportionateScreenWidth(20),
                getProportionateScreenWidth(20)),
            child: SvgPicture.asset(
              "assets/icons/Mail.svg",
              height: getProportionateScreenHeight(18),
            ),
          )),
    );
  }
}

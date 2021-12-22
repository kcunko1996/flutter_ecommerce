import 'package:flutter/material.dart';
import 'package:flutter_exommerce/components/deafult_button.dart';
import 'package:flutter_exommerce/constants.dart';
import 'package:flutter_exommerce/screens/complete_profile/complete_profile_screen.dart';
import 'package:flutter_exommerce/screens/sign_in/components/body.dart';
import 'package:flutter_exommerce/size_config.dart';
import 'package:flutter_svg/svg.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);
  static String routeName = 'Sign-up';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Text(
                "Welcome Back",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Sign in with your email and password \nor continue with social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              SignUpForm()
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  final List<String> errors = [];
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)),
        child: Column(
          children: [
            buildEmailFromField(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            buildPasswordFromField(
                text: "Password", hintText: "Enter your password"),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            buildPasswordFromField(
                text: "Confirm Password", hintText: "Re-enter your password"),
            SizedBox(
              height: SizeConfig.screenHeight * 0.07,
            ),
            DeafultButton(
                text: "Continue",
                press: () {
                  Navigator.of(context).pushNamed(CompleteProfile.routeName);
                }),
            SizedBox(
              height: SizeConfig.screenHeight * 0.07,
            ),
            CustomSocialItemButtons(),
            SizedBox(
              height: SizeConfig.screenHeight * 0.02,
            ),
            Text(
              "By continuing your confirm that you agree \nwith our Tearm and Condition",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  TextFormField buildPasswordFromField({text, hintText}) {
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
          hintText: hintText,
          labelText: text,
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

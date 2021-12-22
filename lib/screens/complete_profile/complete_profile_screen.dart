import 'package:flutter/material.dart';
import 'package:flutter_exommerce/constants.dart';
import 'package:flutter_exommerce/screens/complete_profile/components/CompleteProfileForm.dart';
import 'package:flutter_exommerce/screens/sign_in/components/SignInForm.dart';
import 'package:flutter_exommerce/screens/sign_up/sign_up_screen.dart';
import 'package:flutter_exommerce/size_config.dart';
import 'package:flutter_svg/svg.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({Key? key}) : super(key: key);
  static String routeName = 'complete-profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Text(
                  "Complete Profile",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Complete your details or continue \nwith social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(40),
                ),
                CompleteProfileForm(),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Text(
                  "By continuing your confirm that you agree \nwith our Tearm and Condition",
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account? ",
            style: TextStyle(fontSize: getProportionateScreenWidth(16))),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(SignUp.routeName);
          },
          child: Text("Sign up ",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(16),
                  color: kPrimaryColor)),
        ),
      ],
    );
  }
}

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key? key,
    required this.svg,
    required this.press,
  }) : super(key: key);
  final String svg;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(12)),
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        height: getProportionateScreenHeight(40),
        width: getProportionateScreenWidth(40),
        decoration:
            BoxDecoration(color: Color(0xFFF5F6F9), shape: BoxShape.circle),
        child: SvgPicture.asset(svg),
      ),
    );
  }
}

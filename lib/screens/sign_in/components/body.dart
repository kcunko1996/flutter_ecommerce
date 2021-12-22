import 'package:flutter/material.dart';
import 'package:flutter_exommerce/constants.dart';
import 'package:flutter_exommerce/screens/sign_in/components/SignInForm.dart';
import 'package:flutter_exommerce/screens/sign_up/sign_up_screen.dart';
import 'package:flutter_exommerce/size_config.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
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
              height: getProportionateScreenHeight(80),
            ),
            SignForm(),
            SizedBox(
              height: getProportionateScreenHeight(80),
            ),
            CustomSocialItemButtons(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            NoAccountText(),
          ],
        ),
      ),
    ));
  }
}

class CustomSocialItemButtons extends StatelessWidget {
  const CustomSocialItemButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialCard(
          svg: "assets/icons/google-icon.svg",
          press: () {},
        ),
        SocialCard(
          svg: "assets/icons/facebook-2.svg",
          press: () {},
        ),
        SocialCard(
          svg: "assets/icons/twitter.svg",
          press: () {},
        ),
      ],
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

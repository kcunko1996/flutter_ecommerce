import 'package:flutter/material.dart';
import 'package:flutter_exommerce/constants.dart';
import 'package:flutter_exommerce/screens/otp/components/otp_form.dart';
import 'package:flutter_exommerce/screens/sign_in/components/body.dart';
import 'package:flutter_exommerce/size_config.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);
  static String routeNmae = 'otp-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Text(
              "OTP Verification",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenHeight(28),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "We sent your code to + 1 898 860 ***",
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "This code will expire in ",
                  textAlign: TextAlign.center,
                ),
                TweenAnimationBuilder(
                    tween: Tween(begin: 30.0, end: 0),
                    duration: Duration(seconds: 30),
                    builder: (ctx, num value, child) => Text(
                          " 00:${value.toStringAsFixed(0)}",
                          style: TextStyle(color: kPrimaryColor),
                        ))
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
              ),
              child: OtpForm(),
            ),
            Spacer(),
            Text(
              "Resend OTP Code",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

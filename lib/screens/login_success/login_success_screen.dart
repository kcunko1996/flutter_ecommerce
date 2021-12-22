import 'package:flutter/material.dart';
import 'package:flutter_exommerce/components/deafult_button.dart';
import 'package:flutter_exommerce/screens/home/home_screen.dart';
import 'package:flutter_exommerce/screens/sign_in/components/body.dart';
import 'package:flutter_exommerce/size_config.dart';
import 'package:flutter_svg/svg.dart';

class LoginSuccess extends StatelessWidget {
  const LoginSuccess({Key? key}) : super(key: key);
  static String rotuteName = '/success-login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Success"),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.04,
              ),
              Image.asset(
                "assets/images/success.png",
                height: SizeConfig.screenHeight * 0.4,
              ),
              Text(
                "Login Sucess",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              SizedBox(
                  width: SizeConfig.screenWidth * 0.6,
                  child: DeafultButton(
                      text: "Back to Home",
                      press: () {
                        Navigator.of(context).pushNamed(HomeScreen.routeName);
                      })),
              Spacer()
            ],
          ),
        ));
  }
}

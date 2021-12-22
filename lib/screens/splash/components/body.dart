import 'package:flutter/material.dart';
import 'package:flutter_exommerce/components/deafult_button.dart';

import 'package:flutter_exommerce/constants.dart';
import 'package:flutter_exommerce/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_exommerce/screens/splash/components/splash_content.dart';
import 'package:flutter_exommerce/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var currentPge = 0;

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> splashData = [
      {
        "text": "Welcome to Tokoto, Let's go shop!",
        "image": "assets/images/splash_1.png"
      },
      {
        "text":
            "We help people conect with store \naround United State of America",
        "image": "assets/images/splash_2.png"
      },
      {
        "text": "We show the easy way to shop. \nJust stay at home with us",
        "image": "assets/images/splash_3.png"
      },
    ];
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: splashData.length,
                onPageChanged: (value) => setState(() {
                  currentPge = value;
                }),
                itemBuilder: (ctx, index) => SplashContent(
                  text: splashData[index]['text'] as String,
                  image: splashData[index]['image'] as String,
                ),
              )),
          Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index),
                      ),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                    DeafultButton(
                      text: "Continue",
                      press: () {
                        Navigator.of(context).pushNamed(SignIn.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ))
        ],
      ),
    ));
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      key: ValueKey(index),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPge == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPge == index ? kPrimaryColor : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_exommerce/screens/splash/components/body.dart';
import 'package:flutter_exommerce/size_config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = '/splash';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // appBar: AppBar(),
      body: Body(),
    );
  }
}

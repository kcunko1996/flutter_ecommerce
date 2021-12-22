import 'package:flutter/material.dart';
import 'package:flutter_exommerce/screens/sign_in/components/body.dart';
import 'package:flutter_exommerce/size_config.dart';

class SignIn extends StatelessWidget {
  static const routeName = 'signIn';
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Sign In",
          ),
        ),
        body: Body());
  }
}

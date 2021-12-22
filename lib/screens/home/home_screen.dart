import 'package:flutter/material.dart';
import 'package:flutter_exommerce/enum.dart';
import 'package:flutter_exommerce/screens/Home/components/body.dart';
import 'package:flutter_exommerce/screens/profile/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNavigation(
        menuState: MenuState.home,
      ),
    );
  }
}

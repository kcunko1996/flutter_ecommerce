import 'package:flutter/material.dart';
import 'package:flutter_exommerce/constants.dart';
import 'package:flutter_exommerce/enum.dart';
import 'package:flutter_exommerce/screens/home/home_screen.dart';
import 'package:flutter_exommerce/screens/profile/components/body.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Body(),
      bottomNavigationBar: BottomNavigation(menuState: MenuState.profile),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.menuState,
  }) : super(key: key);
  final menuState;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFDAFAFA).withOpacity(0.15),
              offset: Offset(0, -15),
              blurRadius: 20,
            )
          ]),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                },
                icon: SvgPicture.asset(
                  "assets/icons/Shop Icon.svg",
                  color: menuState == MenuState.home
                      ? kPrimaryColor
                      : kSecondaryColor,
                )),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/Heart Icon.svg",
                    color: menuState == MenuState.favourite
                        ? kPrimaryColor
                        : kSecondaryColor)),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/Chat bubble Icon.svg",
                    color: menuState == MenuState.message
                        ? kPrimaryColor
                        : kSecondaryColor)),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ProfileScreen.routeName);
                },
                icon: SvgPicture.asset("assets/icons/User Icon.svg",
                    color: menuState == MenuState.profile
                        ? kPrimaryColor
                        : kSecondaryColor))
          ],
        ),
      ),
    );
  }
}

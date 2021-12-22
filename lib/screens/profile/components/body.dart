import 'package:flutter/material.dart';
import 'package:flutter_exommerce/constants.dart';
import 'package:flutter_exommerce/size_config.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        ProfilePic(),
        SizedBox(
          height: 20,
        ),
        ProfileMenu(
          icon: "assets/icons/User Icon.svg",
          text: "My Account",
        ),
        ProfileMenu(
          icon: "assets/icons/Bell.svg",
          text: "Notifications",
        ),
        ProfileMenu(
          icon: "assets/icons/Question mark.svg",
          text: "Settings",
        ),
        ProfileMenu(
          icon: "assets/icons/Settings.svg",
          text: "Help Center",
        ),
        ProfileMenu(
          icon: "assets/icons/Log out.svg",
          text: "Log Out",
        )
      ],
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text, icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenHeight(10)),
      child: FlatButton(
          onPressed: () {},
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Color(0xFFF5F6F9),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: 22,
                color: kPrimaryColor,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Text(
                text,
                style: Theme.of(context).textTheme.bodyText1,
              )),
              Icon(Icons.arrow_forward_ios)
            ],
          )),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(115),
      width: getProportionateScreenWidth(115),
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/1558459141564.jpeg›"),
          ),
          Positioned(
            bottom: 0,
            right: -12,
            child: SizedBox(
                height: getProportionateScreenHeight(46),
                width: getProportionateScreenWidth(46),
                child: FlatButton(
                  color: Color(0xFFF5F6F9),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                )),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_exommerce/size_config.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends PreferredSize {
  CustomAppBar({required this.raiting})
      : super(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height),
            child: AppBar());

  Size get prefferedSize => Size.fromHeight(AppBar().preferredSize.height);

  final double raiting;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        RoundedIconButton(
          icon: Icons.arrow_back_ios,
          press: () {
            Navigator.pop(context);
          },
        ),
        raiting != 0
            ? Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(14),
                    vertical: getProportionateScreenHeight(5)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14)),
                child: Row(
                  children: [
                    Text(
                      raiting.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(width: 5),
                    SvgPicture.asset("assets/icons/Star Icon.svg")
                  ],
                ),
              )
            : Container()
      ]),
    ));
  }
}

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({
    Key? key,
    required this.press,
    required this.icon,
  }) : super(key: key);

  final VoidCallback press;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(40),
      width: getProportionateScreenWidth(40),
      child: Container(
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                primary: Colors.black,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)))),
            child: Container(
              child: Icon(
                icon,
              ),
            ),
            onPressed: press),
      ),
    );
  }
}

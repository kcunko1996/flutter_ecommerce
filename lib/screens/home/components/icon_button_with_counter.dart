import 'package:flutter/material.dart';
import 'package:flutter_exommerce/constants.dart';
import 'package:flutter_exommerce/size_config.dart';
import 'package:flutter_svg/svg.dart';

class IconWithButtonCounter extends StatelessWidget {
  const IconWithButtonCounter({
    Key? key,
    required this.svg,
    required this.press,
    required this.numOfItems,
  }) : super(key: key);

  final String svg;
  final VoidCallback press;
  final int numOfItems;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(
              getProportionateScreenWidth(12),
            ),
            height: getProportionateScreenHeight(46),
            width: getProportionateScreenWidth(46),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(svg),
          ),
          if (numOfItems != 0)
            Positioned(
              right: -3,
              top: 0,
              child: Container(
                height: getProportionateScreenHeight(16),
                width: getProportionateScreenWidth(16),
                decoration: BoxDecoration(
                    color: Color(0xFFFF48448),
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.4, color: Colors.white)),
                child: Center(
                    child: Text(
                  numOfItems.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      height: 1,
                      fontSize: getProportionateScreenWidth(10),
                      fontWeight: FontWeight.bold),
                )),
              ),
            )
        ],
      ),
    );
  }
}

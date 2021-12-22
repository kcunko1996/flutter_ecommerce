import 'package:flutter/material.dart';
import 'package:flutter_exommerce/size_config.dart';
import 'package:flutter_svg/svg.dart';

class CustomSuffixTextField extends StatelessWidget {
  const CustomSuffixTextField({
    Key? key,
    this.hintText,
    this.labelText,
    this.svg,
  }) : super(key: key);
  final hintText, labelText, svg;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: EdgeInsets.fromLTRB(
                0,
                getProportionateScreenWidth(20),
                getProportionateScreenWidth(20),
                getProportionateScreenWidth(20)),
            child: SvgPicture.asset(
              svg,
              height: getProportionateScreenHeight(18),
            ),
          )),
    );
  }
}

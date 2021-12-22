import 'package:flutter/material.dart';
import 'package:flutter_exommerce/size_config.dart';
import 'package:flutter_svg/svg.dart';

class FormError extends StatelessWidget {
  FormError({Key? key, required this.errors}) : super(key: key);
  final List<String> errors;
  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            errors.length, (index) => formErrorText(error: errors[index])));
  }

  Row formErrorText({error}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          width: getProportionateScreenWidth(14),
          height: getProportionateScreenHeight(14),
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(error)
      ],
    );
  }
}

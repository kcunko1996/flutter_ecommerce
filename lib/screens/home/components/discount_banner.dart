import 'package:flutter/material.dart';
import 'package:flutter_exommerce/size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: getProportionateScreenHeight(90),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xFF4A3298), borderRadius: BorderRadius.circular(20)),
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(15),
        ),
        child: Text.rich(
          TextSpan(
              text: "A Summer Surprise\n",
              style: TextStyle(color: Colors.white),
              children: [
                TextSpan(
                    text: "Cashback 20%",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
              ]),
        ));
  }
}

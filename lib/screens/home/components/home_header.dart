import 'package:flutter/material.dart';
import 'package:flutter_exommerce/model/Cart.dart';
import 'package:flutter_exommerce/screens/add_cart/addCartScreen.dart';
import 'package:flutter_exommerce/screens/cart/cart_screen.dart';
import 'package:flutter_exommerce/screens/home/components/icon_button_with_counter.dart';
import 'package:flutter_exommerce/screens/home/components/search_field.dart';
import 'package:flutter_exommerce/size_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SearchField(),
            IconWithButtonCounter(
              svg: "assets/icons/Cart Icon.svg",
              press: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              numOfItems: demoCarts.length,
            ),
            IconWithButtonCounter(
              svg: "assets/icons/round-add-button-svgrepo-com.svg",
              press: () {
                Navigator.of(context).pushNamed(AddProductScreen.routeName);
              },
              numOfItems: 0,
            )
          ],
        ));
  }
}

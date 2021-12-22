import 'package:flutter/material.dart';
import 'package:flutter_exommerce/model/product.dart';
import 'package:flutter_exommerce/screens/cart/components/cart_item_card.dart';
import 'package:flutter_exommerce/size_config.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (ctx, index) => Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(10)),
                child: Dismissible(
                    direction: DismissDirection.endToStart,
                    // onDismissed: (direction) => setState(() {
                    //       cartList.removeAt(index);
                    //     }),
                    key: ValueKey(demoProducts[index].id.toString()),
                    background: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      decoration: BoxDecoration(
                          color: Color(0xFFFFE6E6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Spacer(),
                          SvgPicture.asset("assets/icons/Trash.svg")
                        ],
                      ),
                    ),
                    child: CartitemCard(index: index)),
              )),
    );
  }
}

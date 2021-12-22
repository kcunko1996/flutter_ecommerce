import 'package:flutter/material.dart';
import 'package:flutter_exommerce/model/Cart.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class CartitemCard extends StatelessWidget {
  const CartitemCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: getProportionateScreenWidth(88),
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset(demoCarts[index].product.images![0]),
              ),
            )),
        SizedBox(
          width: getProportionateScreenWidth(20),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            demoCarts[index].product.title,
            style: TextStyle(fontSize: 16, color: Colors.black),
            maxLines: 2,
          ),
          Text.rich(TextSpan(
              text: "\$${demoCarts[index].product.price}",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
              children: [
                TextSpan(
                    text: '  x${demoCarts[index].numOfItem}',
                    style: TextStyle(color: kTextColor))
              ]))
        ])
      ],
    );
  }
}

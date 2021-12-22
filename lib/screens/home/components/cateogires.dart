import 'package:flutter/material.dart';
import 'package:flutter_exommerce/screens/home/components/body.dart';
import 'package:flutter_exommerce/size_config.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Map<String, dynamic>> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
              categories.length,
              (index) => CategoryCard(
                    svg: categories[index]["icon"],
                    text: categories[index]["text"],
                    press: () {},
                  ))
        ],
      ),
    );
  }
}

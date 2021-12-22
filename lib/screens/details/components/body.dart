import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_exommerce/components/deafult_button.dart';
import 'package:flutter_exommerce/constants.dart';
import 'package:flutter_exommerce/model/product.dart';
import 'package:flutter_exommerce/screens/cart/cart_screen.dart';
import 'package:flutter_exommerce/screens/details/components/custom_app_bar.dart';
import 'package:flutter_exommerce/size_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProdcutDescription(product: product),
              TopRoundedContainer(
                  color: Color(0xFFF6F7F9),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),
                    child: ColorsDot(product: product),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                    left: SizeConfig.screenWidth * 0.05,
                    right: SizeConfig.screenWidth * 0.05,
                    // top: getProportionateScreenWidth(4),
                    bottom: getProportionateScreenHeight(5),
                  ),
                  child: TopRoundedContainer(
                      color: Colors.white,
                      child: DeafultButton(
                        press: () {
                          Navigator.pushNamed(context, CartScreen.routeName);
                        },
                        text: "Add to Cart",
                      )))
            ],
          ),
        )
      ],
    );
  }
}

class ColorsDot extends StatelessWidget {
  const ColorsDot({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(product.colors.length,
            (index) => ColorDot(color: product.colors[index], index: index)),
        Spacer(),
        RoundedIconButton(press: () {}, icon: Icons.remove),
        SizedBox(
          width: 15,
        ),
        RoundedIconButton(press: () {}, icon: Icons.add),
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    required this.index,
  }) : super(key: key);

  final Color color;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(8),
      height: getProportionateScreenHeight(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
          // color: product.colors[0],
          shape: BoxShape.circle,
          border: Border.all(
              color: index == 3 ? kPrimaryColor : Colors.transparent)),
      child: DecoratedBox(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}

class ProdcutDescription extends StatelessWidget {
  const ProdcutDescription({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            product.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(5),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            width: getProportionateScreenWidth(64),
            decoration: BoxDecoration(
                color: product.isFavourite
                    ? kPrimaryColor.withOpacity(0.15)
                    : kSecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            child: SvgPicture.asset(
              "assets/icons/Heart Icon_2.svg",
              color:
                  product.isFavourite ? Color(0xFFFF4848) : Color(0xFFD8DEE4),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(64)),
          child: Text(product.description, maxLines: 3),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenHeight(20)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "See more details",
                style: TextStyle(color: kPrimaryColor),
              ),
              SizedBox(
                width: getProportionateScreenWidth(5),
              ),
              Icon(
                Icons.chevron_right,
                color: kPrimaryColor,
                size: getProportionateScreenHeight(16),
              )
            ],
          ),
        )
      ],
    );
  }
}

class TopRoundedContainer extends StatelessWidget {
  const TopRoundedContainer({
    Key? key,
    required this.color,
    required this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: getProportionateScreenWidth(20)),
      padding: EdgeInsets.only(top: getProportionateScreenWidth(20)),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: child,
    );
  }
}

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  var currentImage = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            width: getProportionateScreenWidth(238),
            child: AspectRatio(
              aspectRatio: 1,
              child: widget.product.images![currentImage] is String
                  ? Image.asset(widget.product.images![currentImage])
                  : Image.file(File(widget.product.images![currentImage].path)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(widget.product.images!.length,
                  (index) => buildSmallPreview(index))
            ],
          )
        ],
      ),
    );
  }

  GestureDetector buildSmallPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentImage = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(8)),
        child: Container(
            padding: EdgeInsets.all(getProportionateScreenHeight(8)),
            height: getProportionateScreenHeight(48),
            width: getProportionateScreenWidth(48),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: currentImage == index
                        ? kPrimaryColor
                        : Colors.transparent)),
            child: widget.product.images![index] is String
                ? Image.asset(widget.product.images![index])
                : Image.file(File(widget.product.images![index].path))),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_exommerce/constants.dart';
import 'package:flutter_exommerce/model/product.dart';
import 'package:flutter_exommerce/screens/details/details_screen.dart';
import 'package:flutter_exommerce/screens/home/components/cateogires.dart';
import 'package:flutter_exommerce/screens/home/components/discount_banner.dart';
import 'package:flutter_exommerce/screens/home/components/home_header.dart';
import 'package:flutter_exommerce/screens/home/components/promoProducts.dart';
import 'package:flutter_exommerce/size_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  var toggle = false;

  List<Map<String, dynamic>> categories = [
    {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
    {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
    {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
    {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
    {"icon": "assets/icons/Discover.svg", "text": "More"},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            HomeHeader(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            DiscountBanner(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Categories(categories: categories),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            PromoProducts(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            SectionTitle(title: "Special for you", press: () {}),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            SpecialOffers(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            SectionTitle(title: "Popular Product", press: () {}),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(demoProducts.length,
                      (index) => ProductCart(product: demoProducts[index]))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCart extends StatelessWidget {
  ProductCart({
    Key? key,
    this.width = 140,
    this.aspectRatio = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRatio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    print('shii');
    return Container(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(15)),
      width: getProportionateScreenWidth(140),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, DetailsScreen.routeName,
                  arguments: product);
            },
            child: AspectRatio(
              aspectRatio: aspectRatio,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15)),
                child: product.images![0] is String
                    ? Image.asset(product.images![0])
                    : Image.file(File(product.images![0].path)),
              ),
            ),
          ),
          Text(
            product.title,
            style: TextStyle(color: Colors.black),
            maxLines: 2,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ ${product.price}",
                textAlign: TextAlign.left,
                maxLines: 3,
                style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenHeight(18)),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                    alignment: Alignment.center,
                    width: getProportionateScreenWidth(28),
                    height: getProportionateScreenHeight(28),
                    decoration: BoxDecoration(
                        color: kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle),
                    child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.delete,
                          color: Colors.grey[500],
                          size: 18,
                        ))),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenHeight(8)),
                  width: getProportionateScreenWidth(28),
                  height: getProportionateScreenHeight(28),
                  decoration: BoxDecoration(
                      color: product.isFavourite
                          ? kPrimaryColor.withOpacity(0.15)
                          : kSecondaryColor.withOpacity(0.1),
                      shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    "assets/icons/Heart Icon_2.svg",
                    color: product.isFavourite
                        ? Color(0xFFFF4848)
                        : Color(0xFFD8DEE4),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SpecialOfferCard(
            image: 'assets/images/Image Banner 2.png',
            caterogy: "Smartphone",
            numberOfBrands: 18,
            press: () {},
          ),
          SpecialOfferCard(
            image: 'assets/images/Image Banner 2.png',
            caterogy: "Fashion",
            numberOfBrands: 25,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  SpecialOfferCard({
    Key? key,
    required this.caterogy,
    required this.image,
    required this.press,
    required this.numberOfBrands,
  }) : super(key: key);

  final caterogy, image;
  final VoidCallback press;
  final int numberOfBrands;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: SizedBox(
        height: getProportionateScreenWidth(100),
        width: getProportionateScreenWidth(242),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0xFF343434).withOpacity(0.4),
                      Color(0xFF343434).withOpacity(0.15),
                    ])),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15),
                    vertical: getProportionateScreenWidth(10)),
                child: Text.rich(
                    TextSpan(style: TextStyle(color: Colors.white), children: [
                  TextSpan(
                      text: "${caterogy}\n",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          fontWeight: FontWeight.bold)),
                  TextSpan(text: "${numberOfBrands.toString()} Brands")
                ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.black, fontSize: getProportionateScreenWidth(18)),
          ),
          GestureDetector(
            onTap: press,
            child: Text(
              "See More",
            ),
          )
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.svg,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String svg, text;

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: press,
          child: SizedBox(
            width: getProportionateScreenWidth(55),
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFECDF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset(svg)),
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(5),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

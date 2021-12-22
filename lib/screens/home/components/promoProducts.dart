import 'package:flutter/material.dart';
import 'package:flutter_exommerce/constants.dart';
import 'package:flutter_exommerce/size_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class PromoProducts extends StatefulWidget {
  PromoProducts({Key? key}) : super(key: key);

  @override
  State<PromoProducts> createState() => _PromoProductsState();
}

class _PromoProductsState extends State<PromoProducts> {
  int currPage = 0;
  @override
  Widget build(BuildContext context) {
    void _launchURL(url) async {
      if (!await launch(url)) throw 'Could not launch ${'https://flutter.dev'}';
    }

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: SizedBox(
        height: getProportionateScreenWidth(250),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              PageView.builder(
                  itemCount: 3,
                  onPageChanged: (val) {
                    setState(() {
                      currPage = val;
                    });
                  },
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      // onTap: () => _launchURL(data[index]['url']),
                      child: Image.asset("assets/images/no-img.png"),
                    );
                  }),
              IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Color(0xFF343434).withOpacity(0.25),
                        Color(0xFF343434).withOpacity(0.6),
                      ])),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: IgnorePointer(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(15),
                        vertical: getProportionateScreenWidth(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(TextSpan(
                            style: TextStyle(color: Colors.white),
                            children: [
                              TextSpan(
                                  text: "Neki Tekst\n",
                                  style: TextStyle(
                                      fontSize: getProportionateScreenWidth(20),
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: "Jos neki tekst",
                                  style: TextStyle(
                                      fontSize: getProportionateScreenWidth(14),
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: "  12",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: getProportionateScreenWidth(14),
                                      fontWeight: FontWeight.bold))
                            ])),
                        Row(
                            children: List.generate(
                          3,
                          (index) => buildDot(index),
                        ))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

AnimatedContainer buildDot(int index) {
  return AnimatedContainer(
    duration: kAnimationDuration,
    key: ValueKey(index),
    margin: EdgeInsets.only(right: 5),
    height: getProportionateScreenWidth(10),
    width: getProportionateScreenWidth(10),
    decoration: BoxDecoration(
        color: 1 == index ? kPrimaryColor : Colors.grey[600],
        borderRadius: BorderRadius.circular(20)),
  );
}

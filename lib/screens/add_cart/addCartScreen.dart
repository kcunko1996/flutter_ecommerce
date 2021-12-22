import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_exommerce/screens/add_cart/components/add_product_form.dart';
import 'package:flutter_exommerce/screens/add_cart/components/product_images.dart';
import 'package:flutter_exommerce/screens/details/components/custom_app_bar.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({Key? key}) : super(key: key);
  static const routeName = '/add-product';

  var images;

  @override
  Widget build(BuildContext context) {
    print('${images} kitaaa');
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(raiting: 0),
      body: SingleChildScrollView(
        child: Column(
          children: [NewProductImages(images: images), AddProductForm()],
        ),
      ),
    );
  }
}

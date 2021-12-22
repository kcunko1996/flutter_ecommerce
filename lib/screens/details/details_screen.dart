import 'package:flutter/material.dart';
import 'package:flutter_exommerce/model/product.dart';
import 'package:flutter_exommerce/screens/details/components/body.dart';
import 'package:flutter_exommerce/screens/details/components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  static const String routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Product;
    print(args.rating);
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(
        raiting: args.rating,
      ),
      body: SingleChildScrollView(
        child: Body(
          product: args,
        ),
      ),
    );
  }
}

class ProductDetailsArguments {
  final Product product;
  ProductDetailsArguments(this.product);
}

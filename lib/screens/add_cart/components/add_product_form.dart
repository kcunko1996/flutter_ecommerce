import 'package:flutter/material.dart';
import 'package:flutter_exommerce/components/deafult_button.dart';
import 'package:flutter_exommerce/screens/details/components/body.dart';
import 'package:flutter_exommerce/screens/home/home_screen.dart';
import 'package:flutter_exommerce/size_config.dart';

class AddProductForm extends StatelessWidget {
  AddProductForm({
    Key? key,
  }) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    void _onSubmit() {
      if (!_formKey.currentState!.validate()) {
        return;
      }
      _formKey.currentState!.save();

      Navigator.of(context).pushNamed(HomeScreen.routeName);
    }

    return TopRoundedContainer(
      color: Colors.white,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),
                    child: TextFormField(
                      onSaved: (val) => title = val!,
                      decoration: InputDecoration(hintText: "Enter Title"),
                    )),
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),
                Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      onSaved: (val) => description = val!,
                      maxLines: 4,
                      decoration:
                          InputDecoration(hintText: "Enter Description"),
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: getProportionateScreenHeight(20)),
                )
              ],
            ),
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
                      _onSubmit();
                    },
                    text: "Add to Cart",
                  )),
            )
          ],
        ),
      ),
    );
  }
}

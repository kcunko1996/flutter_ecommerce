import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_exommerce/constants.dart';
import 'package:flutter_exommerce/size_config.dart';
import 'package:image_picker/image_picker.dart';

class NewProductImages extends StatefulWidget {
  var images;

  NewProductImages({Key? key, required this.images}) : super(key: key);

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<NewProductImages> {
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _img;

  @override
  Widget build(BuildContext context) {
    _imgFromGallery() async {
      final List<XFile>? image = await _picker.pickMultiImage();
      setState(() {
        _img = image;
      });
    }

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: getProportionateScreenWidth(238),
                height: getProportionateScreenWidth(238),
                child: AspectRatio(
                    aspectRatio: 1,
                    child: _img != null
                        ? Image.file(
                            File(_img![0].path),
                            fit: BoxFit.contain,
                          )
                        : Image.asset(
                            "assets/images/no-img.png",
                            fit: BoxFit.fitWidth,
                            width: getProportionateScreenWidth(238),
                            height: getProportionateScreenWidth(238),
                          )),
              ),
              Positioned(
                bottom: getProportionateScreenHeight(15),
                right: getProportionateScreenWidth(10),
                child: GestureDetector(
                  onTap: () {
                    _imgFromGallery();
                  },
                  child: Icon(
                    Icons.camera_alt,
                    size: getProportionateScreenWidth(50),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(4, (index) => buildSmallPreview(index + 1))
            ],
          )
        ],
      ),
    );
  }

  GestureDetector buildSmallPreview(int index) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(8)),
          child: Container(
              padding: EdgeInsets.all(getProportionateScreenHeight(8)),
              height: getProportionateScreenHeight(48),
              width: getProportionateScreenWidth(48),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: kPrimaryColor),
              ),
              child: _img != null
                  ? Image.file(
                      File(_img![index].path),
                      fit: BoxFit.contain,
                    )
                  : Image.asset("assets/images/no-img.png"))),
    );
  }
}

import 'package:flutter/material.dart';
import '../../presentation/resources/color_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../domain/models/product.dart';
import '../../presentation/resources/values_manager.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<ImageSource?> images;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: AppSize.s12,
                    spreadRadius: 0.1,
                    offset: const Offset(-3, 3),
                    color: Colors.grey[500]!)
              ]),
              width: AppSize.s400,
              height: AppSize.s400,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s12),
                child: Image.network(widget.images[selectedImage]!.src,
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: AppPadding.p12, top: AppPadding.p8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ColorManager.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s28)),
                ),
                onPressed: _launch,
                child: Icon(
                  Icons.share_rounded,
                  color: ColorManager.white,
                  size: AppSize.s28,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: AppPadding.p12, top: AppPadding.p60),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ColorManager.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s28)),
                ),
                onPressed: _launch,
                child: Icon(
                  Icons.favorite_border,
                  color: ColorManager.white,
                  size: AppSize.s28,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: AppSize.s340,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: AppPadding.p12),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(widget.images.length,
                    (index) => buildSmallProductPreview(index)),
              ],
            ),
          ),
        )
      ],
    );
  }

  void _launch() async {
    final Uri _url = Uri.parse('https://flutter.dev');
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  GestureDetector buildSmallProductPreview(int index) {
    Color selectedColor = ColorManager.primary;
    double width = 2;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: AppSize.s8),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: AppSize.s4,
                  spreadRadius: 0.1,
                  offset: const Offset(-1, 1),
                  color: ColorManager.primaryOpacity70)
            ],
            border: Border.all(color: selectedColor, width: width),
            borderRadius: BorderRadius.circular(AppSize.s40)),
        width: AppSize.s80,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(widget.images[index]!.src)),
      ),
    );
  }
}

import 'package:flutter/material.dart';
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
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: AppSize.s12,
                    spreadRadius: 0.1,
                    offset: Offset(-3, 3),
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
        ),
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: SizedBox(
            width: AppSize.s80,
            child: Card(
                child: Image.network(widget.images[index]!.src,
                    fit: BoxFit.cover)),
          )),
    );
  }
}

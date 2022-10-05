import 'package:flutter/material.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(this._categoryId, this._image, {super.key});
  final String? _categoryId;
  final String _image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
          spreadRadius: 0.9,
          offset: Offset(0, 5),
          color: Color.fromARGB(255, 203, 203, 203),
        )
      ], borderRadius: BorderRadius.circular(20), color: ColorManager.white),
      width: 400,
      height: 80,
      child: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
              right: AppPadding.p12,
              left: AppPadding.p2,
              child: SizedBox(
                height: 80,
                width: 400,
                child: Image.network(
                  _image,
                  fit: BoxFit.contain,
                ),
              )),
          Positioned(
            right: AppPadding.p12,
            child: Container(
                height: 80,
                width: 180,
                color: Colors.white,
                alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: () {
                      _openCategory(_categoryId);
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: ColorManager.primary,
                    ))),
          )
        ],
      ),
    );
  }

  void _openCategory(String? categoryId) {}
}

import 'package:flutter/material.dart';
import '../../domain/models/product.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(this._product, {Key? key}) : super(key: key);
  final Product _product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppMargin.m8),
      margin: const EdgeInsets.all(AppMargin.m8),
      width: AppSize.s180,
      height: AppSize.s340,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s20),
          color: ColorManager.lightGray),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(AppMargin.m8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s12),
            ),
            height: AppSize.s180,
            width: AppSize.s130,
            child: Card(
              child: Image.network(
                _product.cover_image,
              ),
            ),
          ),
          Text(
            _product.name,
            maxLines: 2,
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            _product.price,
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            _product.quantity.toString(),
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );
  }
}

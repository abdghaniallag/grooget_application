import 'package:flutter/material.dart';
import '../../domain/models/product.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget(this._productItem, {Key? key}) : super(key: key);
  final ProductItem _productItem;
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
                _productItem.cover!.url,
              ),
            ),
          ),
          Text(
            _productItem.name,
            maxLines: 2,
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            _productItem.price,
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            _productItem.description_short,
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            _productItem.description,
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );
  }
}

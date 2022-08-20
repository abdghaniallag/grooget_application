import 'package:flutter/material.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

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
                "https://m.media-amazon.com/images/I/91gSOL-ym0L._AC_UL320_.jpg",
              ),
            ),
          ),
          Text(
            "The Drop Women's Britt Tiered Maxi Tent Dress",
            maxLines: 2,
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            "\$59.90",
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            "Amazon brand",
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );
  }
}

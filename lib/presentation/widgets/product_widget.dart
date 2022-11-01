import 'package:flutter/material.dart';
import 'package:mvvm_first_c/presentation/resources/color_manager.dart';
import '../../domain/models/product.dart';
import '../resources/routes_manager.dart';
import '../resources/values_manager.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget(this._productItem, {Key? key}) : super(key: key);
  final ProductItem _productItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p4),
      width: AppSize.s160,
      height: AppSize.s280,
      child: Card(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.productDetailRoute,
                    arguments: IdArguments(_productItem.id_product));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                    _productItem.cover!.url,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p4),
                    child: Text(
                      _productItem.name
                          .replaceAll(r'<p>', '')
                          .replaceAll(r'</p>', ''),
                      maxLines: 1,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: AppPadding.p16),
                      child: Text(
                        _productItem.price
                            .replaceAll(r'<p>', '')
                            .replaceAll(r'</p>', ''),
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ),
                  Text(
                    _productItem.description_short
                        .replaceAll(r'<p>', '')
                        .replaceAll(r'</p>', ''),
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ),
            Positioned(
              right: -16,
              bottom: 85,
              child: IconButton(
                  onPressed: _quickAdd(_productItem.id_product),
                  icon: Icon(
                    size: AppSize.s36,
                    Icons.add_box_sharp,
                    color: ColorManager.darkPrimary,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  _quickAdd(String id_product) {}
}

import 'package:flutter/material.dart';
import '../../domain/models/cart.dart';
import '../../presentation/resources/strings_manager.dart';
import '../../presentation/resources/values_manager.dart';
import '../resources/color_manager.dart';

class ProductcartWidget extends StatelessWidget {
  const ProductcartWidget(this._productItem, {Key? key}) : super(key: key);
  final Product _productItem;
  @override
  Widget build(BuildContext context) {
    String color=_productItem.attributes_small.replaceRange(
                      _productItem.attributes_small.indexOf('-'),
                      _productItem.attributes_small.length,'');
    String size=_productItem.attributes_small.replaceRange(0,
                      _productItem.attributes_small.indexOf('-')+2,
                      '');
    return Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: AppSize.s80,
                height: AppSize.s100,
                child: Card(child: Image.network(_productItem.image_url)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width:AppSize.s200 , child: Text(_productItem.name)),
                  Text('${AppStrings.color} : $color'),
                  Text('${AppStrings.size } : $size '),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                  '${AppStrings.price}: ${_productItem.price_with_reduction_without_tax}'),
              getQTYAdjust(),
              Text('${AppStrings.total}: ${_productItem.total_wt}'),
              TextButton(
                  onPressed: (() => _deleteFromCart('product')),
                  child: Icon(
                    Icons.remove_shopping_cart_rounded,
                    color: ColorManager.gray,
                  )),
            ],
          )
        ],
      ),
    );
  }

  getQTYAdjust() {
    return SizedBox(
      width: 100,
      height: 70,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 60,
            child: SizedBox(
              width: 50,
              height: 70,
              child: TextButton.icon(
                onPressed: () {
                  _addToCart('combinationsItem', 8);
                },
                icon:
                    Icon(Icons.arrow_upward_rounded, color: ColorManager.green),
                label: const Text(""),
              ),
            ),
          ),
          Positioned(
            right: 50,
            child: SizedBox(
              width: 50,
              height: 70,
              child: TextButton.icon(
                onPressed: () {
                  _removeFromCart('combinationsItem', 8);
                },
                icon: Icon(Icons.arrow_downward_rounded,
                    color: ColorManager.primary),
                label: const SizedBox(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
                width: 60,
                height: 20,
                child: Text(
                  ' ${_productItem.quantity}',
                  textAlign: TextAlign.center,
                )),
          ),
        ],
      ),
    );
  }

  _removeFromCart(String productId, int qty) {}

  _addToCart(String productId, int qty) {}

  _deleteFromCart(String productId) {}
}

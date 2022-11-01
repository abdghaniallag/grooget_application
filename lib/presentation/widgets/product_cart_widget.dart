import 'package:flutter/material.dart';
import 'package:mvvm_first_c/domain/models/cart.dart';
import '../../presentation/resources/values_manager.dart';
import '../resources/color_manager.dart';

class ProductcartWidget extends StatelessWidget {
  const ProductcartWidget(this._productItem, {Key? key}) : super(key: key);
  final Product _productItem;
  @override
  Widget build(BuildContext context) {
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
                  Text('Men Minimalist Slip On Chelsea Boots'),
                  Text('Color: Black'),
                  Text('Sizes: 40 41 41 42 42 43 43 44'),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Price \$15.99'),
              getQTYAdjust(),
              Text('Total \$15.99'),
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
                label: const Text(''),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
                width: 60,
                height: 20,
                child: Text(
                  "8",
                  textAlign: TextAlign.center,
                )),
          ),
        ],
      ),
    );
  }

  _removeFromCart(String product, int qty) {}

  _addToCart(String product, int qty) {}

  _deleteFromCart(String product) {}
}

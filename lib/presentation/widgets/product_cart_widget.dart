import 'package:flutter/material.dart';
import '../../domain/models/cart.dart';
import '../../presentation/resources/strings_manager.dart';
import '../../presentation/resources/values_manager.dart';
import '../main/cart/cart_page_viewmodel.dart';
import '../resources/color_manager.dart';

class ProductcartWidget extends StatelessWidget {
  const ProductcartWidget(this._productItem, this._viewModel, {Key? key})
      : super(key: key);

  final Product _productItem;
  final CartPageViewModel _viewModel;
  @override
  Widget build(BuildContext context) {
    String color = _productItem.attributes_small.replaceRange(
        _productItem.attributes_small.indexOf('-'),
        _productItem.attributes_small.length,
        '');
    String size = _productItem.attributes_small
        .replaceRange(0, _productItem.attributes_small.indexOf('-') + 2, '');
    return Container(
      color: ColorManager.white,
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: AppSize.s80,
                height: AppSize.s100,
                child: Card(child: Image.network(_productItem.image_url)),
              ),
              SizedBox(
                width: AppSize.s16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: AppSize.s200, child: Text(_productItem.name)),
                  SizedBox(
                    height: AppSize.s4,
                  ),
                  SizedBox(
                      width: AppSize.s200,
                      child: Text('${AppStrings.color} : $color')),
                  SizedBox(
                    height: AppSize.s4,
                  ),
                  SizedBox(
                      width: AppSize.s200,
                      child: Text('${AppStrings.size} : $size ')),
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
                  onPressed: () {
                    _viewModel.deletItem(
                        _productItem.id_product,
                        _productItem.id_product_attribute );
                  },
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
                onPressed: (){  _viewModel.addItem(
                        _productItem.id_product,
                        _productItem.id_product_attribute,
                        int.parse(_productItem.minimal_quantity));},
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
                onPressed: () {  _viewModel.removeItem(
                        _productItem.id_product,
                        _productItem.id_product_attribute,
                        int.parse(_productItem.minimal_quantity));},
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
}

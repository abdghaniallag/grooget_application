import 'package:flutter/material.dart';
import 'package:mvvm_first_c/domain/models/cart.dart';
import 'package:mvvm_first_c/presentation/resources/values_manager.dart';
import '../../widgets/product_cart_widget.dart';

import '../../../app/di.dart';
import 'cart_page_viewmodel.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartPageViewModel _viewModel = instance<CartPageViewModel>();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _viewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: _getContentWidgets());
  }

  Widget _getContentWidgets() {
    return StreamBuilder<UserCart>(
        stream: _viewModel.outputCart,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: AppSize.s8,
                ),
                ProductcartWidget(snapshot.data!.psdata!.products!.first!),
                ProductcartWidget(snapshot.data!.psdata!.products!.first!),
                ProductcartWidget(snapshot.data!.psdata!.products!.first!),
                ProductcartWidget(snapshot.data!.psdata!.products!.first!),
                ProductcartWidget(snapshot.data!.psdata!.products!.first!),
                ProductcartWidget(snapshot.data!.psdata!.products!.first!),
              ],
            );
          } else {
            return Text("Loading");
          }
        });
  }
}

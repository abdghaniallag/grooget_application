import 'package:flutter/material.dart';
import '../../resources/values_manager.dart';
import '../../../domain/models/cart.dart';
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
    return SizedBox(
      height: MediaQuery.of(context).size.height - 148,
      child: Center(
          child: SingleChildScrollView(child: _getContentWidgets(context))),
    );
  }

  Widget _getContentWidgets(BuildContext context) {
    List<Widget> products = List<Widget>.empty(growable: true);
    products.add(Text(''));
    double totals = 0;
    int productCount = 0;
    return StreamBuilder<UserCart>(
        stream: _viewModel.outputCart,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            totals = snapshot.data!.psdata!.totals!.total_including_tax!.amount;
            productCount = snapshot.data!.psdata!.products_count;
            products.addAll(snapshot.data!.psdata!.products!
                .map((product) => ProductcartWidget(product!))
                .toList());
          }
          {
            return Column(
              children: [
                const SizedBox(
                  height: AppSize.s8,
                ),
                Text(
                  productCount.toString(),
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(
                  height: AppSize.s8,
                ),
                Text(totals.toString()),
                const SizedBox(
                  height: AppSize.s8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: products,
                ),
              ],
            );
          }
        });
  }
}

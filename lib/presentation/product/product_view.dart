import 'dart:async';

import 'package:flutter/material.dart';
import '../../app/di.dart';
import '../../domain/models/product.dart';
import '../../presentation/widgets/search_appbar.dart';
import '../resources/routes_manager.dart';
import '../resources/values_manager.dart';
import '../widgets/product_widget.dart';
import 'product_viewmodel.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  ProductViewModel _viewModel = instance<ProductViewModel>();

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _viewModel.start();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return getProductContent();
  }

  Widget getProductContent() {
    return Scaffold(
      appBar: SearchAppBar()
          .getAppBar(controller, () => {_viewModel.search(controller.text)}),
      body: StreamBuilder<ProductSearchList>(
          stream: _viewModel.outputsProduct,
          builder: (context, snapshot) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  getSection(snapshot.data?.psdata?.label ?? ""),
                  Wrap(
                      spacing: AppPadding.p2,
                      runSpacing: AppPadding.p8,
                      children: getAllProduct(snapshot.data?.psdata?.products)),
                ],
              ),
            );
          }),
    );
  }

  List<Widget> getAllProduct(List<ProductItem>? products) {
    Stream<ProductInformation> _productStream = _viewModel.outputsProductDetail;

    if (products != null) {
      return products
          .map((index) => GestureDetector(
              onTap: () {
                _viewModel.getProductDetail(index.id_product);
                _viewModel.outputsProductDetail.listen((product) async {
                  Navigator.pushNamed(context, Routes.productDetailRoute,
                      arguments:
                          IdArguments(product.psdata!.id_product.toString()));
                });
              },
              child: ProductItemWidget(index)))
          .toList();
    } else {
      return List<SizedBox>.generate(1, (index) => const SizedBox());
    }
  }

  Widget getSection(String title) {
    return SizedBox(
      height: AppSize.s20,
      child: Text(title),
    );
  }
}

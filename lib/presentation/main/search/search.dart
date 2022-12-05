import 'dart:async';

import 'package:flutter/material.dart';
import '../../../app/di.dart';
import '../../../domain/models/product.dart';
import '../../resources/routes_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/product_widget.dart';
import 'search_viewmodel.dart';

class SearchPage extends StatefulWidget {
    SearchPage(this.searchText,{Key? key}) : super(key: key);
  String searchText;
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ProductViewModel _viewModel = instance<ProductViewModel>();

  @override
  void initState() {
    _bind();
    
    if (widget.searchText.length>1) {
      _viewModel.search(widget.searchText);
    }
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
    return StreamBuilder<ProductSearchList>(
        stream: _viewModel.outputsProduct,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: ListView(
                children: [
                  ...snapshot.data!.psdata!.products!
                      .map((e) => ListTile(
                            title: Text(e.name),
                          ))
                      .cast<ListTile>()
                      .toList()
                ],
              ),
            );
          } else
            return Text('no data');
        });
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

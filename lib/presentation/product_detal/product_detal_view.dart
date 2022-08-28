import 'package:flutter/material.dart';
import 'package:mvvm_first_c/domain/models/product.dart';
import 'package:mvvm_first_c/presentation/resources/routes_manager.dart';

class ProductDetailView extends StatefulWidget {
  ProductDetailView({Key? key}) : super(key: key);

  @override
  State<ProductDetailView> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    final product =
        (ModalRoute.of(context)!.settings.arguments as ProductRouteArguments)
            .product;

    return Scaffold(
      body: Column(
        children: const [
          Text("share"),
          Text("Name"),
          Text("Image"),
          Text("favourit"),
          Text("Color"),
          Text("Size"),
          Text("price"),
          Text("Add to cart"),
        ],
      ),
    );
  }
}

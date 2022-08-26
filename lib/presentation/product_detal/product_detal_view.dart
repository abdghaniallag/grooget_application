import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  State<ProductDetailView> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Product detail"),
    );
  }
}

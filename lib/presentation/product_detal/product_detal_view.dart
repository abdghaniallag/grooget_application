import 'package:flutter/material.dart';
import '../../presentation/resources/values_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import '../resources/routes_manager.dart';
import '../widgets/image_slider.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  State<ProductDetailView> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    final product =
        ModalRoute.of(context)!.settings.arguments as ProductRouteArguments;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[300]),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: AppPadding.p30,
                ),
                ProductImages(
                  images: product.product.psdata?.images ?? [],
                ),
                Text(product.product.psdata?.price ?? " "),
                Text(product.product.psdata?.quantity.toString() ?? " "),
                Text(product.product.psdata?.category_name ?? " "),
                Text(product.product.psdata?.description ?? " "),
                Text(product.product.psdata?.description_short ?? " "),
                Text(product.product.psdata?.float_price.toString() ?? " "),
                Text(product.product.psdata?.minimal_quantity ?? " "),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

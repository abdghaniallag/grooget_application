import 'package:flutter/material.dart';
import 'package:mvvm_first_c/presentation/resources/color_manager.dart';
import 'package:mvvm_first_c/presentation/resources/values_manager.dart';
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
                ElevatedButton.icon(
                  icon: Icon(
                    Icons.share_rounded,
                    color: ColorManager.white,
                  ),
                  label: const Text("share"),
                  onPressed: _launch,
                ),
                Text("Name ${product.product.psdata?.name ?? "fff    szxsx"}"),
                Text("favourit"),
                Text("Color"),
                Text("Size"),
                Text("price"),
                Text("Add to cart"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _launch() async {
    final Uri _url = Uri.parse('https://flutter.dev');
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}

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
    // List<Product> product = List<Product>.empty(growable: true);
    return Scaffold(
      appBar: SearchAppBar().getAppBar(controller,
          () => {_viewModel.search(controller.text)}, const Text("Go")),
      body: StreamBuilder<ProductSearchList>(
          stream: _viewModel.outputsProduct,
          builder: (context, snapshot) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Section(snapshot.data?.psdata?.label ?? ""),
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
    if (products != null) {
      return products
          .map((index) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.productDetailRoute);
              },
              child: ProductItemWidget(index)))
          .toList();
    } else {
      return List<SizedBox>.generate(1, (index) => const SizedBox());
    }
  }

  onPressed() {}

  Widget Section(String title) {
    return SizedBox(
      height: AppSize.s20,
      child: Text(title),
    );
  }
}

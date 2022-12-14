import 'package:flutter/material.dart';
import '../../../app/di.dart';
import '../../../domain/models/product.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/product_cart_widget.dart';
import '../../widgets/product_widget.dart';
import 'search_viewmodel.dart';

class SearchPage extends StatefulWidget {
  SearchPage(this.viewModel, {Key? key}) : super(key: key);
  ProductViewModel viewModel;
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    widget.viewModel.start();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height - 148,
        child: SingleChildScrollView(child: getProductContent(context)));
  }

  Widget getProductContent(BuildContext context) {
    List<Widget> products = List<Widget>.empty(growable: true);
    products.add(Text(''));
    double totals = 0;
    int productCount = 0;
    return StreamBuilder<ProductSearchList>(
        stream: widget.viewModel.outputsProduct,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            products.addAll(snapshot.data!.psdata!.products!
                .map((product) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductItemWidget(product),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('${AppStrings.price}: ${product.price}'),
                            getQTYAdjust(),
                            TextButton(
                                onPressed: (() => _deleteFromCart('product')),
                                child: Icon(
                                  Icons.remove_shopping_cart_rounded,
                                  color: ColorManager.gray,
                                )),
                          ],
                        )
                      ],
                    ))
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
                onPressed: () {
                  _addToCart('combinationsItem', 8);
                },
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
                onPressed: () {
                  _removeFromCart('combinationsItem', 8);
                },
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
                  ' quantity ',
                  textAlign: TextAlign.center,
                )),
          ),
        ],
      ),
    );
  }

  _removeFromCart(String productId, int qty) {}

  _addToCart(String productId, int qty) {}

  _deleteFromCart(String productId) {}
  //  {
  //   return StreamBuilder<ProductSearchList>(
  //       stream:  widget.viewModel.outputsProduct,
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           return Column(
  //             children: snapshot.data!.psdata!.products!
  //                 .map((e) {
  //                   return Padding(
  //                     padding: const EdgeInsets.all(AppPadding.p8),
  //                     child: ListTile(
  //                       visualDensity: VisualDensity(vertical: 4),
  //                       leading: Card(
  //                         elevation: 3,
  //                         child: Image.network(
  //                           height: 200,
  //                           fit: BoxFit.cover,
  //                           e.cover!.url,
  //                         ),
  //                       ),
  //                       title: Text(
  //                         e.name,
  //                         style: Theme.of(context).textTheme.bodyText1,
  //                       ),
  //                       tileColor: ColorManager.white,
  //                     ),
  //                   );
  //                 })
  //                 .cast<Padding>()
  //                 .toList(),
  //           );
  //         } else
  //           return Text('no data');
  //       });
  // }
}

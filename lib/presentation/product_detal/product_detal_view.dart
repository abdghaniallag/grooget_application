import 'package:flutter/material.dart';
import '../../app/app_preferences.dart';
import '../../app/di.dart';
import '../../domain/models/product.dart';
import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/strings_manager.dart';
import '../../presentation/resources/values_manager.dart';
import '../quick_add/quick_add_widget.dart';
import '../resources/routes_manager.dart';
import '../widgets/image_slider.dart'; 
import 'product_detal_viewmodel.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  State<ProductDetailView> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetailView> {
  ProductDetailViewModel _viewModel = instance<ProductDetailViewModel>();
  AppPreferences _appPreferences = instance<AppPreferences>();
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
    final productId = ModalRoute.of(context)!.settings.arguments as IdArguments;
    _viewModel.getProduct(productId.id);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: AppPadding.p30),
        decoration: BoxDecoration(color: Colors.grey[300]),
        child: SingleChildScrollView(
          child: Center(
            child: StreamBuilder<ProductInformation>(
                stream: _viewModel.outputProduct,
                builder: (context, snapshot) {
                  return snapshot.data == null
                      ? Text('loading............')
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              height: AppPadding.p30,
                            ),
                            Container(
                              width: AppSize.s400,
                              padding:
                                  const EdgeInsets.only(bottom: AppPadding.p8),
                              color: ColorManager.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _getDescriptionShort(snapshot.data!.psdata!),
                                  ProductImages(
                                    images: snapshot.data!.psdata!.images,
                                  ),
                                  const SizedBox(
                                    height: AppPadding.p20,
                                  ),
                                  _getProductName(snapshot.data!.psdata!),
                                  const SizedBox(
                                    height: AppPadding.p8,
                                  ),
                                  _getDescription(snapshot.data!.psdata!),
                                  const SizedBox(
                                    height: AppPadding.p8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            addToWishList();
                                          },
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: AppPadding.p8),
                                              child: Text(
                                                  AppStrings.addToWishList,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline2))),
                                      Row(
                                        children: [
                                          Text("${AppStrings.availability} :",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3),
                                          const SizedBox(
                                            width: AppPadding.p8,
                                          ),
                                          Checkbox(
                                            activeColor:
                                                ColorManager.primaryOpacity70,
                                            value: snapshot
                                                    .data!.psdata!.quantity >
                                                0,
                                            onChanged: (value) {},
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  CartQuickAdd(
                                      snapshot.data!.psdata!.id_product,
                                      snapshot.data!.psdata!.combinations,
                                      snapshot.data!.psdata!.options,
                                      snapshot.data!.psdata!.images),
                                  const SizedBox(
                                    height: AppSize.s16,
                                  ),
                                  Text(
                                    AppStrings.category,
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                  const SizedBox(
                                    height: AppSize.s8,
                                  ),
                                  Wrap(
                                      spacing: AppPadding.p12,
                                      runSpacing: AppPadding.p8,
                                      children: []
                                      //  getCategories(snapshot
                                      //         .data!.psdata!.category_name)
                                      //     .map((category) => Padding(
                                      //           padding: const EdgeInsets.only(
                                      //               left: AppPadding.p8),
                                      //           child: GestureDetector(
                                      //             onTap: () {
                                      //               goToCategory();
                                      //             },
                                      //             child: Text(
                                      //               category,
                                      //               style: Theme.of(context)
                                      //                   .textTheme
                                      //                   .headline2,
                                      //             ),
                                      //           ),
                                      //         ))
                                      //     .toList()
                                      )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: AppPadding.p2,
                            ),
                            Container(
                              width: AppSize.s380,
                              padding:
                                  const EdgeInsets.only(bottom: AppPadding.p8),
                              color: ColorManager.white,
                              child: ExpansionTile(
                                title: 
                                  Text(AppStrings.productDetails,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3),
                                collapsedIconColor: ColorManager.black,
                                collapsedTextColor: ColorManager.black,
                                iconColor: ColorManager.primary,
                                textColor: ColorManager.primary,
                                children: [
                                  const SizedBox(
                                    height: AppPadding.p8,
                                  ), 
                                  const SizedBox(
                                    height: AppSize.s4,
                                  ),
                                  _getProductInformation(
                                      snapshot.data!.psdata!),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: AppPadding.p2,
                            ),
                            Container(
                              width: AppSize.s380,
                              padding: const EdgeInsets.all(AppPadding.p8),
                              color: ColorManager.white,
                              child: ExpansionTile(
                                title: 
                                  Text(AppStrings.image,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3),
                                collapsedIconColor: ColorManager.black,
                                collapsedTextColor: ColorManager.black,
                                iconColor: ColorManager.primary,
                                textColor: ColorManager.primary,
                                children: [
                                  _getImageList(snapshot.data!.psdata!),
                                ],
                              ),
                            ),
                          ],
                        );
                }),
          ),
        ),
      ),
    );
  }

  // List<String> getCategories(String category) {
  //   category = category.replaceRange(0, 1, category[0].toUpperCase());
  //   List<dynamic> categoryList = List<dynamic>.empty(growable: true);
  //   for (List<dynamic> categoryTree in Constants.categoryTree) {
  //     if (categoryTree. contains(category)) {
  //       categoryList.addAll(categoryTree);
  //     }
  //   }
  //   return categoryList.toSet().toList();
  // }

  void addToWishList() {}

  void goToCategory() {}

  Widget _getProductName(Product product) {
    return Padding(
        padding: const EdgeInsets.only(left: AppPadding.p8),
        child:
            Text(product.name, style: Theme.of(context).textTheme.headline1));
  }

  Widget _getDescription(Product product) {
    return Padding(
        padding: const EdgeInsets.only(left: AppPadding.p8),
        child: Text(product.description));
  }

  Widget _getDescriptionShort(Product product) {
    return Padding(
        padding: const EdgeInsets.only(left: AppPadding.p8),
        child: Text(product.description_short));
  }

  Widget _getProductInformation(Product product) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: product.product_info
              .map((info) => Container(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(info!.name),
                    ],
                  )))
              .toList(),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: product.product_info
              .map((info) => Container(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(info!.value),
                    ],
                  )))
              .toList(),
        ),
      ],
    );
  }

  Widget _getImageList(Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: product.images
          .map((info) => Container(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Image.network(info!.src)))
          .toList(),
    );
  }
}

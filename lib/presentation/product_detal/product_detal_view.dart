import 'dart:developer';

import 'package:dartz/dartz_unsafe.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_first_c/app/constant.dart';
import 'package:mvvm_first_c/domain/models/product.dart';
import 'package:mvvm_first_c/presentation/resources/color_manager.dart';
import 'package:mvvm_first_c/presentation/resources/strings_manager.dart';
import '../../presentation/resources/values_manager.dart';
import '../resources/routes_manager.dart';
import '../widgets/image_slider.dart';
import '../widgets/quick_add_widget.dart';

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
    // for (List<String> categoryTree in Constants.categoryTree) {
    //   if (categoryTree.contains(product.product.psdata!.category_name)) {
    //     categoryList = categoryTree;

    //     break;
    //   }
    // }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[300]),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: AppPadding.p30,
                ),
                Container(
                  width: AppSize.s400,
                  padding: const EdgeInsets.only(bottom: AppPadding.p8),
                  color: ColorManager.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: AppPadding.p8),
                          child:
                              Text(product.product.psdata!.description_short)),
                      ProductImages(
                        images: product.product.psdata!.images,
                      ),
                      const SizedBox(
                        height: AppPadding.p20,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: AppPadding.p8),
                          child: Text(product.product.psdata!.name,
                              style: Theme.of(context).textTheme.headline1)),
                      const SizedBox(
                        height: AppPadding.p8,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: AppPadding.p8),
                          child:
                              Text(product.product.psdata!.description_short)),
                      const SizedBox(
                        height: AppPadding.p8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                addToWishList();
                              },
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: AppPadding.p8),
                                  child: Text(AppStrings.addToWishList,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2))),
                          Row(
                            children: [
                              Text("${AppStrings.availability} :",
                                  style: Theme.of(context).textTheme.headline3),
                              const SizedBox(
                                width: AppPadding.p8,
                              ),
                              Checkbox(
                                activeColor: ColorManager.primaryOpacity70,
                                value: product.product.psdata!.quantity > 0,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        ],
                      ),
                      QuickAddBoard(product.product.psdata!.combinations,
                          product.product.psdata!.options),
                      Wrap(
                          spacing: AppPadding.p12,
                          runSpacing: AppPadding.p8,
                          children: getCategories(
                                  product.product.psdata!.category_name)
                              .map((category) => Padding(
                                    padding: const EdgeInsets.only(
                                        left: AppPadding.p8),
                                    child: GestureDetector(
                                      onTap: () {
                                        goToCategory();
                                      },
                                      child: Text(
                                        category,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                      ),
                                    ),
                                  ))
                              .toList())
                    ],
                  ),
                ),
                const SizedBox(
                  height: AppPadding.p2,
                ),
                Container(
                  width: AppSize.s400,
                  padding: const EdgeInsets.only(bottom: AppPadding.p8),
                  color: ColorManager.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(AppStrings.productDetails,
                          style: Theme.of(context).textTheme.headline3),
                      const SizedBox(
                        height: AppPadding.p2,
                      ),
                      Text(product.product.psdata?.quantity.toString() ?? " "),
                      Text(product.product.psdata?.float_price.toString() ??
                          " "),
                      Text(product.product.psdata?.minimal_quantity ?? " "),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<String> getCategories(String category) {
    category = category.replaceRange(0, 1, category[0].toUpperCase());
    List<String> categoryList = List<String>.empty(growable: true);
    for (List<String> categoryTree in Constants.categoryTree) {
      if (categoryTree.contains(category)) {
        categoryList.addAll(categoryTree);
      }
    }
    return categoryList.toSet().toList();
  }

  void addToWishList() {}

  void goToCategory() {}
}

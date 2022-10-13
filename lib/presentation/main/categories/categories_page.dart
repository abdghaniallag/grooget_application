import 'package:flutter/material.dart';

import '../../../app/constant.dart';
import '../../../app/di.dart';
import '../../../domain/models/product.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/product_widget.dart';
import 'categories_page_viewmodel.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);
  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  CategoriesPageViewModel _viewModel = instance<CategoriesPageViewModel>();
  int _currentIndex = 0;
  final List<bool> _selectedCategory = List<bool>.generate(
    Constants.categoryImages.keys.length,
    ((index) {
      return index == 0;
    }),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getTopCategoryList(),
        _getFilterList(),
        getContent(),
      ],
    );
  }

  getContent() {
    List<CategoryProductItem?>? products = [];
    return Text(Constants.mainCategoris[_currentIndex].values.first);
    // return StreamBuilder<CategoryProductItem>(
    //     stream: _viewModel.outputProduct,
    //     builder: (context, snapshot) {
    //       int index = 0;
    //       if (snapshot.data != null) {
    //         products.add(snapshot.data);
    //       }
    //       return Center(
    //         child: Wrap(
    //           children: products.map((product) {
    //             index++;
    //             final Cover cover = Cover(product!.cover!.url.toString(),
    //                 product.cover!.width!, product.cover!.height!);
    //             final ProductItem productItem = ProductItem(
    //                 product.id_product,
    //                 product.price,
    //                 product.name,
    //                 cover,
    //                 product.description,
    //                 product.description_short,
    //                 product.category_name);
    //             if (index % 2 != 0) {
    //               return ProductItemWidget(productItem);
    //             } else {
    //               return Column(
    //                 children: [
    //                   const SizedBox(
    //                     height: 20,
    //                   ),
    //                   ProductItemWidget(productItem)
    //                 ],
    //               );
    //             }
    //           }).toList(),
    //         ),
    //       );
    //     });
  }

  selectCategory(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  getTopCategoryList() {
    return SizedBox(
      height: AppSize.s56,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ToggleButtons(
          direction: Axis.horizontal,
          onPressed: (int index) {
            setState(() {
              _currentIndex = index;
              for (int i = 0; i < _selectedCategory.length; i++) {
                _selectedCategory[i] = i == index;
              }
            });
          },
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          selectedBorderColor: Colors.red[700],
          selectedColor: Colors.white,
          fillColor: Colors.red[200],
          color: Colors.red[400],
          constraints: const BoxConstraints(
            minHeight: 40.0,
            minWidth: 80.0,
          ),
          isSelected: _selectedCategory,
          children: Constants.categoryImages.keys
              .map((e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(e),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

_getFilterList() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: (() {}),
          icon: const Icon(Icons.arrow_downward_rounded),
          label: const Text(AppStrings.sort),
        ),
        ElevatedButton.icon(
          onPressed: (() {}),
          icon: const Icon(Icons.arrow_downward_rounded),
          label: const Text(AppStrings.gender),
        ),
        ElevatedButton.icon(
          onPressed: (() {}),
          icon: const Icon(Icons.arrow_downward_rounded),
          label: const Text(AppStrings.color),
        ),
        ElevatedButton.icon(
          onPressed: (() {}),
          icon: const Icon(Icons.arrow_downward_rounded),
          label: const Text(AppStrings.size),
        ),
        ElevatedButton.icon(
          onPressed: (() {}),
          icon: const Icon(Icons.arrow_downward_rounded),
          label: const Text(AppStrings.filter),
        ),
      ],
    ),
  );
}

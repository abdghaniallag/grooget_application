import 'package:flutter/material.dart';
import '../../../app/constant.dart';
import '../../../app/di.dart';
import '../../../domain/models/product.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/product_widget.dart';
import '../../widgets/shimmer_loading.dart';
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
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _viewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    return getContent();
  }

  getContent() {
    List<CategoryProductItem?>? products = [];
    return  SizedBox(
     height: MediaQuery.of(context).size.height-148,
      child: SingleChildScrollView(
        child: StreamBuilder<CategoryList>(
            stream: _viewModel.outputCategory,
            builder: (context, snapshot) {
              int index = 0;
              if (snapshot. hasData) {
                products.addAll(snapshot.data!.psdata!.products!.toList());
              
              return Column(
                children: [
                  getTopCategoryList(),
                  snapshot.data != null
                      ? _getFilterList(snapshot.data!.psdata!.facets)
                      :const SizedBox(),
                  Wrap(
                    children: products.map((product) {
                      index++;
                      final Cover cover = Cover(product!.cover!.url.toString(),
                          product.cover!.width!, product.cover!.height!);
                      final ProductItem productItem = ProductItem(
                          product.id_product,
                          product.price,
                          product.name,
                          cover,
                          product.description,
                          product.description_short,
                          product.category_name);
                      if (index % 2 != 0) {
                        return GestureDetector(
                            onTap: () => _viewModel.openCategoryDetail(
                                context, product.id_product),
                            child: ProductItemWidget(productItem ));
                      } else {
                        return Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                                onTap: () => _viewModel.openCategoryDetail(
                                    context, product.id_product),
                                child: ProductItemWidget(productItem ))
                          ],
                        );
                      }
                    }).toList(),
                  ),
                ],
              );
           }else {
                return Center(
                  child: Column(
                    children: [
                  getTopCategoryList(),
                      Wrap(
                          children: List<int>.generate(10, (index) => index)
                              .map((e) {
                                return Column(
                                  children: [
                                      SizedBox(
                                      height: e % 2==0 ?AppSize.s20:0,
                                    )  ,
                                    Padding(padding: const EdgeInsets.all(AppPadding.p4),
                                      child: Card(
                                        child: ShimmerWidget(
                                            width: AppSize.s160,
                                            height: AppSize.s280,
                                            shapeBorder: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(AppSize.s4 ))),
                                      ),
                                    )
                                  ],
                                );
                              })
                              .cast<Column>()
                              .toList()),
                    ],
                  ),
                );
              } }),
      ),
    );
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
              _viewModel.getProducts(
                  Constants.mainCategoris[index].keys.first.toString());
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

Widget _getFilterList(List<Facets?>? facets) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      PopupMenuButton(
        child: Text("Filter"),
        itemBuilder: (BuildContext context) {
          List<PopupMenuEntry> filterList = [];
          filterList.addAll(
            facets!.map((filter) {
              return PopupMenuItem(
                child: Text(filter?.label ?? ''),
              );
            }).toList(),
          );

          return filterList;
        },
      ),
      SizedBox(
        width: 16,
      ),
      SizedBox(
        width: 300,
        child: _getSortList(),
      ),
    ],
  );
}

_getSortList() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: (() {}),
          icon: const Icon(Icons.arrow_downward_rounded),
          label: const Text(AppStrings.price),
        ),
        ElevatedButton.icon(
          onPressed: (() {}),
          icon: const Icon(Icons.arrow_downward_rounded),
          label: const Text(AppStrings.size),
        ),
        ElevatedButton(
          onPressed: (() {}),
          child: const Text(AppStrings.best),
        ),
         
      ],
    ),
  );
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import '../../../app/constant.dart';
import '../../../domain/models/product.dart';
import '../../main/home/home_page_viewmodel.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../../app/di.dart';
import '../../resources/values_manager.dart';
import '../../widgets/category_widget.dart';
import '../../widgets/product_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageViewModel _viewModel = instance<HomePageViewModel>();
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
    return _getContentWidgets();
  }

  Widget _getContentWidgets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getBanners(),
        _getCategoryList(),
        _getSection(AppStrings.product),
        _getTopProducts(),
        _getSection(AppStrings.category),
        _getTopCategories(),
        _getSection(''),
        _getSocialMediaButtomBar(),
      ],
    );
  }

  Widget _getTopCategories() {
    return Column(
        children: Constants.mainCategoris
            .map((category) => CategoryWidget(category.keys.first.toString(),
                Constants.categoryImages[category.values.first]!))
            .toList());
  }

  Widget _getTopProducts() {
    List<CategoryProductItem?>? products = [];
    return StreamBuilder<CategoryProductItem>(
        stream: _viewModel.outputProduct,
        builder: (context, snapshot) {
          int index = 0;
          if (snapshot.data != null) {
            products.add(snapshot.data);
          }
          return Center(
            child: Wrap(
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
                  return ProductItemWidget(productItem);
                } else {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      ProductItemWidget(productItem)
                    ],
                  );
                }
              }).toList(),
            ),
          );
        });
  }

  Widget _getBanners() {
    return CarouselSlider(
      items: Constants.bannarImages.values
          .map((banner) => SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: AppSize.s1_5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s12),
                      side: BorderSide(
                          color: ColorManager.white, width: AppSize.s1_5)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppSize.s12),
                    child: Image.network(
                      banner,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ))
          .toList(),
      options: CarouselOptions(
          height: AppSize.s180,
          autoPlay: true,
          enlargeCenterPage: true,
          enableInfiniteScroll: true),
    );
  }

  Widget _getSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(
          top: AppPadding.p2,
          left: AppPadding.p12,
          right: AppPadding.p12,
          bottom: AppPadding.p2),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  SizedBox _getCategoryList() {
    return SizedBox(
      height: AppSize.s56,
      child: ListView.separated(
          shrinkWrap: true,
          clipBehavior: Clip.antiAlias,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        top: AppSize.s8, left: AppSize.s4),
                    height: AppSize.s40,
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p2),
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        boxShadow: const [
                          BoxShadow(
                            spreadRadius: 0.9,
                            offset: Offset(-1, 2.5),
                            color: Color.fromARGB(255, 224, 224, 224),
                          )
                        ],
                        borderRadius: BorderRadius.circular(AppPadding.p2)),
                    child: Center(
                      child: Text(
                        Constants.categoryImages.keys.toList()[index],
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  ),
                ],
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: AppSize.s20,
              ),
          itemCount: Constants.categoryImages.keys.length),
    );
  }

  _getSocialMediaButtomBar() {
    return Row(
      children: [
        GFButton(
          onPressed: () {},
          icon: const Icon(Icons.facebook),
          type: GFButtonType.solid,
          fullWidthButton: true,
        ),
        GFButton(
          onPressed: () {},
          icon: const Icon(Icons.whatsapp),
          type: GFButtonType.solid,
          fullWidthButton: true,
        ),
        GFButton(
          onPressed: () {},
          icon: const Icon(Icons.mail),
          type: GFButtonType.solid,
          fullWidthButton: true,
        ),
        GFButton(
          onPressed: () {},
          icon: const Icon(Icons.youtube_searched_for),
          type: GFButtonType.solid,
          fullWidthButton: true,
        ),
      ],
    );
  }
}

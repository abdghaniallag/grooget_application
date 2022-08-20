import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../resources/assets_manager.dart';
import '../resources/values_manager.dart';
import '../widgets/product_widget.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Container(
                padding: const EdgeInsets.all(AppPadding.p12),
                child: TextFormField())),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: const ProductItem(),
        ));
  }
}

Widget getContent() {
  List<String> _category = [
    "Men",
    "Boys",
    "Baby Boys",
    "Women",
    "Girls",
    "Baby Girls",
  ];
  return Container(
    child: Row(children: [
      ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: ((context, index) =>
              getCategoryWidget(_category[index])),
          separatorBuilder: (context, index) => const SizedBox(
                height: AppPadding.p12,
              ),
          itemCount: 3),
    ]),
  );
}

Widget getCategoryWidget(String title) {
  return Container(
    height: AppSize.s100,
    width: AppSize.s100,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppSize.s20),
      boxShadow: [BoxShadow(offset: Offset.fromDirection(1, 5))],
    ),
    child: SizedBox(
      child: Column(
        children: [
          Text(title),
          const SizedBox(
            height: AppSize.s4,
          ),
          SizedBox(
              height: 60, width: 60, child: SvgPicture.asset(getImage(title))),
        ],
      ),
    ),
  );
}

String getImage(String category) {
  return ImageAssets.cameraIc;
}

import 'package:flutter/material.dart';
import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';
import '../../domain/models/product.dart';

class CartQuickAdd extends StatefulWidget {
  List<ImageSource?> images;
  List<CombinationsItem?> combinationsItems;
  List<Option?> options;

  CartQuickAdd(this.combinationsItems, this.options, this.images, {Key? key})
      : super(key: key);

  @override
  State<CartQuickAdd> createState() => _CartQuickAddState();
}

class _CartQuickAddState extends State<CartQuickAdd> {
  late List<int> packQuantity;
  @override
  void initState() {
    packQuantity = List<int>.filled(widget.combinationsItems.length, 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getGridBoard(context),
        TextButton(onPressed: (() {
          
        }), child:const Text(AppStrings.ok))
      ],
    );
  }

  Widget getGridBoard(BuildContext context) {
    return Wrap( direction: Axis.horizontal,
      children: [ 
        getColorRow(),
        const SizedBox(width: AppSize.s4),
        getSizesRow(),
        const SizedBox(width: AppSize.s1_5),
        getMinQuantityRow(context),
        const SizedBox(width: AppSize.s4),
        getPriceRow(context),
        const SizedBox(width: AppSize.s1_5),
        getPackQuantityRow(context),
      ],
    );
  }

  Column getImageRow() {
    List<SizedBox> imageRow = [SizedBox(child: Text(AppStrings.image))];
    imageRow.addAll((widget.images
        .map((image) => SizedBox(
              width: 50,
              height: 70,
              child: Card(
                child: Image.network(
                  image!.src,
                ),
              ),
            ))
        .toList()));
    return Column(children: imageRow);
  }

  Column getColorRow() {
    List<SizedBox> colorRow = [SizedBox(child: Text(AppStrings.color))];
    colorRow.addAll((widget.options
        .where((option) => option!.is_color_option == 1)
        .first!
        .items
        .map((item) => SizedBox(
            width: 50,
            height: 70,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.black),
                  borderRadius: BorderRadius.circular(50),
                  color: HexColor.fromHex(item!.hex_value)),
            )))
        .toList()));
    // if (colorRow.length < 2) {
    //   colorRow.clear();
    // } else {
    //   SizedBox item = colorRow[1];
    //   for (int i = 0; i < combinationsItems.length - 1; i++) {
    //     colorRow.add(item);
    //   }
    // }
    return Column(children: colorRow);
  }

  Column getSizesRow() {
    List<SizedBox> sizesRow = [SizedBox(child: Text(AppStrings.sizes))];
    sizesRow.addAll((widget.options
        .where((option) => option!.is_color_option == 0)
        .first!
        .items
        .map((item) => SizedBox(
              width: 50,
              height: 70,
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(item!.value, textAlign: TextAlign.justify),
              ),
            ))
        .toList()));
    if (sizesRow.length < 2) {
      sizesRow.clear();
    } else {
      SizedBox item = sizesRow[1];
      for (int i = 0; i < widget.combinationsItems.length - 1; i++) {
        sizesRow.add(item);
      }
    }
    return Column(children: sizesRow);
  }

  Column getMinQuantityRow(BuildContext context) {
    List<SizedBox> minQuantityRow = [SizedBox(child: Text(AppStrings.minQty))];
    minQuantityRow.addAll((widget.combinationsItems
        .map((combinationsItem) => SizedBox(
              width: 50,
              height: 70,
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.gray),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  combinationsItem!.minimal_quantity.toString(),
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ))
        .toList()));

    return Column(children: minQuantityRow);
  }

  Column getPriceRow(BuildContext context) {
    List<SizedBox> priceRow = [SizedBox(child: Text(AppStrings.price))];
    priceRow.addAll((widget.combinationsItems
        .map((combinationsItem) => SizedBox(
              width: 50,
              height: 70,
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  combinationsItem!.price,
                  style: Theme.of(context).textTheme.bodyText1,
                  maxLines: 1,
                ),
              ),
            ))
        .toList()));

    return Column(children: priceRow);
  }

  Column getPackQuantityRow(BuildContext context) {
    List<SizedBox> packQuantityRow = [
      const SizedBox(child: Text(AppStrings.packQuantity)),
    ];
    for (var i = 0; i < widget.combinationsItems.length; i++) {
      packQuantityRow.add(SizedBox(
          width: 100,
          height: 70,
          child: getAddRemoveWidget(i, widget.combinationsItems[i], context)));
    }

    return Column(children: packQuantityRow);
  }

  SizedBox getAddRemoveWidget(
      int index, CombinationsItem? combinationsItem, BuildContext context) {
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
                  _addToCart(combinationsItem!.minimal_quantity, index);
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
                  _removeFromCart(combinationsItem!.minimal_quantity, index);
                },
                icon: Icon(Icons.arrow_downward_rounded,
                    color: ColorManager.primary),
                label: const Text(''),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
                width: 60,
                height: 20,
                child: StreamBuilder<int>(
                  stream: null,
                  builder: (context, snapshot) {
                    
                    return Text(
                      "${packQuantity[index]}  ",
                      textAlign: TextAlign.center,
                    );
                  }
                )),
          ),
        ],
      ),
    );
  }

  void _addToCart(int minQty, int index) {
    setState(() {
      packQuantity[index] += minQty;
    });
  }

  void _removeFromCart(int minQty, int index) {
    setState(() {
      packQuantity[index] -= minQty;
      if (packQuantity[index] < 0) {
        packQuantity[index] = 0;
      }
    });
  }
}

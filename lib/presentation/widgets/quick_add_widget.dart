import 'package:flutter/material.dart';
import 'package:mvvm_first_c/presentation/resources/strings_manager.dart';
import 'package:mvvm_first_c/presentation/resources/values_manager.dart';

import '../../domain/models/product.dart';

class QuickAddBoard extends StatelessWidget {
  List<CombinationsItem?> combinationsItems;
  List<Option?> options;

  QuickAddBoard(this.combinationsItems, this.options, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return getGridBoard();
  }

  Widget getGridBoard() {
    return Column(
      children: [
        Row(
          children: const [
            Text(AppStrings.image),
            SizedBox(width: AppSize.s8),
            Text(AppStrings.color),
            SizedBox(width: AppSize.s8),
            Text(AppStrings.sizes),
            SizedBox(width: AppSize.s8),
            Text(AppStrings.minQty),
            SizedBox(width: AppSize.s8),
            Text(AppStrings.packQuantity),
          ],
        ),
        Column()
      ],
    );
  }

  Widget getCombinationRow() {
    return Row(
      children: [
        Text("Image"),
        Text(getOptionId(combinationsItems[0]!.combination_code)[0]),
        Text("Sizes"),
        Text("Min Qty	"),
        Text("Pack Quantity"),
      ],
    );
  }

  List<String> getOptionId(String combination_code) {
    String localCombinationCode = combination_code;
    List<String> option = List<String>.empty(growable: true);
    while (localCombinationCode.isNotEmpty) {
      if (combination_code.contains("_")) {
        option.add(localCombinationCode.substring(
            0, localCombinationCode.indexOf("_")));
        localCombinationCode = localCombinationCode
            .substring(localCombinationCode.indexOf("_") + 1);
      } else {
        option.add(localCombinationCode);
        localCombinationCode = "";
      }
    }
    return option;
  }
}

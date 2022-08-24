import 'package:flutter/material.dart';
import 'package:mvvm_first_c/presentation/resources/color_manager.dart';
import '../resources/values_manager.dart';

class SearchAppBar {
  AppBar getAppBar(TextEditingController controller, Function() onPressed,
          Widget label) =>
      AppBar(
          actions: [
            ElevatedButton.icon(
                onPressed: onPressed,
                icon: Icon(
                  Icons.search_rounded,
                  color: ColorManager.white,
                ),
                label: label)
          ],
          title: Container(
              padding: const EdgeInsets.all(AppPadding.p12),
              child: TextFormField(
                controller: controller,
              )));
}

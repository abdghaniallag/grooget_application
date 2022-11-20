import 'package:flutter/material.dart';
import 'package:mvvm_first_c/presentation/resources/strings_manager.dart';
import '../../presentation/resources/color_manager.dart';
import '../resources/values_manager.dart';

class SearchAppBar {
  AppBar getAppBar(TextEditingController controller, Function() onPressed) =>
      AppBar(
          actions: [
            ElevatedButton.icon(
                onPressed: onPressed,
                icon: Icon(
                  Icons.search_rounded,
                  color: ColorManager.white,
                ),
                label: const Text(""))
          ],
          title: Container(
              decoration: BoxDecoration(color: ColorManager.white,
                  borderRadius: BorderRadius.circular(AppSize.s8)),
              child: TextFormField(
                decoration: InputDecoration(hintText: AppStrings.search, fillColor: ColorManager.white),
                controller: controller,
              )));
}

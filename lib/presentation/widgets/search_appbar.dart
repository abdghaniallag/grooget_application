import 'package:flutter/material.dart';
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
              padding: const EdgeInsets.all(AppPadding.p12),
              child: TextFormField(
                controller: controller,
              )));
}

import 'package:flutter/material.dart';

import '../../resources/strings_manager.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _NotificationState();
}

class _NotificationState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppStrings.category),
    );
  }
}

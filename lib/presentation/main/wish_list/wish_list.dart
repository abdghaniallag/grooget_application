import 'package:flutter/material.dart';

import '../../resources/strings_manager.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  State<WishListPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<WishListPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppStrings.wishList),
    );
  }
}

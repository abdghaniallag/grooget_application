import 'package:flutter/material.dart';
import '../../presentation/main/cart/cart_page.dart';
import '../../presentation/main/home/home_page.dart';
import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/strings_manager.dart';
import '../../presentation/resources/values_manager.dart';

import '../widgets/search_appbar.dart';
import 'categories/categories_page.dart';
import 'search/search.dart';
import 'settings/setting.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pages = [
    HomePage(),
    CategoriesPage(),
    SearchPage(),
    CartPage(),
    SettingPage()
  ];
  List<String> titles = [
    AppStrings.home,
    AppStrings.category,
    AppStrings.search,
    AppStrings.cart,
    AppStrings.settings,
  ];
  int _currentIndex = 3;

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        appBar: SearchAppBar().getAppBar(_controller, search),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              pages[_currentIndex],
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: ColorManager.black, spreadRadius: AppSize.s1_5)
            ],
          ),
          child: BottomNavigationBar(
            selectedItemColor: ColorManager.primary,
            unselectedItemColor: ColorManager.gray,
            currentIndex: _currentIndex,
            onTap: onTap,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: AppStrings.home),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category_rounded),
                  label: AppStrings.category),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: AppStrings.search),
              BottomNavigationBarItem(
                  icon: Icon(Icons.card_travel_rounded),
                  label: AppStrings.cart),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: AppStrings.settings),
            ],
          ),
        ));
  }

  onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  search() {}
}

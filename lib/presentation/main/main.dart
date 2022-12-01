import 'package:flutter/material.dart';
import '../../presentation/main/cart/cart_page.dart';
import '../../presentation/main/home/home_page.dart';
import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/strings_manager.dart';
import '../../presentation/resources/values_manager.dart';
import 'categories/categories_page.dart';
import 'search/search.dart';
import 'wish_list/wish_list.dart';
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
    WishListPage(),
    CartPage(),
    SettingPage()
  ];
  List<String> titles = [
    AppStrings.home,
    AppStrings.category,
    AppStrings.search,
    AppStrings.wishList,
    AppStrings.cart,
    AppStrings.settings,
  ];
  int _currentIndex = 0;

  final TextEditingController _controller = TextEditingController();

  late FocusNode _focusNode;
  @override
  void initState() {
    _focusNode = FocusNode();
    super.initState();
  }
@override
  void dispose() { _focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        appBar: getAppBar(_controller),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            pages[_currentIndex],
          ],
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
                  icon: Icon(Icons.home_outlined), label: AppStrings.home),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category_outlined),
                  label: AppStrings.category),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search_outlined), label: AppStrings.search),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline_rounded),
                  label: AppStrings.wishList),
              BottomNavigationBarItem(
                  icon: Icon(Icons.card_travel_rounded),
                  label: AppStrings.cart),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  label: AppStrings.settings),
            ],
          ),
        ));
  }

  onTap(int index) {
    if (index == 2) {
      _focusNode.requestFocus();
    }
    setState(() {
      _currentIndex = index;
    });
  }

  AppBar getAppBar(TextEditingController controller) => AppBar(
      title: Container(
          decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(AppSize.s8)),
          child: TextFormField(
            style: TextStyle(color: ColorManager.darkPrimary),
            onTap: () => setState(() {
              _currentIndex = 2;
            }),focusNode: _focusNode,
            onEditingComplete: () {},
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search_outlined,
                color: ColorManager.primary,
              ),
              hintText: AppStrings.search,
            ),
            textCapitalization: TextCapitalization.characters,
            controller: controller,
          )));
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';

import '../../app/app_preferences.dart';
import '../../app/di.dart';
import '../../domain/repository.dart';
import '../../domain/usecase/product_search_usecase.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/values_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  _startDelay() {
    _timer = Timer(const Duration(seconds: 0), _goNext);
  }

  _goNext() async {
    await initProductModule();
    ProductDetailUseCase _productDetailUseCase =
        instance<ProductDetailUseCase>();
    (await _productDetailUseCase.execute("331")).fold((failure) {}, (product) {
      ProductRouteArguments productRouteArguments =
          ProductRouteArguments(product);
      Navigator.pushNamed(context, Routes.productDetailRoute,
          arguments: productRouteArguments);
    });
    // Navigator.pushReplacementNamed(context, Routes.loginRoute);
    // Navigator.pushReplacementNamed(context, Routes.productRoute);

    // _appPreferences.isUserLoggedIn().then((isUserLoggedIn) {
    //   if (isUserLoggedIn) {
    //     Navigator.pushReplacementNamed(context, Routes.mainRoute);
    //   } else
    //   {
    //     _appPreferences.isOnbordingViewed().then((isOnbordingViewed) {
    //       if (isOnbordingViewed) {
    //         Navigator.pushReplacementNamed(context, Routes.loginRoute);
    //       } else {
    //         Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
    //       }
    //     });
    //   }
    //   Navigator.pushReplacementNamed(context, Routes.loginRoute);
    // }
    // );
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(
        child: Image(image: AssetImage(ImageAssets.splashLogo)),
      ),
    );
  }
}

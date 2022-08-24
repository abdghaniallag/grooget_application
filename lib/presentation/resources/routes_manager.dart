import 'package:flutter/material.dart';
import 'package:mvvm_first_c/presentation/product/product_view.dart';
import '../../app/di.dart';
import '../../presentation/login/login.dart';
import '../../presentation/main/main.dart';
import '../../presentation/onBoarding/onBording.dart';
import '../../presentation/register/register.dart';
import '../../presentation/resources/strings_manager.dart';
import '../../presentation/splash/splash.dart';
import '../category/category_view.dart';
import '../forgot_password/forgot_password.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String categoriesRoute = "/categories";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/ForgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
  static const String productRoute = "/product";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.categoriesRoute:
        return MaterialPageRoute(builder: (_) => CategoryView());
      case Routes.productRoute:
        initProductModule();
        return MaterialPageRoute(builder: (_) => ProductView());
      case Routes.forgotPasswordRoute:
        initForgotPasswordModule();
        return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case Routes.registerRoute:
        initRegisterModule();
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.mainRoute:
        initHomeModule();
        return MaterialPageRoute(builder: (_) => MainView());
      default:
        return UnDefindeRoute();
    }
  }

  static Route<dynamic> UnDefindeRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.noRoutFound),
              ),
              body: Center(child: Text(AppStrings.noRoutFound)),
            ));
  }
}

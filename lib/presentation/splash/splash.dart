import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../presentation/resources/values_manager.dart';
import 'dart:async';
import '../../app/app_preferences.dart';
import '../../app/di.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration( seconds: DurationConstant.d3 ),  _goNext);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Container(
          color: ColorManager.primaryOpacity70,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Positioned(
                  bottom: AppPadding.p8,
                  width: AppSize.s400,
                  child: Lottie.asset(JsonAssets.loadingBall)),
              const Positioned(
                  top: AppPadding.p200,
                  width: AppSize.s300,
                  child: Image(image: AssetImage(ImageAssets.splashLogo))),
              const Positioned(
                  top: AppPadding.p100,
                  width: AppSize.s550,
                  child: Image(image: AssetImage(ImageAssets.splashTitle))),
            ],
          ),
        ),
      ),
    );
  }

  _goNext() async {
    final AppPreferences _appPreferences = instance<AppPreferences>();

    {
      {
        _appPreferences.isOnbordingViewed().then((isOnbordingViewed) {
          if (isOnbordingViewed) {
            Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
            // Navigator.pushReplacementNamed(context, Routes.mainRoute);
          } else {
            Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
          }
        });
      }
    }
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
}

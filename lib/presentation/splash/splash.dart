import 'package:flutter/material.dart'; 
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
    _timer = Timer(const Duration(milliseconds: DurationConstant.d500), _goNext);
  }

  _goNext() async {
    final AppPreferences _appPreferences = instance<AppPreferences>();

    {
      {
        _appPreferences.isOnbordingViewed().then((isOnbordingViewed) {
          if (isOnbordingViewed) {
            Navigator.pushReplacementNamed(context, Routes.mainRoute);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Container(
          color: ColorManager.primaryOpacity70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Image(image: AssetImage(ImageAssets.splashLogo)),
              Image(image: AssetImage(ImageAssets.splashTitle)),
            ],
          ),
        ),
      ),
    );
  }
}

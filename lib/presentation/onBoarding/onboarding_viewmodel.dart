import 'dart:async';
import '../../domain/model.dart';
import '../../presentation/base/base.dart';
import '../../presentation/resources/assets_manager.dart';
import '../../presentation/resources/strings_manager.dart';

class OnboardingViewModel extends BaseViewModel
    with OnboardingViewModelInputs, OnboardingViewModelOutputs {
// Strea Controllers
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _list; // = _getSliderData();

  int _currentIndex = 0;
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = _currentIndex++;
    if (nextIndex >= _list.length) {
      _currentIndex = 0;
    }
    _postDataToView();
    return _currentIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = _currentIndex--;

    if (previousIndex == -1) {
      _currentIndex = _list.length - 1;
    }
    _postDataToView();
    return _currentIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);
  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubTitle1, ImageAssets.onBoardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2,
            AppStrings.onBoardingSubTitle2, ImageAssets.onBoardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3,
            AppStrings.onBoardingSubTitle3, ImageAssets.onBoardingLogo3), 
      ];

  void _postDataToView() {
    inputSliderViewObject.add(
        SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }
}

abstract class OnboardingViewModelInputs {
  int goNext();
  int goPrevious();
  void onPageChanged(int index);
  Sink get inputSliderViewObject;
}

abstract class OnboardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;
  SliderViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}

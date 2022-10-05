import 'dart:async';
import 'dart:ffi';

import '../../../domain/usecase/homePageUsecase.dart';
import '../../../presentation/base/base.dart';
import '../../../presentation/state_renderer/state_renderer.dart';
import '../../../presentation/state_renderer/state_renderer_implimenter.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/models/user.dart';

class CartPageViewModel extends BaseViewModel
    with CartViewModelInputs, CartViewModelOutputs {
  HomeUseCase _CartUseCase;

  StreamController _CartObjectStreamController =
      BehaviorSubject<AcountInformation>();

  CartPageViewModel(this._CartUseCase);

  // inputs
  @override
  void start() {
    _getCart();
  }

  _getCart() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));

    (await _CartUseCase.execute(Void)).fold((failure) {
      inputState.add(ErrorState(
          StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
    }, (CartObject) {
      inputState.add(ContentState());
      // inputCart.add(CartData(
      //   CartObject.CartData.services,
      //   CartObject.CartData.stores,
      //   CartObject.CartData.banners,
      // ));
      inputCart.add(CartObject);
    });
  }

  @override
  void dispose() {
    _CartObjectStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputCart => _CartObjectStreamController.sink;

  @override
  Stream<AcountInformation> get outputCart =>
      _CartObjectStreamController.stream.map((CartData) => CartData);
}

abstract class CartViewModelInputs {
  Sink get inputCart;
}

abstract class CartViewModelOutputs {
  Stream<AcountInformation> get outputCart;
}

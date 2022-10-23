import 'dart:async';
import '../../../domain/models/cart.dart';
import '../../../domain/usecase/cart_usecase.dart';
import '../../../presentation/base/base.dart';
import '../../../presentation/state_renderer/state_renderer.dart';
import '../../../presentation/state_renderer/state_renderer_implimenter.dart';
import 'package:rxdart/rxdart.dart';

class CartPageViewModel extends BaseViewModel
    with CartViewModelInputs, CartViewModelOutputs {
  CartUseCase _cartUseCase;

  StreamController _cartObjectStreamController = BehaviorSubject<UserCart>();

  CartPageViewModel(this._cartUseCase);

  // inputs
  @override
  void start() {
    _getCart();
  }

  _getCart() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));

    (await _cartUseCase.execute(CartUseCaseInupt())).fold((failure) {
      inputState.add(ErrorState(
          StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
    }, (cartObject) {
      inputState.add(ContentState());

      inputCart.add(cartObject);
    });
  }

  @override
  void dispose() {
    _cartObjectStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputCart => _cartObjectStreamController.sink;

  @override
  Stream<UserCart> get outputCart =>
      _cartObjectStreamController.stream.map((cartData) => cartData);
}

abstract class CartViewModelInputs {
  Sink get inputCart;
}

abstract class CartViewModelOutputs {
  Stream<UserCart> get outputCart;
}

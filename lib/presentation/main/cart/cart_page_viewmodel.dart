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
    inputState.add(ContentState());
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

  @override
  addItem(String productId, String productAttributeId, int qty) async {
    (await _cartUseCase.execute(CartUseCaseInupt(
            action: 'update',
            update: '1',
            op: 'up',
            qty: qty,
            id_product: int.parse(productId),
            id_product_attribute:int.parse (productAttributeId))))
        .fold((failure) {
      inputState.add(ErrorState(
          StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
    }, (cartObject) {
      inputState.add(ContentState());

      inputCart.add(cartObject);
    });
  }

  @override
  deletItem(String productId, String productAttributeId) async {
   (await _cartUseCase.execute(CartUseCaseInupt(delete: 1,
            action: 'update',
            id_product: int.parse(productId),
            id_product_attribute:int.parse (productAttributeId))))
        .fold((failure) {
      inputState.add(ErrorState(
          StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
    }, (cartObject) {
      inputState.add(ContentState());

      inputCart.add(cartObject);
    });
  }

  @override
  removeItem(String productId, String productAttributeId, int qty) async {
   (await _cartUseCase.execute(CartUseCaseInupt(
            action: 'update',
            update: '1',
            op: 'down',
            qty: qty,
            id_product: int.parse(productId),
            id_product_attribute:int.parse (productAttributeId))))
        .fold((failure) {
      inputState.add(ErrorState(
          StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
    }, (cartObject) {
      inputState.add(ContentState());

      inputCart.add(cartObject);
    });
  }
}

abstract class CartViewModelInputs {
  Sink get inputCart;
  addItem(String productId, String productAttributeId, int qty);
  deletItem(String productId, String productAttributeId);
  removeItem(String productId, String productAttributeId, int qty);
}

abstract class CartViewModelOutputs {
  Stream<UserCart> get outputCart;
}

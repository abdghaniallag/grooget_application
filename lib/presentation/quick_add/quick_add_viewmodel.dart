import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../../domain/usecase/cart_usecase.dart';
import '../base/base.dart';
import '../state_renderer/state_renderer.dart';
import '../state_renderer/state_renderer_implimenter.dart';

class CartQuickAddViewModel extends BaseViewModel
    with CartQuickAddInputs, CartQuickAddOutputs {
  StreamController<int> _qtyStreamController = BehaviorSubject<int>();

  CartUseCase _cartUseCase;
  CartQuickAddViewModel(this._cartUseCase);

  @override
  addItem(int itemId, int qty,int itemAttributId, int lastqty, int index) async {
    //  add item to cart
    (await _cartUseCase.execute(CartUseCaseInupt(
            action: 'update',
            delete: 1,
            id_product: itemId,
            id_product_attribute: itemAttributId,
            op: 'up',
            qty: qty,
            update: '1')))
        .fold((failure) {
      inputState.add(ErrorState(
          StateRendererType.POPUP_ERROR_STATE, failure.message));
    }, (_) {
      inputState.add(ContentState());

      inputQTY.add(qty + lastqty);
    });
  }

  

  @override
  Sink get inputQTY => _qtyStreamController.sink;

  @override
  Stream<int> get outputQTY =>
      _qtyStreamController.stream.map((qtyAdded) => qtyAdded);

  @override
  removeItem(int itemId, int qty,int itemAttributId, int lastqty, int index) async {
   
    (await _cartUseCase.execute(CartUseCaseInupt(
            action: 'update',
            delete: 1,
            id_product: itemAttributId,
            id_product_attribute: itemId,
            op: 'down',
            qty: qty,
            update: '1')))
        .fold((failure) {
      inputState.add(ErrorState(
          StateRendererType.POPUP_ERROR_STATE, failure.message));
    }, (_) {
      inputState.add(ContentState());

      inputQTY.add(qty - lastqty);
    });
  }

  @override
  void start() {
    inputState.add(ContentState());
    
  }
}

abstract class CartQuickAddInputs {
  addItem(int itemId, int qty,int itemAttributId, int lastqty, int index);
  removeItem(int itemId, int qty,int itemAttributId, int lastqty, int index);
 
  Sink get inputQTY;
}

abstract class CartQuickAddOutputs {
  Stream<int> get outputQTY;
}

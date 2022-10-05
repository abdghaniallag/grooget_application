import 'dart:async';
import '../../domain/usecase/product_search_usecase.dart';
import 'package:rxdart/rxdart.dart';

import '../base/base.dart';

import '../../domain/models/product.dart';
import '../state_renderer/state_renderer.dart';
import '../state_renderer/state_renderer_implimenter.dart';

class ProductDetailViewModel extends BaseViewModel
    with ProductViewModelInputs, ProductViewModelOutputs {
  ProductDetailViewModel(this._productDetailUseCase);
  StreamController _productStreamController =
      BehaviorSubject<ProductInformation>();
  ProductDetailUseCase _productDetailUseCase;
  @override
  getProduct(String productId) async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));

    (await _productDetailUseCase.execute(productId)).fold((failure) {
      inputState.add(
          ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message));
    }, (data) {
      {
        inputState.add(ContentState());

        _productStreamController.add(data);
      }
    });
  }

  @override
  Sink get inputProduct => _productStreamController.sink;

  @override
  Stream<ProductInformation> get outputProduct =>
      _productStreamController.stream.map((product) => product);

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  addProductAttributeToCart(String idProductAttribute) {
    // TODO: implement addProductAttributeToCart
    throw UnimplementedError();
  }

  @override
  addProductToFavorit() {
    // TODO: implement addProductToFavorit
    throw UnimplementedError();
  }

  @override
  addProductToWishList() {
    // TODO: implement addProductToWishList
    throw UnimplementedError();
  }

  @override
  // TODO: implement outputCategoryTree
  Stream<List<String>> get outputCategoryTree => throw UnimplementedError();

  @override
  // TODO: implement outputProductQuantityInCart
  Stream<int> get outputProductQuantityInCart => throw UnimplementedError();

  @override
  removeProductAttributeFromCart(String idProductAttribute) {
    // TODO: implement removeProductAttributeFromCart
    throw UnimplementedError();
  }

  @override
  shareProduct() {
    // TODO: implement shareProduct
    throw UnimplementedError();
  }
}

abstract class ProductViewModelInputs {
  addProductToWishList();
  addProductToFavorit();
  shareProduct();
  addProductAttributeToCart(String idProductAttribute);
  removeProductAttributeFromCart(String idProductAttribute);
  getProduct(String productId);
  Sink get inputProduct;
}

abstract class ProductViewModelOutputs {
  Stream<int> get outputProductQuantityInCart;
  Stream<List<String>> get outputCategoryTree;
  Stream<ProductInformation> get outputProduct;
}

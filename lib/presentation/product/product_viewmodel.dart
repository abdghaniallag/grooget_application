import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../../domain/models/product.dart';
import '../../domain/usecase/product_search_usecase.dart';
import '../../presentation/base/base.dart';
import '../state_renderer/state_renderer.dart';
import '../state_renderer/state_renderer_implimenter.dart';

class ProductViewModel extends BaseViewModel
    with ProductViewModelInputs, ProductViewModelOutputs {
  StreamController _productStreamController =
      BehaviorSubject<ProductSearchList>();
  ProductSearchUseCase _productSearchUseCase;
  ProductViewModel(this._productSearchUseCase);
  @override
  Sink get inputProduct => _productStreamController.sink;

  @override
  Stream<ProductSearchList> get outputsProduct =>
      _productStreamController.stream.map((product) => product);

  @override
  void start() {
    inputState.add(ContentState());
  }

  _getProduct() async {
    int productCount = 0;
    while (productCount < 10) {
      (await _productSearchUseCase.execute((370 + productCount).toString()))
          .fold((failure) {
        productCount++;
        inputState.add(ErrorState(
            StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
      }, (product) {
        inputState.add(ContentState());

        inputProduct.add(product);
        productCount++;
      });
    }
  }

  @override
  void dispose() {
    _productStreamController.close();
    super.dispose();
  }

  @override
  search(String word) async {
    (await _productSearchUseCase.execute(word)).fold((failure) {
      inputState.add(ErrorState(
          StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
    }, (product) {
      inputState.add(ContentState());

      inputProduct.add(product);
    });
  }
}

abstract class ProductViewModelInputs {
  search(String word);
  Sink get inputProduct;
}

abstract class ProductViewModelOutputs {
  Stream<ProductSearchList> get outputsProduct;
}

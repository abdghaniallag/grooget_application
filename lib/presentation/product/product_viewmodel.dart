import 'dart:async';
import 'dart:math';
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
  StreamController _productDetailStreamController =
      BehaviorSubject<ProductInformation>();
  ProductSearchUseCase _productSearchUseCase;
  ProductDetailUseCase _productDetailUseCase;
  ProductViewModel(this._productSearchUseCase, this._productDetailUseCase);
  @override
  Sink get inputProduct => _productStreamController.sink;

  @override
  Stream<ProductSearchList> get outputsProduct =>
      _productStreamController.stream.map((product) => product);

  @override
  void start() {
    inputState.add(ContentState());
    search("bat");
  }

  _getProduct() async {
    int productCount = Random(300).nextInt(700);
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
    _productDetailStreamController.close();
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

  @override
  getProductDetail(String product_id) async {
    (await _productDetailUseCase.execute(product_id)).fold((failure) {
      inputState.add(ErrorState(
          StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
    }, (product) {
      inputState.add(ContentState());

      inputProductDetail.add(product);
    });
  }

  @override
  Sink get inputProductDetail => _productDetailStreamController.sink;

  @override
  Stream<ProductInformation> get outputsProductDetail =>
      _productDetailStreamController.stream.map((product) => product);
}

abstract class ProductViewModelInputs {
  search(String word);
  getProductDetail(String product_id);
  Sink get inputProduct;
  Sink get inputProductDetail;
}

abstract class ProductViewModelOutputs {
  Stream<ProductSearchList> get outputsProduct;
  Stream<ProductInformation> get outputsProductDetail;
}

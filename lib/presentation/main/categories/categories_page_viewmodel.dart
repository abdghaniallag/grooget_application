import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import '../../../app/constant.dart';
import '../../../domain/usecase/product_search_usecase.dart';
import '../../base/base.dart';
import '../../../domain/models/product.dart';
import '../../resources/routes_manager.dart';
import '../../state_renderer/state_renderer.dart';
import '../../state_renderer/state_renderer_implimenter.dart';

class CategoriesPageViewModel extends BaseViewModel
    with CategoriesPageModelInputs, CategoriesPageModelOutputs {
  CategoryUseCase _categoryUseCase;
  StreamController _categoryStreamController = BehaviorSubject<CategoryList>();
  StreamController _productStreamController =
      BehaviorSubject<CategoryProductItem>();

  CategoriesPageViewModel(this._categoryUseCase);

  // inputs
  @override
  void start() {
    _getHome();
  }

  _getHome() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
  }

  @override
  void dispose() {
    _categoryStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputCategory => _categoryStreamController.sink;

  @override
  Stream<CategoryList> get outputCategory =>
      _categoryStreamController.stream.map((cactegory) => cactegory);

  @override
  Stream<CategoryProductItem> get outputProduct =>
      _productStreamController.stream.map((product) => product);

  @override
  getProducts() async {
    for (var i = 0; i < 11; i++) {
      (await _categoryUseCase.execute("2", resultsPerPage: 1, page: i)).fold(
          (failure) {
        inputState.add(
            ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message));
      }, (category) {
        inputState.add(ContentState());
        inputProduct.add(category.psdata!.products?.first);
      });
    }
  }

  @override
  openProductDetail(BuildContext context, String id) {
    Navigator.pushNamed(context, Routes.productDetailRoute, arguments: id);
  }

  @override
  openCategoryDetail(BuildContext context, String id) {
    Navigator.pushNamed(context, Routes.categoriesRoute, arguments: id);
  }

  @override
  // TODO: implement inputProduct
  Sink get inputProduct => throw UnimplementedError();
}

abstract class CategoriesPageModelInputs {
  getProducts();
  openProductDetail(BuildContext context, String id);
  openCategoryDetail(BuildContext context, String id);
  Sink get inputCategory;
  Sink get inputProduct;
}

abstract class CategoriesPageModelOutputs {
  Stream<CategoryList> get outputCategory;
  Stream<CategoryProductItem> get outputProduct;
}

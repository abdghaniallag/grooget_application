import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
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
  bool _isResponsRecived=false;
  late ScrollController scrollViewController;
  CategoriesPageViewModel(this._categoryUseCase);
  String categoryId='10';
  int resultPage=1;
  @override
  void start() {
    scrollViewController = ScrollController()
      ..addListener(() {
        _loadProducts();
      });
    _getHome();
  }

  _getHome() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    getProducts("10" ); 
  }

  @override
  void dispose() {
    _categoryStreamController.close();
    scrollViewController.dispose();
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
_loadProducts()  {
  log(_isResponsRecived.toString());
    if (scrollViewController.position.extentAfter < 500 && _isResponsRecived)   {
        getProducts(categoryId,resultsPerPage:20, page: resultPage );
    }
  }
  @override
  getProducts(String categoryId, {resultsPerPage = 20, int page = 1}) async {
    { inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
      
        _isResponsRecived=false;
      (await _categoryUseCase.execute(categoryId,
              resultsPerPage: resultsPerPage, page: page))
          .fold((failure) {
        _isResponsRecived=true;
        inputState.add(
            ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message));
      }, (category) {
        _isResponsRecived=true;
        inputState.add(ContentState());
        inputCategory.add(category);
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
  getProducts(String categoryId, {int page = 0});
  openProductDetail(BuildContext context, String id);
  openCategoryDetail(BuildContext context, String id);
  Sink get inputCategory;
  Sink get inputProduct;
}

abstract class CategoriesPageModelOutputs {
  Stream<CategoryList> get outputCategory;
  Stream<CategoryProductItem> get outputProduct;
}

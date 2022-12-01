import 'dart:async';
import 'package:flutter/material.dart';
import '../../resources/routes_manager.dart';

import '../../../domain/models/product.dart';
import '../../../domain/usecase/product_search_usecase.dart';
import '../../../app/constant.dart';
import '../../base/base.dart';
import '../../state_renderer/state_renderer.dart';
import '../../state_renderer/state_renderer_implimenter.dart';
import 'package:rxdart/rxdart.dart';

class HomePageViewModel extends BaseViewModel
    with HomeViewModelInputs, HomeViewModelOutputs {
  CategoryUseCase _categoryUseCase;
  ProductDetailUseCase _productUseCase;
  StreamController _categoryStreamController = BehaviorSubject<CategoryList>();

  StreamController _productDetailStreamController =
      StreamController<ProductInformation>.broadcast();

  late ScrollController scrollViewController;

  HomePageViewModel(this._categoryUseCase, this._productUseCase);
  int resultPageNumber = 0;
  int resultPagesCaount = 0;
  // inputs
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
    getProducts(50);
    // _getCategories();
  }

  _loadProducts() {
    if (scrollViewController.position.extentAfter < 500) {
      getProducts(50);
    }
  }

  @override
  void dispose() {
    scrollViewController.dispose();
    _categoryStreamController.close();
    _productDetailStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputCategory => _categoryStreamController.sink;

  @override
  Sink get inputProduct => _categoryStreamController.sink;
  @override
  Sink get inputProductDetail => _productDetailStreamController.sink;

  @override
  Stream<CategoryList> get outputCategory =>
      _categoryStreamController.stream.map((cactegory) => cactegory);
  @override
  Stream<ProductInformation> get outputProductDetail =>
      _productDetailStreamController.stream.map((cactegory) => cactegory);

  @override
  Stream<CategoryList> get outputProduct =>
      _categoryStreamController.stream.map((product) => product);

  void _getCategories() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    for (var element in Constants.mainCategoris) {
      (await _categoryUseCase.execute(element.keys.first.toString())).fold(
          (failure) {
        inputState.add(ErrorState(
            StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
      }, (category) {
        inputState.add(ContentState());
        inputCategory.add(category);
      });
    }
  }

  @override
  getProducts(int resultsPerPage) async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    {
      String mainCategory = '2';
      if (resultPageNumber<=resultPagesCaount) {
      (await _categoryUseCase.execute(mainCategory,
              resultsPerPage: resultsPerPage, page: resultPageNumber))
          .fold((failure) {
        inputState.add(ErrorState(
            StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
      }, (category) {
        if (resultPagesCaount == 0) {
          resultPagesCaount = category.psdata?.pagination?.pages_count ?? 0;
        }
        resultPageNumber++;
        inputState.add(ContentState());
        inputProduct.add(category);
      });
        
      }
    }
  }

  @override
  getProductdetail(String id) async {
    {
      (await _productUseCase.execute(id)).fold((failure) {
        inputState.add(ErrorState(
            StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
      }, (product) {
        inputState.add(ContentState());
        inputProductDetail.add(product);
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
}

abstract class HomeViewModelInputs {
  getProducts(int resultsPerPage);
  getProductdetail(String id);
  openProductDetail(BuildContext context, String id);
  openCategoryDetail(BuildContext context, String id);
  Sink get inputCategory;
  Sink get inputProduct;
  Sink get inputProductDetail;
}

abstract class HomeViewModelOutputs {
  Stream<CategoryList> get outputCategory;
  Stream<CategoryList> get outputProduct;
  Stream<ProductInformation> get outputProductDetail;
}

import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../models/product.dart';
import '../repository.dart';
import 'base_usecase.dart';

class ProductSearchUseCase extends BaseUseCase<String, ProductSearchList> {
  Repository _repository;
  ProductSearchUseCase(this._repository);
  @override
  Future<Either<Failure, ProductSearchList>> execute(String s,
      {String resultsPerPage = "5"}) async {
    return await _repository.getProductSearchList(s, resultsPerPage: "5");
  }
}

class ProductDetailUseCase extends BaseUseCase<String, ProductInformation> {
  Repository _repository;
  ProductDetailUseCase(this._repository);
  @override
  Future<Either<Failure, ProductInformation>> execute(String s) async {
    return await _repository.getProductInformation(s);
  }
}

class CategoryUseCase extends BaseUseCase<String, CategoryList> {
  Repository _repository;
  CategoryUseCase(this._repository);
  @override
  Future<Either<Failure, CategoryList>> execute(String productId,
      {int page = 0,
      int resultsPerPage = 1,
      int with_category_tree = 0}) async {
    return await _repository.getCategoryList(productId,
        page: page,
        resultsPerPage: resultsPerPage,
        with_category_tree: with_category_tree);
  }
}
